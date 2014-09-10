<%@ Page Title="Clicks Report" Language="C#"MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="ClicksReport.aspx.cs" Inherits="Manager_ClicksReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <h1>Clicks Report</h1>
    <div style="margin:12px;">
    Filters: 
    <asp:DropDownList ID="DropDownListSites" runat="server" DataSourceID="LinqDataSource6" DataTextField="TitleEn" DataValueField="ID" 
        AppendDataBoundItems="true" AutoPostBack="true" 
        onselectedindexchanged="DropDownListSites_SelectedIndexChanged">
        <asp:ListItem Value="" Text="-All Sites-"></asp:ListItem>
    </asp:DropDownList>
    <asp:LinqDataSource ID="LinqDataSource6" runat="server" OrderBy="TitleEn"
        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" TableName="CouponsSites">
    </asp:LinqDataSource>
    
    <asp:DropDownList ID="DropDownListSource" runat="server" AppendDataBoundItems="true" AutoPostBack="true" 
        onselectedindexchanged="DropDownListSites_SelectedIndexChanged" DataTextField="Key" DataValueField="Value">
        <asp:ListItem Value="" Text="-All Sources-"></asp:ListItem>
 <%--       <asp:ListItem Value="1" Text="Anglodeals"></asp:ListItem>
        <asp:ListItem Value="2" Text="A. Newsletter"></asp:ListItem>
        <asp:ListItem Value="3" Text="Facebook"></asp:ListItem>
        <asp:ListItem Value="4" Text="janglo"></asp:ListItem>
        <asp:ListItem Value="5" Text="Zebradeals"></asp:ListItem>
        <asp:ListItem Value="6" Text="xml"></asp:ListItem>--%>
    </asp:DropDownList>
    
    <asp:DropDownList ID="DropDownListTime" runat="server" AppendDataBoundItems="true" AutoPostBack="true" 
        onselectedindexchanged="DropDownListSites_SelectedIndexChanged">
        <asp:ListItem Value="" Text="-All Time-"></asp:ListItem>
        <asp:ListItem Value="ThisMonth" Text="This Month"></asp:ListItem>
        <asp:ListItem Value="PreviousMonth" Text="Previous month"></asp:ListItem>
        <asp:ListItem Value="7" Text="7 days"></asp:ListItem>
        <asp:ListItem Value="14" Text="14 days"></asp:ListItem>
        <asp:ListItem Value="30" Text="30 days"></asp:ListItem>
        <asp:ListItem Value="60" Text="60 days"></asp:ListItem>
        <asp:ListItem Value="90" Text="90 days"></asp:ListItem>
        <asp:ListItem Value="120" Text="120 days"></asp:ListItem>
        <asp:ListItem Value="180" Text="180 days"></asp:ListItem>
        <asp:ListItem Value="365" Text="365 days"></asp:ListItem>
    </asp:DropDownList>
    
    <br />
    
    <span>CouponID</span>
    <asp:TextBox ID="TextBoxSearchID" runat="server" ValidationGroup="SearchID"></asp:TextBox> 
    <asp:RangeValidator ID="RangeValidator3" runat="server" 
        ControlToValidate="TextBoxSearchID" ErrorMessage="Enter only the number" 
        Type="Integer" ValidationGroup="SearchID" MinimumValue="0" 
        MaximumValue="9999999" Display="Dynamic"></asp:RangeValidator>
     &nbsp;
    <span>ip</span>   
        <asp:TextBox ID="TextBoxIp" runat="server" ValidationGroup="SearchID"></asp:TextBox> 
    <br />
    
    <span>Clicks after</span>
        <asp:TextBox ID="TextBoxInDate" runat="server"></asp:TextBox>
        <cc1:CalendarExtender ID="CalendarExtenderInDate" runat="server" TargetControlID="TextBoxInDate" Format="dd/MM/yyyy">
        </cc1:CalendarExtender>
        <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="TextBoxInDate" ErrorMessage="תאריך בלבד" Display="Dynamic" Type="Date" MinimumValue="01/01/1985" MaximumValue="31/12/2300"></asp:RangeValidator>
        
    <span>Up to date</span>
        <asp:TextBox ID="TextBoxEndDate" runat="server"></asp:TextBox>
        <cc1:CalendarExtender ID="CalendarExtenderEndDate" runat="server" TargetControlID="TextBoxEndDate" Format="dd/MM/yyyy">
        </cc1:CalendarExtender>
        <asp:RangeValidator ID="RangeValidator2" runat="server"  ControlToValidate="TextBoxEndDate" ErrorMessage="תאריך בלבד" Display="Dynamic" Type="Date" MinimumValue="01/01/1985" MaximumValue="31/12/2300"></asp:RangeValidator>

        <asp:Button ID="Button1" runat="server" Text="Filter" onclick="Button1_Click" />
    <br />
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Download Report</asp:LinkButton>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" PageSize="100" CssClass="table" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" onprerender="GridView1_PreRender" ShowFooter="true"
        DataSourceID="LinqDataSource1" EmptyDataText="No results found">
        <Columns>
            <asp:BoundField DataField="InDate" HeaderText="Date" SortExpression="InDate" DataFormatString="{0:dd\/MM\/yyyy HH:mm}" ItemStyle-Wrap="false" />
            <asp:TemplateField HeaderText="CouponID" SortExpression="CouponID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Manager/ClicksReport.aspx?couponID=" + Eval("CouponID") %>' ToolTip='<%# Eval("Coupon.TitleEn") %>' Text='<%# Eval("CouponID") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Site" SortExpression="Coupon.CouponSiteID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink134" runat="server" Text='<%# Eval("Coupon.CouponsSite.TitleEn") %>' NavigateUrl='<%#"~/Manager/ClicksReport.aspx?couponSiteID=" +  Eval("Coupon.CouponSiteID")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Source" SortExpression="Source">
                <ItemTemplate>
                    <%--<asp:Label ID="Label2" runat="server" Text='<%#drvvv.Clicks.SourceName((int) Eval("Source")) %>'></asp:Label>--%>
                    <asp:HyperLink ID="HyperLink130" runat="server" Text='<%# (drvvv.SourceClicks)((int)Eval("Source")) %>' NavigateUrl='<%#"~/Manager/ClicksReport.aspx?source=" +  Eval("Source")%>'></asp:HyperLink>
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Ip" HeaderText="Ip" SortExpression="Ip" />
            <asp:TemplateField HeaderText="Site" SortExpression="Coupon.CouponSiteID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkIp" runat="server" Text='<%# Eval("Ip") %>' NavigateUrl='<%#"~/Manager/ClicksReport.aspx?Ip=" +  Eval("Ip")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ClientID" HeaderText="User" SortExpression="ClientID" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" OrderBy="ID desc" 
        TableName="Clicks" onselecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
</asp:Content>

