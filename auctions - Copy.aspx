<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="auctions - Copy.aspx.cs" Inherits="auctions" %>

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
            <%for (int i = 0; i<12; i++) {%> <uc:UC_auctions runat="server" id="UC_auctions" /><%} %>
        </div>
     </section>
    <div id="screen-shadow-auctions">
<div id="popups">

    <div class="oneDeal auctions">
            <div class="header">
                <button class="leftImg" > </button>
                <span class="right-location">Auction Bid & Win meals, attractions... at a low price</span>
            </div>
            <figure> 
                <img class="old" src="img/po7.png" alt="">
                <a class="more" href="">More info about GREG</a>              
                            
                <p class="description"> פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על 
                    המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים 
                    על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה 
                    פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים ע</p>
                    <div><span class="worth">First Bid NIS 90</span></div>
                <div class="title">Current Bid NIS 105</div>
                    <div class="code">
                        <div class="input">
                            <input type="text" value="Name:">
                        </div>
                        <div class="input">
                            <input type="text" value="Mail:">
                        </div>
                        <div class="input">
                            <input type="text" value="Phone:">
                        </div>
                        <div class="MyBid">
                            <input type="text" value="My bid:">
                        </div>
                        
                    </div>    
                <div class="button"><a href="">place your bid</a></div>
                <time class="remain">20:05:00</time>
            </figure>
                <div class="credit">
            A short text that explains the Terms of Use, A short text that explains the Terms of Use, A 
short text that explains the Terms of Use
                </div>
    </div><!-- oneDealPopups -->
    </div>  
</div><!-- screen-shadow-auctions --> 
    <script>
        
        $('.Place-Your-bid').click(function () {
            $("#screen-shadow-auctions ").show();
        })
        $('.leftImg').click(function () {
            $("#screen-shadow-auctions").hide();
        })
        

</script>
</asp:Content>

