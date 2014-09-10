<%@ Page Title="Search Result" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="ListHead" class="Search">
        <h1><asp:Literal ID="LiteralH1" runat="server" Text="Search" /></h1>
    
       <div>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, SortByCity %>" />
            <asp:DropDownList ID="DropDownListCity" runat="server" AppendDataBoundItems="true" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>" 
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged"  AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCity %>" />
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, SortByCategory %>" />
            <asp:DropDownList ID="DropDownListCategory" runat="server" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>"
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCategory %>" />
            </asp:DropDownList>
        </div>
    </div>
    <asp:ListView ID="ListViewSearch" runat="server" DataKeyNames="ID">
        <ItemTemplate>
            <div class="PrintableListItem">
                <div class="img">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# (int)Eval("ClassificationID") == 1 ? "~/CouponAddress.aspx?couponID=" + Eval("ID") + "&SiteID=" + drvvv.Plugins.GetTextToSite("1","8","5") : "~/BusinesPage.aspx?Busines=" + Eval("ID") %>' Target="_blank">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName")) %>'/>
                    </asp:HyperLink>
                </div>
                <h3>
                <asp:HyperLink ID="LangHyperLink2" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# (int)Eval("ClassificationID") == 1 ? "~/CouponAddress.aspx?couponID=" + Eval("ID") + "&SiteID=" + drvvv.Plugins.GetTextToSite("1","8","5") : "~/BusinesPage.aspx?Busines=" + Eval("ID") %>' />
                </h3>
                <p>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject"),250) %>'></asp:Literal>
                </p>
            </div>
            </ItemTemplate>
            <EmptyDataTemplate>
                <div class="PrintableListEmpty">
                    <asp:Literal ID="Literal2" runat="server" Text='<%# drvvv.Plugins.GetTextToSite("Sorry, no results found for your search.", "Sorry, no results found for your search.","לא נמצאו תוצאות מתאימות") %>'></asp:Literal></div></EmptyDataTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server">
                <span ID="itemPlaceholder" runat="server" />
            </div>
           <div style="text-align:center; padding:12px;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowPreviousPageButton="true" 
                            ShowNextPageButton="False"  />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="true" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>

