using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Threading;
using System.Globalization;
using System.Collections;

//Version: 1.7
namespace drvvv
{
    public class GetFile
    {
        static string[] allowedExtensionsImg = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };

        public static bool UploadFileUpload(FileUpload fileUpload, bool ThumbNail, bool watermark, bool flash, out string Message)
        {
            if (fileUpload.HasFile)
            {
                int fileSize = fileUpload.FileBytes.Length;
                string fileName = fileUpload.FileName.ToLower();
                string fileType = Path.GetExtension(fileName);

                if (allowedExtensionsImg.Contains(fileType)) // בדיקת סוג הקובץ
                {
                    if ((fileSize / 1024) <= (1024 * 6)) //בדיקת גודל הקובץ
                    {
                        string newName = DateTime.Now.ToString("ddMMyyyyHHmmss", CultureInfo.CreateSpecificCulture("en")) + fileSize + fileType;

                        ImageFormat imageFormat = CheckImageFormat(fileType);

                        if (!watermark)
                            UploadImg(fileUpload, newName);
                        else
                            UploadWatermark(fileUpload, newName, imageFormat);//סימן מים

                        if (ThumbNail)
                            UploadThumbnail(fileUpload, imageFormat, newName);//העלאת תמונה מוקטנת

                        Message = newName;
                        return true;
                    }
                    else
                    {
                        Message = "הקובץ גדול מדי הגודל המקסימלי האפשרי 6 MB";
                        return false; //גודל חריג
                    }
                }
                else if (flash && fileType == ".swf")
                {
                    if ((fileSize / 1024) <= (1024 * 10))
                    {
                        string newName = DateTime.Now.ToString("ddMMyyyyHHmmss", CultureInfo.CreateSpecificCulture("en")) + fileSize + fileType;
                        fileUpload.SaveAs(HttpContext.Current.Server.MapPath("~/UploadFlash/") + newName);

                        Message = newName;
                        return true;
                    }
                    else
                    {
                        Message = "הקובץ גדול מדי הגודל המקסימלי האפשרי 10 MB";
                        return false; //גודל חריג
                    }
                }
                else
                {
                    Message = "סוג הקובץ אינו חוקי הסוגים החוקיים הם: jpg, gif, bmp, png";
                    return false;//סוג לא תקין
                }
            }
            else
            {
                Message = "לא נמצא קובץ להעלאה";
                return false;//אין קובץ
            }
        }

        public static bool UploadImage(System.Drawing.Image image, bool ThumbNail, bool watermark, out string Message)
        {
            if (image != null)
            {
                try
                {
                    string newName = DateTime.Now.ToString("ddMMyyyyHHmmss", CultureInfo.CreateSpecificCulture("en")) + System.Guid.NewGuid().ToString() +".jpg";

                    if (!watermark)
                        UploadImg(image, newName);
                    else
                        UploadWatermark(image, newName);//סימן מים

                    if (ThumbNail)
                        UploadThumbnail(image, newName);//העלאת תמונה מוקטנת

                    Message = newName;
                    return true;
                }
                catch (Exception e)
                {
                    Message = "שגיאה בההעלאת הקובץ" + e;
                    return false;
                }
            }
            else
            {
                Message = "לא נמצא קובץ להעלאה";
                return false;//אין קובץ
            }
        }

        private static ImageFormat CheckImageFormat(string fileType)
        {
            ImageFormat imageFormat = ImageFormat.Jpeg;
            switch (fileType)
            {
                case ".gif": imageFormat = ImageFormat.Gif;
                    break;
                case ".png": imageFormat = ImageFormat.Png;
                    break;
                case ".bmp": imageFormat = ImageFormat.Bmp;
                    break;
            }
            return imageFormat;
        }

        private static void UploadImg(FileUpload fileUpload, string newName)
        {
            fileUpload.SaveAs(HttpContext.Current.Server.MapPath("~/UploadImage/") + newName);
        }

        private static void UploadImg(System.Drawing.Image image, string newName)
        {
            image.Save(HttpContext.Current.Server.MapPath("~/UploadImage/") + newName, ImageFormat.Jpeg);
        }

