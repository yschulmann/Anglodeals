<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="auctions.aspx.cs" Inherits="auctions" %>

<%@ Register Src="~/UC_auctions.ascx" TagPrefix="uc" TagName="UC_auctions" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section id="deals-filter">
<div class="container">
    <div class="Breadcrumbs"><a href="Default.aspx">Home </a> > <span>Auctions</span> </div>
            <h1>Auctions</h1>
            
                <select class="select_city"
                  <asp:DropDownList ID="DropDownListCity" runat="server" AppendDataBoundItems="true" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>" 
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged"  AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCity %>" />
            </asp:DropDownList>
                </select>
                
            
            
                <select class="select_category"
                  <asp:DropDownList ID="DropDownListCategory" runat="server" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>"
            onselectedindexchanged="DropDownListCity_SelectedIndexChanged" AppendDataBoundItems="true" AutoPostBack="true">
                <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCategory %>" />
            </asp:DropDownList>
                 
                </select>
           
            <p class="clear"></p>

</div><!-- container -->
</section><!-- deals-filter -->
    <section id="main">
        <div class="container">
                    <nav>
                         <asp:button type="button" CssClass="right-nav" runat="server" OnClick="Unnamed_Click" ></asp:button>   
                        <span id="content2">
        <div class="Cods">
    <% 
        
        var namePage = "Auctions";
        string[] page = new string[4] { "Deals", "Auctions", "Coupons", "Codes" }; 


        for (int i = 0 ; i < 3 ; i ++) {
            if (page[i] == namePage)
            {
                Response.Write(page[i + 1]);

              
                
            }
           }
        %>
        </div>
        </span>
                        
    <button type="button" id="left-nav"><a href="Default.aspx"><img src="img/navtoleft.png" alt="Navigate to Left"></a></button>
                        
</nav>

</div><!-- container -->
        <div class="container">





                                          <h1 style="font-size :25px;color:#44A642;text-align:center; ">   Page is under construction right now  </h1>



            </div><!-- container -->
</section><!-- home-slider -->
    <section id="main">

</asp:Content>

