<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UC_Codds.ascx" TagPrefix="uc" TagName="UC_Codds" %>

<%@ Register Src="~/UC_auctions.ascx" TagPrefix="uc" TagName="UC_auctions" %>

<%@ Register Src="~/scrinShadw.ascx" TagPrefix="uc" TagName="scrinShadw" %>

<%@ Register Src="~/U_C_Coupone.ascx" TagPrefix="uc" TagName="U_C_Coupone" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
    <script src="js/Timer.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <section id="home-slider">
        <div class="container">
                    <nav>
                        <button type="button" id="right-nav" ><a href="DealsDay.aspx"></a></button>
                        <span id="content2">
        <div class="Coupons">
    <% 
        var namePage = "Default";
         string [] page = new string[5] {"Default","Deals","Auctions","Coupons","Codes"}; 

        for (int i = 0 ; i < 3 ; i ++) {
            if (page[i] == namePage)
            {
               Response.Write (page[i+1]);
            }
           }
        %>

        </div>
        </span> 
    <button type="button" id="left-nav"><a href="/"><img src="img/navtoleft.png" alt="Navigate to Left"></a></button>
</nav>

</div><!-- container -->
<div class="container">

    <div class="oneDeal deals">
        <div class="header">
            <span class="left"></span>
            <span class="right-href"><a href=""></a></span>
        </div><!-- header -->
        <figure>
        <!-- <div class="center-img"> -->
            <img class="main-img" src="img/deals-ex.png" alt="">
        <!-- </div> -->
        <figcaption class="bottom">
            <time class="remain">20:05:00</time>
            <div class="title">Only 40 ₪<span class="worth">Worth 80 NIS</span></div>
            <p class="description">For the entire menu at La Pavee kosher gourmet grill restaurant</p>
            <div class="location">Tel Aviv</div>
        </figcaption><!-- bottom -->
        </figure>
        <div class="oneDeal-hover">
            <div class="header">
                <span class="left"></span>
                <span class="right-href"><a href=""> </a></span>
                <span class="right-location">Tel Aviv</span>
            </div>
            <figure>                
                <div class="title">Only 40 &#8362;</div>
                <span class="worth">Worth 80 NIS</span>                
                <p class="description">For the entire menu at La Pavee kosher gourmet grill restaurant</p>
                <div class="button"><a href=""></a></div>
                <time class="remain">20:05:00</time>
                <a class="more" href="">More about Cafe Greg</a>
            </figure>
        </div><!-- oneDeal-hover -->
        </div><!-- oneDeal -->

        <div class="oneDeal coupons">
        <div class="header">
            <span class="left"></span>
            <span class="right-href"><a href=""></a></span>
        </div><!-- header -->
        <figure>
        <!-- <div class="center-img"> -->
            <img class="main-img" src="img/auction-ex.png" alt="">
        <!-- </div> -->
        <figcaption class="bottom">
            <time class="remain">20:05:00</time>
            <div class="title">Current Bid 105 ₪</div>
            <p class="description">For the entire menu at La Pavee kosher gourmet grill restaurant</p>
            <div class="location">Migron</div></a>
        </figcaption><!-- bottom -->
        </figure>
        <div class="oneDeal-hover">
            <div class="header">
                <span class="left"></span>
                <span class="right-href"><a href=""></a></span>
                <span class="right-location">Eilat</span>
            </div>
            <figure>
                <div class="subtitle">First Bid NIS 90</div>                
                <div class="title">Current Bid 105 &#8362;</div><!--title-->                
                <p class="description">For the entire menu at La Pavee kosher
                    gourmet grill restaurant</p>
                <div class="button"><a class="print-coupon"></a></div>
                <time class="remain">20:05:00</time>
                <a class="more" href="">More about Waffle Factory</a>
            </figure>
        </div><!-- oneDeal-hover -->
    </div><!-- oneDeal -->

