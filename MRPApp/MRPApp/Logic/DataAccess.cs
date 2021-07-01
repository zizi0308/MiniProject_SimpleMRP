using MRPApp.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MRPApp.Logic
{
    public class DataAccess
    {
        // 셋팅테이블에서 데이터 가져오기
        public static List<Settings> GetSettings()
        {
            List<Model.Settings> list;

            using (var ctx = new MRPEntities2())
                list = ctx.Settings.ToList();           // select
            
            return list;
        }

        public static int SetSettings(Settings item)
        {
            using (var ctx = new MRPEntities2())
            {
                ctx.Settings.AddOrUpdate(item);             // insert or update
                return ctx.SaveChanges();                   // 커밋
            }
        }

        public static int DelSettings(Settings item)      // 파라미터를 아이템으로 통일하면 쓰기 좋음
        {
            using (var ctx = new MRPEntities2())
            {
                var obj = ctx.Settings.Find(item.BasicCode);    // 검색한 데이터를 obj로 만들어서 삭제함(검색한 실제 데이터를 삭제)
                ctx.Settings.Remove(obj);                       // delete
                return ctx.SaveChanges();
            }
        }

        internal static List<Schedules> GetSchedules()
        {
            List<Model.Schedules> list;                  // setting과 schedule을 함께 같은 변수(list)로 지칭(일반화)

            using (var ctx = new MRPEntities2())
                list = ctx.Schedules.ToList();           // select

            return list;
        }

        internal static int SetSchedule(Schedules item)
        {
            using (var ctx = new MRPEntities2())
            {
                ctx.Schedules.AddOrUpdate(item);            // INSERT | UPDATE
                return ctx.SaveChanges();                   // COMMIT
            }
        }

        internal static List<Process> GetProcesses()
        {
            List<Model.Process> list;

            using (var ctx = new MRPEntities2())
                list = ctx.Process.ToList();    // SELECT

            return list;
        }

        internal static int SetProcess(Process item)
        {
            using (var ctx = new MRPEntities2())
            {
                ctx.Process.AddOrUpdate(item);  // INSERT | UPDATE
                return ctx.SaveChanges();       // COMMIT
            }
        }

        internal static List<Report> GetReportDatas(string startDate, string endDate, string plantCode)
        {
            var connString = ConfigurationManager.ConnectionStrings["MRPConnString"].ToString();
            var list = new List<Report>();

            using (var conn = new SqlConnection(connString))
            {
                conn.Open();    // 반드시 넣어야 함
                var sqlQuery = $@"SELECT sch.SchIdx, sch.PlantCode, sch.SchAmount, prc.PrcDate,
                                       prc.PrcOkAmount, prc.PrcFailAmount
                                  FROM Schedules AS sch
                                 INNER JOIN(
                                     SELECT smr.SchIdx, smr.PrcDate,
                                           SUM(smr.PrcOk) AS PrcOkAmount, SUM(smr.PrcFail) AS PrcFailAmount

                                       FROM(
                                             SELECT p.SchIdx, p.PrcDate,
                                                    CASE p.PrcResult WHEN 1 THEN 1 ELSE 0 END AS PrcOk,
                                                    CASE p.PrcResult WHEN 0 THEN 1 ELSE 0 END AS PrcFail

                                               FROM Process AS p
                                           ) AS smr
                                      GROUP BY smr.SchIdx, smr.PrcDate
                                 )  AS prc
                                    ON sch.SchIdx = prc.SchIdx
                                 WHERE sch.PlantCode = '{plantCode}'
                                   AND prc.PrcDate BETWEEN '{startDate}' AND '{endDate}'";

                SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tmp = new Report
                    {
                        SchIdx = (int)reader["SchIdx"],
                        PlantCode = reader["PlantCode"].ToString(),
                        PrcDate = DateTime.Parse(reader["PrcDate"].ToString()),
                        SchAmount = (int)reader["SchAmount"],
                        PrcOkAmount = (int)reader["PrcOkAmount"],
                        PrcFailAmount = (int)reader["PrcFailAmount"]
                    };
                    list.Add(tmp);
                }
            }
            return list;
        }
    }
}
