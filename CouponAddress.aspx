<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CouponAddress.aspx.cs" Inherits="CouponAddress" %>
<head runat="server">
<title>clics</title>
<asp:Literal ID="LiteralMeta" runat="server" Mode="PassThrough"></asp:Literal>
    <script src="js/Timer.js" type="text/javascript"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-21956328-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrap">
            <div id="head">
                <a href="./" class="logo"></a>
            </div>
            <div style="background-color: #fff;">
            <h2 style="padding: 12px;"><asp:Localize ID="Localize4" runat="server" Text="<%$ Resources:Resource, DirectedNow %>"></asp:Localize></h2>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="CouponItem">
                        <div class="img">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),10) %>' Target="_blank">
                                <asp:Image ID="Image1" runat="server"  CssClass="CouponImg" ToolTip=" " BorderWidth="1px" ImageUrl='<%# drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName")) %>'/>
                            </asp:HyperLink>
                        </div>
                        <div class="ribbon">
                            <asp:Label ID="Label1" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label>
                        </div>
                       <div class="Detals">
                            <div class="price"><asp:Literal ID="Litera12" runat="server" Text='<%# Eval("Price", "₪{0:f0}")%>'/></div>
                            <div class="priceDetals">
                                <span><asp:Literal ID="Literal3" runat="server" Text='<%# Eval("OriginalPrice", "₪{0:f0}")%>'/></span>
                                <asp:Localize ID="Localize1" runat="server" Text="<%$ Resources:Resource, Worth %>" />
                            </div>
                            <div class="priceDetals">
                                <span><asp:Literal ID="Literal5" runat="server" Text='<%#string.Format("{0:f0}%", ((decimal)Eval("OriginalPrice") - (decimal)Eval("Price")) / (decimal)Eval("OriginalPrice") * 100) %>'/></span>
                                <asp:Localize ID="Localize2" runat="server" Text="<%$ Resources:Resource, Discount %>" />
                            </div>
                            <div class="priceDetals">
                                <span><asp:Literal ID="Literal4" runat="server" Text='<%#string.Format("₪{0:f0}", (decimal)Eval("OriginalPrice") - (decimal)Eval("Price")) %>'/></span>
                                <asp:Localize ID="Localize3" runat="server" Text="<%$ Resources:Resource, YouSave %>" />
                            </div>
                            <div id='<%# "time" + Eval("ID") %>' class="time"> </div>
                            <script type='text/javascript'>
                                new timer('<%# drvvv.Plugins.TimeTimer((DateTime)Eval("EndDate")) %>', '<%# "time" + Eval("ID") %>').run();
                             </script>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),10) %>' Target="_blank">
                                <asp:Image ID="Image2" runat="server"  CssClass="DealButton" ToolTip=" " BorderWidth="0px" ImageUrl="~/images/view_deal_button.png"/>
                            </asp:HyperLink>
                       </div>
                        <h3>
                            <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# Eval("Title" + Page.Theme) %>' NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),10) %>' Target="_blank"></asp:HyperLink>
                        </h3>
                        <p>
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, FinePrint %>" CssClass="FinePrint" />
                            <asp:Literal ID="Literal2" runat="server" Text='<%#drvvv.CatSummary.ReplaceBr((string) Eval("Subject" + Page.Theme)) %>'></asp:Literal>
                        </p>
                        <div class="ShareDeal">
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%#"~/UploadImage/" + Eval("CouponsSite.ImageName") %>'  Text='<%# Eval("CouponsSite.Title" + Page.Theme) %>' />
                        </div>
                    </div>  
                </ItemTemplate>
            </asp:Repeater>
            <asp:HyperLink ID="HyperLinkGo" runat="server" style="display: block;font-size: 14px; text-align: center;padding: 12px;">Click here to go directly</asp:HyperLink>
            </div>
        </div>
    </form>
</body>