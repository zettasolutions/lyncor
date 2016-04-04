using System.Web;

using lyncor.Models;
namespace lyncor
{
    public static class SessionHandler
    {
        public static user CurrentUser
        {
            get
            {
                if (HttpContext.Current.Session["User"] == null)
                { return new user(); }
                else
                { return (user)HttpContext.Current.Session["User"]; }
            }
            set
            { HttpContext.Current.Session["User"] = value; }

        }

        
        

    }
}
