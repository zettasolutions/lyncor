using zsi.DataAccess;
using zsi.DataAccess.Provider.SQLServer;
using System.Data.SqlClient;

namespace lyncor.Models
{
    using System;
    using System.Collections.Generic;

    public class PageData:page_template_v
    {
        public int page_js_rev_no { get; set; }
        public int zsi_lib_rev_no { get; set; }
        public int app_start_js_rev_no { get; set; }
        public string master_page_name { get; set; }
        public string role { get; set; }
    }

    public class dcPageData : MasterDataController<PageData>
    {
        public override void InitDataController()
        {
            this.DBConn = new SqlConnection(dbConnection.ConnectionString);
            Procedure p = new Procedure("dbo.page_data_sel");
            p.Parameters.Add("user_id", SessionHandler.CurrentUser.user_id);
            this.Procedures.Add(p, SQLCommandType.SingleRecord);

        }
        public PageData GetData(string pageName) {
            if (pageName !=null)
            {
                SProcParameters p = new SProcParameters();
                p.Add("page_name", pageName);
                p.Add("user_id", SessionHandler.CurrentUser.user_id);
                return this.GetInfo(p);
            }
            else
                return new PageData();
        }
    }
}
