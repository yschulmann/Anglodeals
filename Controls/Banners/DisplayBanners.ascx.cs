using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

//גירסה: 2.3
public partial class Controls_DisplayBanners : System.Web.UI.UserControl
{
    private int bannersSpace = 0;
    private int bannersNum = 1;
    private string style = "";
    public int BannersSpace
    {
        get { return bannersSpace; }
        set { bannersSpace = value; }
    }
    public int BannersNum
    {
        get { return bannersNum; }
        set { bannersNum = value; }
    }
    public string Style
    {
        get { return style; }
        set { style = value; }
    }

    static string[] allowedExtensions = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.Request.Url.LocalPath.Contains("/manager/"))
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                if (BannersSpace != 0)
                {
                    var cBanners = db.Banners.Where(x => x.BannersSpaceID == BannersSpace && x.Active);

                    cBanners = cBanners.Where(x => x.BeginDate == null || x.BeginDate >= DateTime.Now);//הורדת באנרים שמועד הצגתם עוד לא הגיע
                    cBanners = cBanners.Where(x => x.EndDate == null || x.EndDate <= DateTime.Now);//הורדת באנרים שמועד הצגתם עבר
                    cBanners = cBanners.Where(x => x.MaxVisits == null || x.MaxVisits > x.Visits);//הורדת באנרים שנגמרו בהם הצפיות
                    cBanners = cBanners.Where(x => !x.SiteID.HasValue || x.SiteID == (int)drvvv.drvvvSettings.GetSite());//הורדת באנרים שממוקדים לאתרים אחרים
                    if (cBanners.Count() >= 1)
                    {
                        Random rand = new Random();

                        for (int num = 0; num < bannersNum && cBanners.Count() > 0; num++)
                        {
                            var cBanner = cBanners.Skip(rand.Next(0, cBanners.Count())).FirstOrDefault();

                            HyperLink hyperLink = new HyperLink();
                            hyperLink.ID = "hyperLinkBanner" + num;
                            hyperLink.NavigateUrl = cBanner.Link;
                            hyperLink.Target = "_blank";
                            if (!string.IsNullOrEmpty(Style))
                                hyperLink.Attributes.Add("style", Style);
                            Panel1.Controls.Add(hyperLink);

                            string fileType = Path.GetExtension(cBanner.LinkFile.ToLower());
                            if (allowedExtensions.Contains(fileType)) // בדיקת סוג הקובץ
                            {
                                System.Web.UI.WebControls.Image image = new System.Web.UI.WebControls.Image();
                                image.ID = "ImageBanner" + num;
                                image.ImageUrl = "~/UploadImage/" + cBanner.LinkFile;
                                if (cBanner.BannersSpace.Width > 0)
                                    image.Width = Unit.Parse(cBanner.BannersSpace.Width + "px");
                                if (cBanner.BannersSpace.Height > 0)
                                    image.Height = Unit.Parse(cBanner.BannersSpace.Height + "px");
                                image.ToolTip = cBanner.Title;

                                hyperLink.Controls.Add(image);
                            }
                            else if (fileType == ".swf")
                            {
                                string size = cBanner.BannersSpace.Width != null ? " Width=" + cBanner.BannersSpace.Width : "";
                                size += cBanner.BannersSpace.Height != null ? " Height=" + cBanner.BannersSpace.Height : "";

                                Literal literal = new Literal();
                                literal.Mode = LiteralMode.PassThrough;
                                literal.ID = "FlashBanner" + num;
                                literal.Text = "<object " + size + "><param name='movie' value='UploadFlash/" + cBanner.LinkFile + "' value='transparent'><embed src='UploadFlash/" + cBanner.LinkFile + "'" + size + " wmode='transparent'></embed></object>";

                                hyperLink.Controls.Add(literal);

                            }
                            cBanner.Visits += 1;
                            db.SubmitChanges();

                            cBanners = cBanners.Where(x => x.ID != cBanner.ID);
                        }
                    }
                    else
                    {
                        Panel1.Visible = false;
                        //hyperLink.Text = "No banners Yet";
                    }
                }
                else
                {
                    throw new Exception("Missing Banners Space");
                }
            }
        }
    }
}
