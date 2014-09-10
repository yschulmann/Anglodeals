<%@ Page Title="Help with עברית | Anglodeals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GuideList.aspx.cs" Inherits="GuideList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
<style type="text/css">
.hebrewTitle
{
	color: #CC3399;
    font-family: Trebuchet MS;
    font-size: 14px;
    font-weight: bold;
    margin-bottom:12px;
}
.hr
{
	background: url("images/pas.png") repeat-x scroll 0 0 transparent;
    clear: left;
    display: block;
    height: 9px;
    margin: 12px 0;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="Content">
    <img src="images/hebrew-help-title.png" alt="Help with עברית" style="margin:0 0 9px" />
<p class="hebrewTitle">
    OK, you click on a great deal, you want to get it, but it's all in Hebrew. Yikes!<br />
    Therefore, we put together a step-by-step guide with English translation to help with the process.<br />
    Just click on the site you would like to buy from and follow the steps.
</p>
<div class="hr"> </div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="LinqDataSource1" GroupItemCount="3">
        <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate>
                <td runat="server">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/GuidePage.aspx?site=" + Eval("ID") %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#"http://anglodeals.co.il/UploadImage/" + Eval("ImageName") %>' ToolTip='<%# Eval("TitleDefault") %>' />
                        <h3><asp:Literal ID="TitleEnLabel" runat="server" Text='<%# Eval("TitleEn") %>' /></h3>
                    </asp:HyperLink>
                </td>
            </ItemTemplate>
            <EmptyDataTemplate>
                <table runat="server">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table ID="groupPlaceholderContainer" runat="server" border="0" class="GuideList">
                    <tr ID="groupPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
    </asp:ListView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="DataClassesDataContext" 
            onselecting="LinqDataSource1_Selecting" TableName="CouponsSites">
        </asp:LinqDataSource>
</div>
</asp:Content>