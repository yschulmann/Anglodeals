<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="BusinesPage.aspx.cs" Inherits="BusinesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc:PrintableMenu id="PrintableMenu1" runat="server" />
    <div id="PrintableCoupon">
        <%--<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dHlpX1gxcHgxVGd4QUNTQklrdHRGTmc6MQ" width="200" height="300" frameborder="0"
marginheight="0" marginwidth="0" style="float:right; width:200px;">Loading...</iframe>--%>
        <div id="formCoupon" class="formCoupon" runat="server" visible="false">
        
        </div>
        <div id="Information">
            <asp:Image ID="ImageLogo" runat="server" CssClass="ImageLogo" />
            <h1><asp:Literal ID="LiteralH1" runat="server"></asp:Literal></h1>
            
            <p>
            <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal>
            </p>
            <p>
            <asp:Literal ID="LiteralPhone" runat="server"></asp:Literal>
            </p>
            <p>
            <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal>
            </p>
            <p>
            <asp:Literal ID="LiteralKosher" runat="server"></asp:Literal>
            </p>
            <p>
                <asp:HyperLink ID="HyperLinkSite" runat="server" Text="Web Site" Target="_blank"></asp:HyperLink>
            </p>
        </div>
        
        <asp:ListView ID="ListViewPrintableCouponList" runat="server" DataKeyNames="ID">
            <ItemTemplate>
            <div class="PrintableCouponListItem">
                <div class="side">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ButtonBlue" Target="_blank" NavigateUrl='<%# !string.IsNullOrEmpty((string)Eval("ImgName")) ? "~/UploadImage/" + Eval("ImgName") : drvvv.CatSummary.CompletionUrl((string) Eval("Link")) %>' Text="<%$ Resources:Resource, PrintCoupon %>"></asp:HyperLink>
                    <asp:Label ID="Label4" runat="server" Text='<%# Resources.Resource.FoundOn + " " + Eval("SiteName") %>'></asp:Label>
                </div>
                <h3><asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Title" + Page.Theme) %>' /></h3>
                <p>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("Subject" + Page.Theme) %>' />
                </p>
                <div style="clear:both;"> </div>
            </div>
            </ItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server">
                    <span ID="itemPlaceholder" runat="server" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        
        <div id="MoreDetails">
            <asp:Literal ID="LiteralMoreDetails" runat="server" Mode="PassThrough"></asp:Literal>
        </div>
    </div>
</asp:Content>

