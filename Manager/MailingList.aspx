<%@ Page Title="Mailing List Management" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="MailingList.aspx.cs" Inherits="Manager_MailingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Mailing List Management</h1>
<asp:DropDownList ID="DropDownListSource" runat="server" AppendDataBoundItems="true" AutoPostBack="true" 
        onselectedindexchanged="DropDownListSites_SelectedIndexChanged" DataTextField="Key" DataValueField="Value">
        <asp:ListItem Value="" Text="-All Sources-"></asp:ListItem>
    <%--    <asp:ListItem Value="1" Text="Anglodeals"></asp:ListItem>
        <asp:ListItem Value="2" Text="Zebradeals"></asp:ListItem>
        <asp:ListItem Value="2" Text="FrancoDeals"></asp:ListItem>--%>
    </asp:DropDownList>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="Button1_Click" Text="Download a mailing list" ToolTip="Download a mailing list"></asp:LinkButton>
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table" PageSize="75"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:TemplateField HeaderText="Site" SortExpression="Site">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (drvvv.Sites)((int)Eval("SiteID")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InDate" HeaderText="In Date" SortExpression="InDate" />
            <asp:BoundField DataField="SiteID" HeaderText="SiteID" 
                SortExpression="SiteID" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" OrderBy="ID desc" TableName="MailingLists" onselecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
</asp:Content>

