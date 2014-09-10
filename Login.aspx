<%@ Page Title="login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>login</h1>
<div style="text-align: right; margin: 24px auto; width: 400px;line-height:32px;">
    <asp:Label ID="Label2" runat="server" Text="Email" Style="text-align: left" Width="70px"></asp:Label>
    <asp:TextBox ID="TextboxNick" runat="server" /><br />
    <asp:Label ID="Label3" runat="server" Text="password" Style="text-align: left" Width="70px"></asp:Label>
    <asp:TextBox ID="TextboxPassword" TextMode="password" runat="server" /><br />
    <span style="margin-right:73px;">
        <asp:CheckBox ID="CheckBoxCookie" runat="server"/>
        <asp:Label ID="Label4" runat="server" Text="Remember me" ></asp:Label><br />
    </span>
    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click1" Text="login" />
    
    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
</div>
</asp:Content>

