<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DealsDay.aspx.cs" Inherits="DealsDay" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

<br /><br /><br />
    
    <section id="deals-filter">
<div class="container">
    <div class="Breadcrumbs"><a href="Default.aspx">Home </a> > <span>Deals of the day</span> </div>
            <h1>Deals of the day</h1>
            
                <select class="select_city"
                  <asp:DropDownList ID="DropDownListCity" runat="server" AppendDataBoundItems="true" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>" 
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged"  AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCity %>" />
            </asp:DropDownList>
                </select>
                
            
            
                <select class="select_category"
                  <asp:DropDownList ID="DropDownListCategory" runat="server" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>"
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCategory %>" />
            </asp:DropDownList>
                 
                </select>
            
            <p class="clear"></p>

</div><!-- container -->
</section><!-- deals-filter -->
    <section id="main">
          <div class="container">
                    <nav>
                        <asp:button type="button" CssClass="right-nav" runat="server" OnClick="Unnamed_Click1" ></asp:button>  
                        <span id="content2">
        <div class="Coupons">
    <% 
        var namePage = "Deals";
         string [] page = new string[4] {"Deals","Auctions","Coupons","Codes"}; 

        for (int i = 0 ; i < 3 ; i ++) {
            if (page[i] == namePage)
            {
               Response.Write (page[i+1]);
            }
           }
        %>

        </div>
        </span> 
    <button type="button" id="left-nav"><a href="DealsDay.aspx"><img src="img/navtoleft.png" alt="Navigate to Left"></a></button>
</nav>

</div><!-- container -->
        <div class="container">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1">
        <ItemTemplate>
<!--********************************************************************************************************************************!-->


    <div class="oneDeal deals">
        <div class="header">
            <span class="left"></span>
            <span class="right-location"><asp:Label ID="Label1" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label> </span>
        </div>
        <figure>
        <div class="center-img">
            <img class="main-img" src="img/ps1.png" /><!-- <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank">
                    <asp:Image ID="Image1" runat="server"  CssClass="CouponImg" ToolTip=" " BorderWidth="1px" ImageUrl='<%# drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName")) %>'/>-->
        </div>
        <figcaption class="bottom">
            <time class="remain">
                <div id='<%# "time" + Eval("ID") %>' class="time"> </div>
                <script type='text/javascript'>
                    new timer('<%# drvvv.Plugins.TimeTimer((DateTime)Eval("EndDate")) %>', '<%# "time" + Eval("ID") %>').run();
                 </script></time>
            <div class="title">Only <asp:Literal ID="Literal12" runat="server" Text='<%# Eval("Price", "₪{0:f0}")%>'/><span class="worth">Worth 80 NIS</span></div>
            <p class="description"><asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# Eval("Title" + Page.Theme) %>' NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank"></asp:HyperLink></p>
        </figcaption><!-- bottom -->
        </figure>
        <div class="oneDeal-hover">
            <div class="header">
                <span class="left"></span>
                <span class="right-location"><asp:Label ID="Label111" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label></span>
            </div>
            <figure>                
                <div class="title">Only <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Price", "₪{0:f0}")%>'/><span class="worth"></div>
                <span class="worth">Worth 80 NIS</span>                
                <p class="description"><asp:HyperLink ID="HyperLink4" runat="server"  Text='<%# Eval("Title" + Page.Theme) %>' NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank"></asp:HyperLink></p>
                <div class="button"><a ></a></div>
                <time class="remain">
                    <div id='<%# "time2" + Eval("ID") %>' class="time"> </div>
                <script type='text/javascript'>
                    new timer('<%# drvvv.Plugins.TimeTimer((DateTime)Eval("EndDate")) %>', '<%# "time2" + Eval("ID") %>').run();
                 </script>
                </time>
                <a class="more" href="">More about Cafe Greg</a>
            </figure>
        </div><!-- oneDeal-hover -->
    </div><!-- oneDeal -->

<!--*********************************************************************************************************************************!-->
      <!--  <div class="CouponItem">
            <div class="img">
                
                </asp:HyperLink>
            </div>
            <div class="ribbon">
                
            </div>
           <div class="Detals">
                <div class="price"></div>
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
                
                <asp:HyperLink ID="HyperLink3" CssClass="DealButton" runat="server" NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank">
                </asp:HyperLink>
           </div>
            <h3>
                
            </h3>
            <p>
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, FinePrint %>" CssClass="FinePrint" />
                <asp:Literal ID="Literal2" runat="server" Text='<%#drvvv.CatSummary.ReplaceBr((string) Eval("Subject" + Page.Theme)) %>'></asp:Literal>
            </p>
            <div class="ShareDeal">
                <asp:HyperLink ID="HyperLinkGuide" runat="server" CssClass="Guide" NavigateUrl='<%#"~/GuidePage.aspx?site=" + Eval("CouponSiteID") %>' Text='<%#Resources.Resource.HelpFor + Eval("CouponsSite.Title" + Page.Theme) %>' Visible='<%# !string.IsNullOrEmpty((string)Eval("CouponsSite.Subject" + Page.Theme)) %>' />
                <asp:Image ID="Image3" runat="server" ImageUrl='<%#"~/UploadImage/" + Eval("CouponsSite.ImageName") %>'  Text='<%# Eval("CouponsSite.TitleEn") %>' />
            </div>
        </div>  !-->
        </ItemTemplate>
        <EmptyDataTemplate>
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, NoData %>" />
        </EmptyDataTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
            <hr />
            <%--<div style="text-align:center;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>--%>
        </LayoutTemplate>
        
    </asp:ListView>
            <div class="more-deals"><a href="" title="More DEALS AUCTIONS COUPONS and CODES">More Deals</a></div>
<button type="button" id="back-to-top"><a href="#" title="Back to Top"><img src="img/bkttop.png" alt="Back to Top"></a></button>
        </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" TableName="Coupons" 
        onselecting="LinqDataSource1_Selecting" OrderBy="Priority desc">
    </asp:LinqDataSource>  
</asp:Content>

