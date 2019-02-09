using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GeneratePDF
{
    public partial class load : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string GetPDFData()
        {
            return Convert.ToBase64String(File.ReadAllBytes(AppDomain.CurrentDomain.BaseDirectory + "Test.pdf"));
        }


    }
}