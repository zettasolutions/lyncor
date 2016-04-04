﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using zsi.DataAccess;
using zsi.DataAccess.Provider.SQLServer;
using System.Data.SqlClient;

namespace lyncor.Models
{
    public class dcJavaScript : MasterDataController<javascript_v>
    {
        public override void InitDataController()
        {
            this.DBConn = new SqlConnection(dbConnection.ConnectionString);
            string spSelect = "dbo.javascripts_sel";
            this.Procedures.Add(new Procedure(spSelect), SQLCommandType.SingleRecord);
            this.Procedures.Add(new Procedure(spSelect), SQLCommandType.Select);
            this.Procedures.Add(new Procedure("dbo.javascripts_upd"), SQLCommandType.Update);

        }

        public List<javascript_v> CreateBackup(bool selfBackup) {
            if(selfBackup) this.SelectParameters.Add("self_backup", 1);
           return this.GetDataSource();
        }

        public javascript_v GetInfo(string pageName)
        {
            this.SelectInfoParameters.Add("page_name", pageName);
            return this.GetInfo();
        }
    }
}