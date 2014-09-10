<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="Content">
<h2><asp:Localize ID="Localize1" runat="server"  Text="<%$ Resources:Resource, ContactUs %>" /></h2>
<p>
  <asp:Localize ID="Localize2" runat="server"  Text="<%$ Resources:Resource, ContactUsP %>" />  
</p>
<div style="margin:24px;">
 
    <label><asp:Localize ID="Localize3" runat="server"  Text="<%$ Resources:Resource, Name %>" /></label>
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox><br />
    <label></label>
    <label><asp:Localize ID="Localize4" runat="server"  Text="<%$ Resources:Resource, Email %>" /></label>
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Invalid email address" ControlToValidate="TextBoxEmail" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Contact"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator><br />
    <label><asp:Localize ID="Localize5" runat="server"  Text="<%$ Resources:Resource, Phone %>" /></label>
    <asp:TextBox ID="TextBoxFon" runat="server" ValidationGroup="Contact"></asp:TextBox><br />
    <label><asp:Localize ID="Localize6" runat="server"  Text="<%$ Resources:Resource, Title %>" /></label>
    <asp:TextBox ID="TextBoxIssue" runat="server" ValidationGroup="Contact"></asp:TextBox><br />
    <label><asp:Localize ID="Localize7" runat="server"  Text="<%$ Resources:Resource, Subject %>" /></label>
    <asp:TextBox ID="TextBoxSubject" runat="server" TextMode="MultiLine" Rows="6"  Font-Size="16px" Height="200px" ValidationGroup="Contact"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Resource, Send %>" ValidationGroup="Contact" CssClass="Button"
        style="margin:3px 140px;" onclick="Button1_Click" />
</div>
</div>
</asp:Content>

