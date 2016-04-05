using lyncor.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace lyncor.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
             dcAppProfile dc = new dcAppProfile();
             appProfile info = dc.GetInfo();
            if (info.default_page != null)
                return Redirect(Url.Content("~/") + "page/name/" + info.default_page);
            else {
                return View();
            }
        }
        public ActionResult SignIn()
        {

            if ((bool)(Session["IsEntered"] ?? false))
            {
                Session["IsEntered"] = false;
                return Redirect(Url.Content("~/") );
            }
            else
            {
                Session["IsEntered"] = true;
                return new HttpUnauthorizedResult();
            }

        }
    }
}