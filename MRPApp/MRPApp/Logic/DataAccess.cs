using MRPApp.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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

            using (var ctx = new MRPEntities())
                list = ctx.Settings.ToList();           // select
            
            return list;
        }

        public static int SetSettings(Settings item)
        {
            using (var ctx = new MRPEntities())
            {
                ctx.Settings.AddOrUpdate(item);             // insert or update
                return ctx.SaveChanges();                   // 커밋
            }
        }

        public static int DelSettings(Settings item)      // 파라미터를 아이템으로 통일하면 쓰기 좋음
        {
            using (var ctx = new MRPEntities())
            {
                var obj = ctx.Settings.Find(item.BasicCode);    // 검색한 데이터를 obj로 만들어서 삭제함(검색한 실제 데이터를 삭제)
                ctx.Settings.Remove(obj);                       // delete
                return ctx.SaveChanges();
            }
        }

        internal static List<Schedules> GetSchedules()
        {
            List<Model.Schedules> list;                  // setting과 schedule을 함께 같은 변수(list)로 지칭(일반화)

            using (var ctx = new MRPEntities())
                list = ctx.Schedules.ToList();           // select

            return list;
        }

        internal static int SetSchedule(Schedules item)
        {
            using (var ctx = new MRPEntities())
            {
                ctx.Schedules.AddOrUpdate(item);            // insert or update
                return ctx.SaveChanges();                   // 커밋
            }
        }
    }
}
