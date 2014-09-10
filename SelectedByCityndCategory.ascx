<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SelectedByCityndCategory.ascx.cs" Inherits="SelectedByCityndCategory" %>

<section id="deals-filter">
    <div class="container">
        <div class="Breadcrumbs"><a href="Default.aspx">Home </a>> <span>Deals of the day</span> </div>
        <h1>Deals of the day</h1>

        <select class="select_city">
            <asp:DropDownList ID="DropDownListCity" runat="server" AppendDataBoundItems="true" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>"
                OnSelectedIndexChanged="DropDownListCity_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCity %>" />
            </asp:DropDownList>
        </select>



        <select class="select_category">
            <asp:DropDownList ID="DropDownListCategory" runat="server" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>"
                OnSelectedIndexChanged="DropDownListCity_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCategory %>" />
            </asp:DropDownList>

        </select>

        <p class="clear"></p>

    </div>
    <!-- container -->
</section>
<!-- deals-filter -->
