using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GeneratePDF
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                string imageFolder = Server.MapPath("~/image/");
                if (!Directory.Exists(imageFolder))
                {
                    Directory.CreateDirectory(imageFolder);
                }
                string imagePath = imageFolder + Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(imagePath);
                imgControl.ImageUrl = "~/image/"+ Path.GetFileName(FileUpload1.FileName);
            }
            catch
            {

            }
        }

        protected void btnGeneratePdf_Click(object sender, EventArgs e)
        {
            APToolkitNET.Toolkit a = new APToolkitNET.Toolkit();
            string imagePath = System.AppDomain.CurrentDomain.BaseDirectory;
            int outputFile = a.OpenOutputFile(imagePath + "Test.pdf");
            a.OutputPageHeight = 792.0f;
            a.OutputPageWidth = 612.0f;
            var images = Directory.EnumerateFiles(imagePath + "image", "*.*", SearchOption.AllDirectories)
                .Where(s => s.EndsWith(".jpg") || s.EndsWith(".png") || s.EndsWith(".gif") || s.EndsWith(".tiff"));
            int pageNumber = 1;            
            foreach (string image in images)
            {
                a.NewPage();
                a.PrintImage(image, 200, 400, 200, 200, true, 0);
                a.SetFont("Helvetica", 16);                
                a.PrintText(500, 50, "Page " + pageNumber.ToString());
                a.PrintText(40, 30, "Signature:");
                pageNumber++;
            }
            a.CloseOutputFile();
            a.Dispose();
            Response.Redirect("load.aspx", true);
        }
    }
}