<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsletterFr.aspx.cs" Theme="" Inherits="NewsletterFr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newsletter francodeals</title>
    <meta name="robots" content="noindex" />
</head>
<body style="background-color:#000000; direction:ltr; background-image: none;" class="Newsletter">
    <form id="form1" runat="server">
    <div style="width:636px; margin:0 auto;">
        <a href="http://francodeals.co.il" title="franco deals"><img src="http://francodeals.co.il/images/Franco/LogoFull.png" alt="franco deals" style="border:none; height:127px;width:636px;" /></a>
        <uc:DisplayBanners ID="DisplayBanners2" runat="server" BannersSpace="2" style="margin:6px 0; display:block;" />
        <table style="background-color: #FFFFFF;width:636px;" width="636">
       
        <asp:Repeater ID="RepeaterCoupons" runat="server">
            <ItemTemplate>
            <tr style="padding:12px;min-height: 90px;" Height="90"> 
                <td style="padding:12px;min-height: 90px;" Height="90">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#string.Format("http://francodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),9) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# (Eval("City.TitleFr") != null ? Eval("City.TitleFr") : "All Israel") + ": " + Eval("TitleFr") %>' NavigateUrl='<%# string.Format("http://francodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),9) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%#"Proposé par: " + Eval("CouponsSite.TitleFr")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
                </td>
            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <tr>
            <td style="padding:12px;min-height: 90px; background-color:#ebebec;" Height="90">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("http://francodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),9) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# (Eval("City.TitleFr") != null ? Eval("City.TitleFr") : "All Israel") + ": " + Eval("TitleFr") %>' NavigateUrl='<%# string.Format("http://francodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),9) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%#"Proposé par: " + Eval("CouponsSite.TitleFr")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
            </td>
            </tr>
            </AlternatingItemTemplate>
        </asp:Repeater>
        
        </table>
    </div>
    </form>
</body>
</html>
