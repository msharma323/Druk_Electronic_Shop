using System;
using System.Web;
using System.Web.UI;

namespace Electronics_shop
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Add jQuery script mapping
            string jqueryVersion = "3.6.0";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/jquery-" + jqueryVersion + ".min.js",
                    DebugPath = "~/Scripts/jquery-" + jqueryVersion + ".js",
                    CdnPath = "https://ajax.googleapis.com/ajax/libs/jquery/" + jqueryVersion + "/jquery.min.js",
                    CdnDebugPath = "https://ajax.googleapis.com/ajax/libs/jquery/" + jqueryVersion + "/jquery.js",
                    CdnSupportsSecureConnection = true,
                    LoadSuccessExpression = "window.jQuery"
                });
        }
    }
}