using zsi.DataAccess;
using zsi.DataAccess.Provider.SQLServer;
using System.Data.SqlClient;

namespace lyncor.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class user
    {
        public int user_id { get; set; }
        public string user_name { get; set; }
        public string last_name { get; set; }
        public string first_name { get; set; }
        public string middle_name { get; set; }
        public string password { get; set; }
    }

    public class dcUsers : MasterDataController<user>
    {
        public override void InitDataController()
        {
            this.DBConn = new SqlConnection(dbConnection.ConnectionString);
            Procedure p = new Procedure("dbo.users_sel");
            this.Procedures.Add(p, SQLCommandType.SingleRecord);

        }
        public Boolean validateUser(string userName,string password)
        {

            SProcParameters p = new SProcParameters();
            p.Add("user_name", userName);
            user info = this.GetInfo(p);
            if (info.password == password)
            {
                SessionHandler.CurrentUser = info;
                return true;
            }
            else
                return false;
        }
    }
}
