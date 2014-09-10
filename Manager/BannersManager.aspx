<%@ Page Title="Banners Manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="BannersManager.aspx.cs" Inherits="Manager_BannersManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>

<h2>Banners Manager</h2>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Manager/BannersSpacesManager.aspx">Banners Spaces Manager</asp:HyperLink>
<br />
    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
<br />

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="LinqDataSource1" 
        oniteminserting="ListView1_ItemInserting" GroupItemCount="4" InsertItemPosition="FirstItem">
        <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
        <ItemTemplate>
            <td runat="server" style="vertical-align:top;width:33%;">
                <asp:Literal ID="Literal1" runat="server" Text='<%# GetBanner((int)Eval("ID")) %>'></asp:Literal>
                <h2><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></h2>
                <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>' Enabled="false" Text="פעיל" />
                <br />
                Start Date:
                <asp:Label ID="BeginDateLabel" runat="server" Text='<%# string.Format("{0:d}", Eval("BeginDate")) %>' />
                <br />
                End Date:
                <asp:Label ID="EndDateLabel" runat="server" Text='<%# string.Format("{0:d}", Eval("EndDate")) %>' />
                <br />
                Visits: <asp:Label ID="VisitsLabel" runat="server" Text='<%# Eval("Visits") %>' /> 
                <asp:Label ID="MaxVisitsLabel" runat="server" Text='<%# Eval("MaxVisits") == null ? "(Not limited)" : string.Format("(max:{0:d})", Eval("MaxVisits")) %>' />
                <br />
                Link:
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Link") %>' Target="_blank"></asp:HyperLink>
                <br />
                Banners Spaces:
                <asp:Label ID="BannersSpaceIDLabel" runat="server" Text='<%# Eval("BannersSpace.Title") %>' />
                <br />  
                Targeting to site:
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("siteID") == null ? "" : ((drvvv.Sites)((int)Eval("siteID"))).ToString() %>' />
                <br />         
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Really want to delete? (Not refundable)')) return false;" />
                <br />
                <br />
            </td>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>No ads in.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <td runat="server" style="vertical-align:top;width:33%;line-height:26px;">
                <asp:FileUpload ID="FileUploadImage" runat="server" />
                <br />
                Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                <br />
                <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' Text="Active" />
                <br />
               Spaces:
                <asp:DropDownList ID="DropDownListBannersSpace" runat="server" 
                    AppendDataBoundItems="True" DataSourceID="LinqDataSourceBannersSpace" DataTextField="Title" DataValueField="ID">
                    <asp:ListItem Selected="True" Value="" Text="-Select Space-"></asp:ListItem>
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSourceBannersSpace" runat="server" ContextTypeName="DataClassesDataContext" 
                    OrderBy="Title" Select="new (ID, Title)" TableName="BannersSpaces">
                </asp:LinqDataSource>
                <br />
                Targeting to site:
                <asp:DropDownList ID="DropDownListSiteID" runat="server">
                    <asp:ListItem Value="" Text="-All Sites-"/>
                    <asp:ListItem Value="1" Text="Anglodels"/>
                    <asp:ListItem Value="2" Text="Zebradeals"/>
                    <asp:ListItem Value="3" Text="FrancoDeals" />
                </asp:DropDownList>
                <br />
                Start Date:
                <asp:TextBox ID="BeginDateTextBox" runat="server" Text='<%# Bind("BeginDate") %>'></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" EnabledOnClient="true" Format="dd/MM/yyyy" TargetControlID="BeginDateTextBox">
                </cc1:CalendarExtender>
                <br />
                End Date:
                <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" EnabledOnClient="true" Format="dd/MM/yyyy" TargetControlID="EndDateTextBox">
                </cc1:CalendarExtender>
                <br />
                Max Visits:
                <asp:TextBox ID="MaxVisitsTextBox" runat="server" Text='<%# Bind("MaxVisits") %>'></asp:TextBox>
                <br />
                Link:
                <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>'></asp:TextBox>
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
            </td>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="11">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <td runat="server" style="vertical-align:top;width:33%;line-height:26px;">
                <asp:Image ID="Image1" runat="server" style="max-width:200px;" ImageUrl='<%# "~/UploadImage/" + Eval("LinkFile") %>' />
                <br />
                    <asp:FileUpload ID="FileUploadImageReplacement" runat="server" />
                    <asp:Button ID="Button1" runat="server" Text="Banner exchange" onclick="Button1_Click" CommandArgument='<%# Eval("ID") %>' />
                 <br />
                Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' Text="Active" />
                <br />
                Space:
                <asp:DropDownList ID="DropDownListBannersSpace" runat="server" SelectedValue='<%# Bind("BannersSpaceID") %>'
                    AppendDataBoundItems="True" DataSourceID="LinqDataSourceBannersSpace" DataTextField="Title" DataValueField="ID">
                    <asp:ListItem Selected="True" Value="" Text="-Select Space-"></asp:ListItem>
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSourceBannersSpace" runat="server" ContextTypeName="DataClassesDataContext" 
                    OrderBy="Title" Select="new (ID, Title)" TableName="BannersSpaces">
                </asp:LinqDataSource>
                <br />
                Targeting to site:
                <asp:DropDownList ID="DropDownListSiteID" runat="server" SelectedValue='<%# Bind("SiteID") %>' DataSource='<%# drvvv.SourceList.SitesList() %>' DataTextField="Key" DataValueField="Value" AppendDataBoundItems="true">
                    <asp:ListItem Value="" Text="-All Sites-"/>
                </asp:DropDownList>
                <br />
                Start Date:
                <asp:TextBox ID="BeginDateTextBox" runat="server" Text='<%# Bind("BeginDate") %>' />
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" EnabledOnClient="true" Format="dd/MM/yyyy" TargetControlID="BeginDateTextBox">
                </cc1:CalendarExtender>
                <br />
                End Date:
                <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" EnabledOnClient="true" Format="dd/MM/yyyy" TargetControlID="EndDateTextBox">
                </cc1:CalendarExtender>
                <br />
                Max Visits:
                <asp:TextBox ID="MaxVisitsTextBox" runat="server" Text='<%# Bind("MaxVisits") %>' />
                <br />
                Link:
                <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="ID desc" TableName="Banners">
    </asp:LinqDataSource>
</asp:Content>

