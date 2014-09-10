<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manager_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Welcome to the admin panel</h2>
<br />
<div style="margin:24px;">
<h3>Status</h3>
    <div style="width:300px;">
        <asp:Literal ID="LiteralUpdates" runat="server" Mode="PassThrough"></asp:Literal>
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Update Xml" onclick="Button1_Click" />
</div>
</asp:Content>

