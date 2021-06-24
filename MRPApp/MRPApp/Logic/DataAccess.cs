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
            List<Model.Settings> settings;

            using (var ctx = new MRPEntities())
                settings = ctx.Settings.ToList();           // select
            
            return settings;
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
    }
}