</div><!-- container -->
</section><!-- home-slider -->
    <section id="main">

     <div class="container">         
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1">
           <ItemTemplate>    
               
              <div class="<%# DoSomething((int)Eval("type")) %>" >
                     <div class='<%# (int)Eval("Priority") >= 700 ? "PrintableListItem " : "PrintableListItem" %><%# (Eval("type")) %>'>
                          <!-- <div class='<%# (int)Eval("Priority") >= 700 ? "PrintableListItem Featured" : "PrintableListItem" %>'>!-->
                            <div class="header">
                        <span class="left"></span>
                        <span class="right-location"><asp:Label ID="Label5" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("TitleEn"))? "All Israel" : Eval("TitleDefault"/* + Page.Theme*/) %>'></asp:Label> </span></span>
                    </div><!-- header -->
                          <figure>
                    <div class="center-img" >
                        <img class="main-img" src="img/ps2.png" alt="">
                    </div>
                    <figcaption class="bottom">
           
                        <div class="title">
                
                            <!--<asp:Label ID="Label3" runat="server" Text='/*<%# drvvv.Plugins.TitleDiscount(Eval("Discount"))%>*/' CssClass="title"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='/*<%# drvvv.Plugins.CouponsCountTitle((int)Eval("Discounts.Count"))%>*/' CssClass="mor"></asp:Label>-->
          
                        </div>
                        <p class="description"><asp:Label ID="Label7" runat="server" Text='<%# Eval("Title" + Page.Theme) %>'></asp:Label>
                        <asp:HyperLink ID="HyperLink6" runat="server"  Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject" + Page.Theme), 450) %>' NavigateUrl='<%#"~/BusinesPage.aspx?Busines=" + Eval("ID") %>'></asp:HyperLink></p>
                    </figcaption><!-- bottom--> 
                    </figure>
                
                     <div class="oneDeal-hover">
                        <div class="header">
                            <span class="left"></span>
                            <span class="right-location"><asp:Label ID="Label6" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("ID").ToString ())? "All Israel" : Eval("Title" + Page.Theme) %>'></asp:Label> </span></span>
                        </div>
                        <figure>
                          
                        
                <div class="<%# txtVisiblity((int)Eval("type")) %>" >
                <figcaption class="bottom" > 
                                    <time class="remain" >
                                        <div id='<%# "time" + Eval("ID") %>' class="time"> </div>
                                        <script type='text/javascript'>
                                            try {
                                                new timer('<%# drvvv.Plugins.TimeTimer((DateTime)Eval("EndDate")) %>', '<%# "time" + Eval("ID") %>').run();
                                            }
                                            catch (err) { 
                                                //*alert('<%# "time" + Eval("ID") %>'); 
                                            }
                                         </script></time>
                                    <div class="title">Only <asp:Literal ID="Literal12" runat="server" Text='<%# Eval("Price", "₪{0:f0}")%>'/><span class="worth">Worth 80 NIS</span></div>
                                    <p class="description"><asp:HyperLink ID="HyperLink2" runat="server"  Text='<%# Eval("Title" + Page.Theme) %>' NavigateUrl='<%#string.Format("~/CouponAddress.aspx?couponID={0}&SiteID={1}",(int)Eval("ID"),1) %>' Target="_blank"></asp:HyperLink></p>
                                </figcaption><!-- bottom --> 
                             </div>           
                            <div class="title">
                                <!--<asp:Label ID="Label1" runat="server" Text='<%/*# drvvv.Plugins.TitleDiscount(Eval("Discounts")) %>' CssClass="title"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%/*# drvvv.Plugins.CouponsCountTitle((int)Eval("Discounts.Count"))*/%>' CssClass="mor"></asp:Label>--></div>
                            <span class="worth">Worth 80 NIS</span>                
                            <p class="description"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Title" + Page.Theme) %>'></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject" + Page.Theme), 450) %>' NavigateUrl='<%#"~/BusinesPage.aspx?Busines=" + Eval("ID") %>'></asp:HyperLink></p>
               
                             <div class="button"><a id="print-coupon<%#(int)Eval("ID") %>"  class="print-coupon"></a></div>
               
                
                       
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

                </script>

  

  
        </ItemTemplate>
          
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>

        <LayoutTemplate>

            <div ID="itemPlaceholderContainer" runat="server" class="PrintableList">
                <span ID="itemPlaceholder" runat="server" />
            </div>
   
                     <div class="more-deals"><asp:Button runat="server" onclick ="Unnamed_Click" text="More Coupon"/>
                        
                     </div>
            <button type="button" id="back-to-top"><a href="#" title="Back to Top"><img src="img/bkttop.png" alt="Back to Top"></a></button>
           
          
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                    
                </asp:DataPager>
            </div>      
            
        </LayoutTemplate>
    </asp:ListView>
         </div><!-- container -->
   </section><!-- main -->
   
         <div class="more-deals"><a href="" title="More DEALS AUCTIONS COUPONS and CODES">More Deals</a></div>
<button type="button" id="back-to-top"><a href="#" title="Back to Top"><img src="img/bkttop.png" alt="Back to Top"></a></button>
        </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" TableName="vAllTypes"
        onselecting="LinqDataSource1_Selecting" OrderBy="Priority desc">
    </asp:LinqDataSource> 
</asp:Content>



