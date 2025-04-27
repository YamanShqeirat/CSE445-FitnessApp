using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class imageVerifier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This is a simple captcha image generator 
            Response.Clear();
            int height = 30;
            int width = 100;
            Bitmap bmp = new Bitmap(width, height);
            RectangleF rectf = new RectangleF(10, 5, 0, 0);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.LightYellow);

            //adds noise to the image
            Random rand = new Random();
            for (int i = 0; i < 10; i++)
            {
                int x = rand.Next(width);
                int y = rand.Next(height);
                int w = rand.Next(5, 20);
                int h = rand.Next(5, 20);
                Color blockColor = Color.FromArgb(rand.Next(100, 256), rand.Next(256), rand.Next(256), rand.Next(256));
                using (SolidBrush brush = new SolidBrush(blockColor))
                {
                    g.FillRectangle(brush, x, y, w, h);
                }
            }
            //draws the text
            g.SmoothingMode = SmoothingMode.AntiAlias;
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.PixelOffsetMode = PixelOffsetMode.HighQuality;
            g.DrawString(Session["captcha"].ToString(), new Font("Tahoma", 16, FontStyle.Bold | FontStyle.Italic), Brushes.Chocolate, rectf);
            g.Flush();
            Response.ContentType = "image/jpeg";
            bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
            g.Dispose();
            bmp.Dispose();
        }
    }
}