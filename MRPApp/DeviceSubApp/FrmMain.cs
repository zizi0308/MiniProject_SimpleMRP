using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Net;
using System.Text;
using System.Windows.Forms;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace DeviceSubApp
{
    public partial class FrmMain : Form
    {
        MqttClient client;
        string connectionString; // DB연결 문자열 | MQTT Broker address
        ulong lineCount;         // richTextBox의 라인넘버를 식별
        delegate void UpdateTextCallback(string message);   // 스레드 상의 충돌을 방지하기 위함 (Winform richtextbox 텍스트 출력필요) 대리자 생성

        Stopwatch sw = new Stopwatch();       // 스탑워치사용

        public FrmMain()
        {
            InitializeComponent();      // 생성자생성
            InitializeAllData();        // 화면상에서 우리가 만들었던 변수들을 초기화 하기위해
        }

        private void InitializeAllData()
        {
            connectionString = "Data Source=" + TxtConnectionString.Text + ";Initial Catalog=MRP;" +
                "Persist Security Info=True;User ID=SA;password=msspl_p@ssw0rd!";
            lineCount = 0;
            BtnConnect.Enabled = true;      // 처음에 실행됬을 때 연결버튼을 누르면 연결이 됨
            BtnDisconnect.Enabled = false;
            IPAddress brokerAddress;

            try
            {
                brokerAddress = IPAddress.Parse(TxtConnectionString.Text);  // 숫자를 IPStirng으로 바꿔줌(string값으로 parsing)
                client = new MqttClient(brokerAddress);        // 새로운 클라이언트 생성
                client.MqttMsgPublishReceived += Client_MqttMsgPublishReceived; // += 탭2번 시 생성 subscribe와 거의 같은 역할
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            Timer.Enabled = true;
            Timer.Interval = 1000;  // 1초
            Timer.Tick += Timer_Tick;
            Timer.Start();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            // 메세지 생성부분
            LblResult.Text = sw.Elapsed.Seconds.ToString();
            if (sw.Elapsed.Seconds >= 2)
            {
                sw.Stop();
                sw.Reset();
                //TODO 실제처리프로세스
                // UpdateText("처리");
                // 실제 들어온 데이터들 중 정확한 것만 넣고 나머지는 초기화 PrcCorrectDataToDB();
                PrcCorrectDataToDB();
            }
        }

        // 실제 데이터 중 최종데이터만 DB에 입력하는 메서드
        private void PrcCorrectDataToDB()
        {
            if (iotData.Count > 0)
            {
                var correctData = iotData[iotData.Count - 1];
                // DB에 입력
                //UpdateText("DB처리");
                using (var conn = new SqlConnection(connectionString))
                {
                    var prcResult = correctData["PRC_MSG"] == "OK" ? 1 : 0;
                    string strUpQry = $"UPDATE Process " +
                                      $"   SET PrcResult = '{prcResult}' " +
                                      $"     , ModDate = '{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}' " +
                                      $"     , ModID = '{"SYS"}' " +
                                      $" WHERE PrcIdx = " +
                                      $" (SELECT TOP 1 PrcIdx FROM Process ORDER BY PrcIdx DESC)";

                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand(strUpQry, conn);
                        if (cmd.ExecuteNonQuery() == 1)
                            UpdateText("[DB] 센싱값 Update 성공");
                        else
                            UpdateText("[DB] 센싱값 Update 실패");
                    }
                    catch (Exception ex)
                    {
                        UpdateText($">>>>> DB ERROR! : {ex.Message}");
                    }
                }
            }

            iotData.Clear();    // 데이터 모두 삭제
        }

        // MQTT 브로커(내부적 소켓)
        private void Client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            try
            {
                var message = Encoding.UTF8.GetString(e.Message);    // UTF-8로 인코딩(파이썬에서 UTF-8로 설정했으니까 똑같이 맞춰줌)
                UpdateText($">>>>> 받은 메세지 : {message}");
                // message(json) > C#
                var currentData = JsonConvert.DeserializeObject<Dictionary<string, string>>(message); // 데이터를 받을 때는 역직렬화(Deserialize) json으로바뀜(key, value)
                PrcInputDataToList(currentData);    // 중요한 프로세스이기 때문에 Prc를 앞에 붙여줌

                sw.Stop(); // 메세지 하나 올때마다 reset하고 start
                sw.Reset();
                sw.Start();

            }
            catch (Exception ex)
            {
                UpdateText($">>>>> ERROR! : {ex.Message}");
            }
        }

        List<Dictionary<string, string>> iotData = new List<Dictionary<string, string>>();

        // 라즈베리에서 들어온 메세지를 전역리스트에 입력하는 메서드
        private void PrcInputDataToList(Dictionary<string, string> currentData)
        {
            if (currentData["PRC_MSG"] == "OK" || currentData["PRC_MSG"] == "FAIL")
                iotData.Add(currentData);
        }

        private void BtnConnect_Click(object sender, EventArgs e)
        {
            client.Connect(TxtClientID.Text); // SUBSRC01 >> 연결
            UpdateText(">>>>> Client Connected\n"); // 연결됬을 때 텍스트메세지 추가
            client.Subscribe(new string[] { TxtSubscriptionTopic.Text },    // 발행한 것(Topic : factory 등)을 받을 때 처리 >> Topic은 string배열
                new byte[] { MqttMsgBase.QOS_LEVEL_AT_MOST_ONCE });    // 발행한 것(color data)을 받을 때 처리(enum으로 받음), QOS_LEVEL_AT_MOST_ONCE >> 이 값이 0이 됨
            UpdateText(">>>>> Subscribing to : " + TxtSubscriptionTopic.Text);

            BtnConnect.Enabled = false;
            BtnDisconnect.Enabled = true;
        }

        private void BtnDisconnect_Click(object sender, EventArgs e)
        {
            client.Disconnect();
            UpdateText(">>>>> Client Disconnected!\n");

            BtnConnect.Enabled = true;
            BtnDisconnect.Enabled = false;
        }

        private void UpdateText(string message)
        {
            // RtbSubscr 리치텍스트 UI
            if (RtbSubscr.InvokeRequired)
            {
                UpdateTextCallback callback = new UpdateTextCallback(UpdateText);
                this.Invoke(callback, new object[] { message });
            }
            else
            {
                lineCount++;
                RtbSubscr.AppendText($"{lineCount} : {message}\n");
                RtbSubscr.ScrollToCaret();          //화면 찼을 때 스크롤 생성 후 내려가기
            }
        }
    }
}
