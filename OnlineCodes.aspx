<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OnlineCodes.aspx.cs" Inherits="Onlinecodes" %>

<%@ Register Src="~/UC_Codds.ascx" TagPrefix="uc" TagName="UC_Codds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section id="deals-filter">
         <script type="text/javascript" src="js/jquery.zclip.min.js"></script>
          <script type="text/javascript" src="js/anglodeals.js"></script>

   
    <div class="container">

        <div class="Breadcrumbs"><a href="Default.aspx">Home </a> > <span>Codes</span> </div>
            <h1>Codes</h1>
            
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


     <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="DSOC1" >
<ItemTemplate>
                 <div class="oneDeal coupons">
       
                      <div class='<%# (int)Eval("Priority") >= 700 ? "PrintableListItem " : "PrintableListItem" %>'>
                          
                            <div class="header">
                        <span class="left"></span>
                        <span class="right-location"><asp:Label ID="Label5" runat="server" 
                            Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'>

                                                     </asp:Label>

                        </span>
                                
                    </span>
                    </div><!-- header -->

                          <figure>
                    <div class="center-img">
                        <img class="main-img" src="img/ps2.png" alt="">
                    </div>
                    <figcaption class="bottom">
           
                        <div class="title">
                
                            <asp:Label ID="Label3" runat="server" Text='<%# drvvv.Plugins.TitleDiscount(Eval("Discounts")) %>' CssClass="title"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# drvvv.Plugins.CouponsCountTitle((int)Eval("Discounts.Count"))%>' CssClass="mor"></asp:Label>
          
                        </div>
                        <p class="description"><asp:Label ID="Label7" runat="server" Text='<%# Eval("Title" + Page.Theme) %>'></asp:Label>
                        <asp:HyperLink ID="HyperLink6" runat="server"  Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject" + Page.Theme), 450) %>' NavigateUrl='<%#"~/BusinesPage.aspx?Busines=" + Eval("ID") %>'></asp:HyperLink></p>
                    </figcaption><!-- bottom--> 
                    </figure>
                
                     <div class="oneDeal-hover">
                        <div class="header">
                            <span class="left"></span>
                            <span class="right-location"><asp:Label ID="Label6" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label> </span></span>
                        </div>
                        <figure>                
                            <div class="title">
                                <asp:Label ID="Label1" runat="server" Text='<%# drvvv.Plugins.TitleDiscount(Eval("Discounts")) %>' CssClass="title"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# drvvv.Plugins.CouponsCountTitle((int)Eval("Discounts.Count"))%>' CssClass="mor"></asp:Label></div>
                            <span class="worth">Worth 80 NIS</span>                
                            <p class="description"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Title" + Page.Theme) %>'></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject" + Page.Theme), 450) %>' NavigateUrl='<%#"~/BusinesPage.aspx?Busines=" + Eval("ID") %>'></asp:HyperLink></p>
               
                             <div class="button"><a id="print-coupon<%#(int)Eval("ID") %>"   <%# post_Poz=((int)Eval("ID"))%> class="get-code"></a></div>
                                
                 <asp:Label   
                            ID="Label9"  
                            runat="server"  
                            Text='<%# Eval("ID")%>'  
                            >  
                        </asp:Label>
                       
                            <a class="more" href="">More about Cafe Greg</a>
                        </figure>
                         </div>
                    </div><!-- oneDeal-hover -->
                </div><!-- oneDeal -->
   


                <script>


                    $('#print-coupon<%#(int)Eval("ID") %>').click(function () {
                        $('#screen-shadow-coupons<%#(int)Eval("ID") %>').show();
                    })
                    $('#leftImg<%#(int)Eval("ID") %>').click(function () {
                        $('#screen-shadow-coupons<%#(int)Eval("ID") %>').hide();
                    })
                    $('#afd').click(function () {
                        $();
                    })


                </script>

  
</ItemTemplate>
          
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>

        <LayoutTemplate>

            <div ID="itemPlaceholderContainer" runat="server" class="PrintableList">
                <span ID="itemPlaceholder" runat="server" />
            </div>
   
                     <div class="more-deals"><asp:Button id="afd" runat="server"  onclick ="Unnamed_Click"  text="More Coupon" />
                        
                     </div>
            <button type="button" id="back-to-top"><a href="#main" title="Back to Top"><img src="img/bkttop.png" alt="Back to Top"></a></button>
           
          
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                    
                </asp:DataPager>
            </div>      
            
        </LayoutTemplate>
    </asp:ListView>
    </div><!-- container -->

<div class="container">


    

</div><!-- container -->
</section><!-- deals-filter -->
    <section id="main">
        <div class="container">
                    <nav>
                      <asp:button type="button" CssClass="right-nav" runat="server" OnClientClick="return false;"  ></asp:button>  
                        <span id="content2">
        <div class="Coupons">
    <% 
        
        var namePage = "Codes";
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
                        
    <button type="button" id="left-nav"><a href="DiscountsList.aspx"><img src="img/navtoleft.png" alt="Navigate to Left"></a></button>
                        
</nav>

</div><!-- container -->
        <div class="container">

           <%for (int i = 0; i<12; i++) {%> <uc:UC_Codds runat="server" id="UC_Codds" /><%} %>

    </div>
        </section>
    <div id="screen-shadow">
<div id="popups">

    <div class="oneDeal codes">
            <div class="header">
                <button class="leftImg" > </button>
                <span class="right-location">Online coupon codes</span>
            </div>
            <figure> 
                <img class="old" src="img/po1.png" alt="">
                <a class="more" href="">More info about GREG</a>              
                            
                <p class="description"> פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על 
                    המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים 
                    על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה 
                    פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים ע</p>
                <div class="title">Only 19 NIS</div>
                <p  class="desc">For the entire menu at La Pavee kosher gourmet grill 
                    restaurant in the city center!</p>
                    <div class="code">
                        
                        <div class="inputCode">
                            89745ALh15
                        </div>
                        <a id="copy_to_clipboard" data-clipboard="123456789">Copy this code</a>
                    </div>    
                <div class="button"><a href="">Go to website</a></div>
                
            </figure>
                <div class="credit">
            A short text that explains the Terms of Use, A short text that explains the Terms of Use, A 
short text that explains the Terms of Use
                </div>
    </div><!-- oneDealPopups -->
    </div>
</div><!-- screen-shadow -->
   <asp:LinqDataSource ID="DSOC1" runat="server" ContextTypeName="DataClassesDataContext" TableName="OnLineCodes"
        onselecting="DSOC1_Selecting" OrderBy="Priority desc" />
       
       
       
      

    <script type="text/javascript">
        $('.button').click(function () {
         $("#screen-shadow").show();})
        $('.leftImg').click(function(){
            $("#screen-shadow").hide();})

    </script>

</asp:Content>

