<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CouponPage.aspx.cs" Inherits="CouponPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
<script src="js/Timer.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1">
        <ItemTemplate>
          <div class="CouponItem">
            <div class="img">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank">
                    <asp:Image ID="Image1" runat="server"  CssClass="CouponImg" ToolTip=" " BorderWidth="1px" ImageUrl='<%# drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName")) %>'/>
                </asp:HyperLink>
               <%--<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("ID") %>' onClientClick="aspnetForm.target='_blank';"  OnClick="ImageButton2_Click" />--%>
            </div>
            <div class="ribbon">
                <asp:Label ID="Label1" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.TitleEn") %>'></asp:Label>
            </div>
           <div class="Detals">
                <div class="price"><asp:Literal ID="Litera12" runat="server" Text='<%# Eval("Price", "₪{0:f0}")%>'/></div>
                <div class="priceDetals">
                    <span><asp:Literal ID="Literal3" runat="server" Text='<%# Eval("OriginalPrice", "₪{0:f0}")%>'/></span>
                    Worth
                </div>
                <div class="priceDetals">
                    <span><asp:Literal ID="Literal5" runat="server" Text='<%#string.Format("{0:f0}%", ((decimal)Eval("OriginalPrice") - (decimal)Eval("Price")) / (decimal)Eval("OriginalPrice") * 100) %>'/></span>
                    Discount
                </div>
                <div class="priceDetals">
                    <span><asp:Literal ID="Literal4" runat="server" Text='<%#string.Format("₪{0:f0}", (decimal)Eval("OriginalPrice") - (decimal)Eval("Price")) %>'/></span>
                    You save
                </div>
                <div id='<%# "time" + Eval("ID") %>' class="time"> </div>
                <script type='text/javascript'>
                    new timer('<%# drvvv.Plugins.TimeTimer((DateTime)Eval("EndDate")) %>', '<%# "time" + Eval("ID") %>').run();
                 </script>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank">
                    <asp:Image ID="Image2" runat="server"  CssClass="DealButton" ToolTip=" " BorderWidth="0px" ImageUrl="~/images/view_deal_button.png"/>
                </asp:HyperLink>
               <%--<asp:ImageButton ID="ImageButton1" runat="server" CssClass="DealButton" CommandArgument='<%# Eval("ID") %>' onClientClick="aspnetForm.target='_blank';" ImageUrl="~/images/view_deal_button.png" OnClick="ImageButton2_Click" />--%>
           </div>
            <h3>
                <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# Eval("TitleEn") %>' NavigateUrl='<%#string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank"></asp:HyperLink>
            <%--<asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("TitleEn") %>' CommandArgument='<%# Eval("ID") %>' onClientClick="aspnetForm.target='_blank';" onclick="LinkButton1_Click"></asp:LinkButton>--%></h3>
            <p>
                <span class="FinePrint">Fine print:</span> 
                <asp:Literal ID="Literal2" runat="server" Text='<%#drvvv.CatSummary.ReplaceBr((string) Eval("SubjectEn")) %>'></asp:Literal>
            </p>
            <div class="ShareDeal">
                <asp:HyperLink ID="HyperLink4" runat="server" CssClass="Guide" NavigateUrl='<%#"~/GuidePage.aspx?site=" + Eval("CouponSiteID") %>' Text='<%#"Help for " + Eval("CouponsSite.TitleEn") %>' Visible='<%# !string.IsNullOrEmpty((string) Eval("CouponsSite.Nots")) %>' />
                <asp:Image ID="Image3" runat="server" ImageUrl='<%#"~/UploadImage/" + Eval("CouponsSite.ImageName") %>'  Text='<%# Eval("CouponsSite.TitleEn") %>' />
                <%--<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="http://anglodeals.co.il/default.aspx?CouponID=<%# Eval("ID") %>" layout="button_count" show_faces="false" width="40" font=""></fb:like>--%>
                <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("City.TitleEn") %>'></asp:Label>--%>
            </div>
        </div>  
        </ItemTemplate>
        
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
            <hr />

        </LayoutTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" TableName="Coupons" 
        onselecting="LinqDataSource1_Selecting" OrderBy="Priority desc">
    </asp:LinqDataSource>
</asp:Content>

