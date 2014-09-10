<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContentPage.aspx.cs" Inherits="ContentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="Content">
    <asp:Literal ID="LiteralContent" runat="server" Mode="PassThrough"></asp:Literal>
</div>
</asp:Content>

