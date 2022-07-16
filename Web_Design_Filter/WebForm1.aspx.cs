using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Design_Filter
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static dynamic Datainput_()
        {
            List<string> list = new List<string>();
            list.Add("Asia");
            list.Add("Europe");
            list.Add("South_America");
            list.Add("North_America");
            return list;
        }

        [WebMethod]
        public static dynamic Type_File(string data)
        {
            switch (data)
            {
                case "Europe":
                    {
                        List<string> list = new List<string>();
                        list.Add("Hungary");
                        list.Add("Belarus");
                        list.Add("Austria");
                        list.Add("Serbia");
                        list.Add("Switzerland");
                        return list;
                    }
                    break;

                default:
                    {
                        List<string> list = new List<string>();
                        list.Add("Country");
                        return list;
                    }
                    break;
            }
        }
    }
}