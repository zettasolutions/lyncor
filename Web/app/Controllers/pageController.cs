using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using lyncor.Models;
using zsi.DataAccess;
using zsi.DataAccess.Provider.SQLServer;
using zsi.Framework.Common;
using System.Data;
using System.Data.SqlClient;

namespace lyncor.Controllers
{
    public class pageController : baseController
    {

        // GET: Page
        public ActionResult Index()
        {
            setPageLinks("admin");
            return View();
        }

        public ActionResult name(string param1)
        {
            string devURL = "zsiuserlogin";
            if (param1 == "signin")
            {
                Session["zsi_login"] = "N";
                Session["authNo"] = null;
                Response.Cookies["zsi_login"].Expires = DateTime.Now.AddDays(-2);
                Session.Abandon();
            }
            if (param1.ToLower() != devURL && param1.ToLower() != "signin")
            {
                if (getAuthNo() == 999)
                {
                    if (Session["zsi_login"].ToString() == "N")
                        return Redirect( Url.Content("~/") + "page/name/" + devURL);
                }
            }
            setPageLinks(param1);
            return View();
        }


        private int getAuthNo()
        {
            string key = "authNo";
            if (Session[key] == null) Session[key] = DataHelper.getDbValue("select dbo.getAuthNo(" + this.CurrentUser.user_id + ")");
            return Convert.ToInt32("0" + Session[key]);
        }



        [HttpPost]
        public ActionResult loginAdmin()
        {
            if (Request["user_name"] == "zsidev" && Request["user_pwd"] == "1&7TBbyX")
            {
                dcAppProfile dc = new dcAppProfile();
                appProfile info = dc.GetInfo();

                Session["zsi_login"] = "Y";
                Response.Cookies["zsi_login"].Value = "Y";
                Response.Cookies["zsi_login"].Expires = DateTime.Now.AddDays(1);

                if (info.default_page!=null)
                    return Redirect(Url.Content("~/") + "page/name/" + info.default_page);
                else
                    return Redirect( Url.Content("~/"));

            }
            else {
                Session["zsi_login"] ="N";
                return Redirect( Url.Content("~/") + "page/name/zsiUserLogin");
            }

        }


        [HttpPost]
        public ActionResult loginUser()
        {
            dcUsers _dcUser = new dcUsers();
            string userName = Request["user_name"];
            if (_dcUser.validateUser(userName, Request["user_pwd"])){
                this.FormAuth.CreateUserSession(userName, true);
                dcAppProfile dc = new dcAppProfile();
                appProfile info = dc.GetInfo();

                if (info.default_page != null)
                    return Redirect(Url.Content("~/") + "page/name/" + info.default_page);
                else
                    return Redirect(Url.Content("~/"));
            }
            else
                return Redirect(Url.Content("~/") + "page/name/signin?msg=Access Denied!");
        }


        [HttpPost, ValidateInput(false)]
        public JsonResult update(List<page> list)
        {
            return Json( DataHelper.dataTableUpdate("dbo.pages_upd", CollectionHelper.toDataTable(list) ) );
        }

       
    }
}