        private static void UploadWatermark(FileUpload fileUpload, string newName, ImageFormat imageFormat)
        {
            using (var watermark = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath("~/images/Watermark.png")))
            {
                Bitmap org = (Bitmap)System.Drawing.Image.FromStream(fileUpload.FileContent, true);
                Bitmap tmp = new Bitmap(org.Width, org.Height);

                Graphics grPhoto = Graphics.FromImage(tmp);
                grPhoto.DrawImage(org, new Rectangle(0, 0, tmp.Width, tmp.Height), 0, 0, tmp.Width, tmp.Height, GraphicsUnit.Pixel);

                //using (var org = System.Drawing.Image.FromStream(fileUpload.FileContent))
                //{
                //var g = Graphics.FromImage(org);
                //g.DrawImage(watermark, new Rectangle(0, 0, org.Width, org.Height));
                var wmSize = new Size((int)(org.Width * .1), (int)(org.Height * .1));
                grPhoto.DrawImage(watermark, new Rectangle(0, 0, wmSize.Width, wmSize.Height));

                tmp.Save(HttpContext.Current.Server.MapPath("~/UploadImage/") + newName, imageFormat);

                org.Dispose();
                tmp.Dispose();
                grPhoto.Dispose();
                //}
            }
        }
        private static void UploadWatermark(System.Drawing.Image image, string newName)
        {
            using (var watermark = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath("~/images/Watermark.png")))
            {
                using (System.Drawing.Image org = (System.Drawing.Image)image.Clone())
                {
                    var g = Graphics.FromImage(org);

                    var wmSize = new Size((int)(org.Width * .1), (int)(org.Height * .1));
                    g.DrawImage(watermark, new Rectangle(0, 0, wmSize.Width, wmSize.Height));

                    org.Save(HttpContext.Current.Server.MapPath("~/UploadImage/") + newName, ImageFormat.Jpeg);
                }
            }
        }

        private static void UploadThumbnail(FileUpload fileUpload, ImageFormat imageFormat, string newName)
        {
            Bitmap oImg = (Bitmap)System.Drawing.Image.FromStream(fileUpload.FileContent,true);
            Bitmap tmp = new Bitmap(oImg.Width, oImg.Height);

            Size SizeThumbNail = new Size();
            SizeThumbNail.Width = 200;
            SizeThumbNail.Height = (int)(oImg.Height / (oImg.Width / 200.0));

            System.Drawing.Image oThumbNail = new Bitmap(SizeThumbNail.Width, SizeThumbNail.Height);
            Graphics oGraphic = Graphics.FromImage(oThumbNail);
            oGraphic.DrawImage(tmp, new Rectangle(0, 0, tmp.Width, tmp.Height), 0, 0, tmp.Width, tmp.Height, GraphicsUnit.Pixel);

            oGraphic.CompositingQuality = CompositingQuality.HighQuality;
            oGraphic.SmoothingMode = SmoothingMode.HighQuality;
            oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            Rectangle oRectangle = new Rectangle(0, 0, SizeThumbNail.Width, SizeThumbNail.Height);
            oGraphic.DrawImage(oImg, oRectangle);
            oThumbNail.Save(HttpContext.Current.Server.MapPath("~/UploadThumbnail/") + newName, imageFormat);
            oImg.Dispose();
        }
        private static void UploadThumbnail(System.Drawing.Image image, string newName)
        {
            System.Drawing.Image oImg = (System.Drawing.Image)image.Clone();

            Size SizeThumbNail = new Size();
            SizeThumbNail.Width = 200;
            SizeThumbNail.Height = (int)(oImg.Height / (oImg.Width / 200.0));

            System.Drawing.Image oThumbNail = new Bitmap(SizeThumbNail.Width, SizeThumbNail.Height, oImg.PixelFormat);
            Graphics oGraphic = Graphics.FromImage(oThumbNail);

            oGraphic.CompositingQuality = CompositingQuality.HighQuality;
            oGraphic.SmoothingMode = SmoothingMode.HighQuality;
            oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            Rectangle oRectangle = new Rectangle(0, 0, SizeThumbNail.Width, SizeThumbNail.Height);
            oGraphic.DrawImage(oImg, oRectangle);
            oThumbNail.Save(HttpContext.Current.Server.MapPath("~/UploadThumbnail/") + newName, ImageFormat.Jpeg);
            oImg.Dispose();
        }
        public static bool DeleteFile(string fileName)
        {
            if (!string.IsNullOrEmpty(fileName))
            {
                string fileType = Path.GetExtension(fileName.ToLower());
                if (allowedExtensionsImg.Contains(fileType)) // בדיקת סוג הקובץ
                {
                    try
                    {
                        if (File.Exists(HttpContext.Current.Server.MapPath("~/UploadImage/") + fileName))
                            File.Delete(HttpContext.Current.Server.MapPath("~/UploadImage/") + fileName); // מוחק תמונה
                        if (File.Exists(HttpContext.Current.Server.MapPath("~/UploadThumbnail/") + fileName))
                            File.Delete(HttpContext.Current.Server.MapPath("~/UploadThumbnail/") + fileName); // מוחק תמונה מוקטנת
                        if (File.Exists(HttpContext.Current.Server.MapPath("~/UploadWatermark/") + fileName))
                            File.Delete(HttpContext.Current.Server.MapPath("~/UploadWatermark/") + fileName); // מוחק תמונה עם סימן מים
                        return true;
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
                else if (fileType == ".swf")
                {
                    try
                    {
                        if (File.Exists(HttpContext.Current.Server.MapPath("~/UploadFlash/") + fileName))
                            File.Delete(HttpContext.Current.Server.MapPath("~/UploadFlash/") + fileName); // מוחק פלאש
                        return true;
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
                else
                    return false;
            }
            else
                return true;
        }
    }
}
