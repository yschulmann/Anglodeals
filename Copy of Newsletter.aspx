<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of Newsletter.aspx.cs" Theme="" Inherits="Newsletter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newsletter Anglodeals</title>
    <meta name="robots" content="noindex" />
</head>
<body style="background-color:#ccecfd; direction:ltr;" class="Newsletter">
    <form id="form1" runat="server">
    <div style="width:636px; margin:0 auto;">
        <a href="http://anglodeals.co.il/" title="anglodeals"><img src="http://anglodeals.co.il/images/top_NL_02.jpg" alt="anglodeals" style="border:none; height:127px;width:636px;" /></a>
        <uc:DisplayBanners ID="DisplayBanners2" runat="server" BannersSpace="2" style="margin:6px 0; display:block;" />
        <table style="background-color: #FFFFFF;width:636px;" width="636">
        <tr>
            <td style="color: White;font-size:18px;padding:6px 12px;background-color: #3f99df;font-family:Helvetica;">
            All Israel
            </td>
        </tr>
        <asp:Repeater ID="RepeaterCouponsEmpty" runat="server">
            <ItemTemplate>
            <tr style="padding:12px;min-height: 90px;" Height="90">
                <td style="padding:12px;min-height: 90px;" Height="90">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("TitleEn") %>' NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%#"Offered by: " + Eval("CouponsSite.TitleEn")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
                </td>
            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <tr>
            <td style="padding:12px;min-height: 90px; background-color:#ebebec;" Height="90">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("TitleEn") %>' NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%#"Offered by: " + Eval("CouponsSite.TitleEn")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
            </td>
            </tr>
            </AlternatingItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="RepeaterCities" runat="server">
        <ItemTemplate>
        <tr>
        <td style="color:White;font-size:18px;padding:6px 12px;background-color: #3f99df;font-family:Helvetica;">
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("TitleEn") %>'></asp:Literal>
         </td>
         </tr>
            <asp:Repeater ID="RepeaterCoupons" runat="server" DataSourceID="LinqDataSource1">
                <ItemTemplate>
                <tr>
                <td style="padding:12px;min-height: 90px;" Height="90">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                    </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("TitleEn") %>' NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%#"Offered by: " + Eval("CouponsSite.TitleEn")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
                </td>
                </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                <tr>
                <td style="padding:12px;min-height: 90px; background-color:#ebebec;" Height="90">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>'>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName"),1)%>' ImageAlign="Right" style="margin-left:145px;" Height="145px" />
                </asp:HyperLink>
                   <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("TitleEn") %>' NavigateUrl='<%# string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}&Show=true",(int)Eval("ID"),2) %>' style="text-decoration:none;color:#6d6e71;font-family:Helvetica;font-size: 16px;font-weight: bold;"></asp:HyperLink>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%#"Offered by: " + Eval("CouponsSite.TitleEn")%>' style="font-family:Helvetica; font-weight:bold; font-size: 12px; color:#1f77bb;"></asp:Label>
                </td>
                </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="DataClassesDataContext" TableName="Coupons" OrderBy="Priority desc, ID desc"
                Where='<%# "(CityID == " + Eval("ID")  + " &#124;&#124; City.FromID == " + Eval("ID") + ") &amp;&amp; Active == true &amp;&amp; EndDate &gt;= DateTime.Now && TitleEn != null" %>'>
            </asp:LinqDataSource>
        </ItemTemplate>
        </asp:Repeater>
        </table>
    </div>
    </form>
</body>
</html>
