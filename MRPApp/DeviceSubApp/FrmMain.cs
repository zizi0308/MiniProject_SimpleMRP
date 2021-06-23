using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
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
        }

        private void Client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            try
            {
                var message = Encoding.UTF8.GetString(e.Message);    // UTF-8로 인코딩(파이썬에서 UTF-8로 설정했으니까 똑같이 맞춰줌)
                UpdateText($">>>>> 받은 메세지 : {message}");
            }
            catch (Exception ex)
            {
                UpdateText($">>>>> ERROR! : {ex.Message}");
            }
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
            if (RtbSubscr.InvokeRequired)
            {
                UpdateTextCallback callback = new UpdateTextCallback(UpdateText);
                this.Invoke(callback, new object[] { message });
            }
            else
            {
                RtbSubscr.AppendText(message + "\n");
                RtbSubscr.ScrollToCaret();          //화면 찼을 때 스크롤 생성 후 내려가기
            }
        }
    }
}
