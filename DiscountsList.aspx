<%@ Page Title="FREE PRINTABLE COUPONS" Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DiscountsList.aspx.cs" Inherits="DiscountsList" %>

<%@ Register Src="~/scrinShadw.ascx" TagPrefix="uc" TagName="scrinShadw" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <br /><br /><br />

    <uc:scrinShadw runat="server" id="scrinShadw" />

       <section id="deals-filter">
              <div class="container">
    <div class="Breadcrumbs"><a href="Default.aspx">Home </a> > <span>Coupons</span> </div>
            <h1>Coupons</h1>       
     <select class="select_city"
       
        <asp:DropDownList ID="DropDownListArea" runat="server" AppendDataBoundItems="true" DataValueField="ID" DataTextField="<%$ Resources:Resource, DataTitle %>">
            <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectArea %>" />
        </asp:DropDownList>
        </select>
     <select class="select_category"
       
        <asp:DropDownList ID="DropDownListCity" runat="server">
            <asp:ListItem Value="" Text="<%$ Resources:Resource, SelectCity %>" />
        </asp:DropDownList>
          </select>
            <ajaxToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="DropDownListCity"
            Category="Cities" PromptText="<%$ Resources:Resource, SelectCity %>" LoadingText="<%$ Resources:Resource, LoadingCities %>"
            ServiceMethod="GetDropDownContentsPageMethod" ParentControlID="DropDownListArea" />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ButtonBlue float" 
            onclick="LinkButton1_Click" style="margin: 4px 120px 0 0;" Text="<%$ Resources:Resource, Select %>" />
            <p class="clear"></p>
    
</div><!-- container -->
</section><!-- deals-filter -->

            <section id="main">

                <div class="container">
                        <nav>
                     
                        <asp:button type="button" CssClass="right-nav" runat="server" OnClick="btnRedirectToOnloneCodes" ></asp:button>  
                        <span id="content2">
        <div class="Coupons">
    <% 
        
        var namePage = "Coupons";
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
                        
    <button type="button" id="left-nav"><a href="auctions.aspx"><img src="img/navtoleft.png" alt="Navigate to Left"></a></button>
                        
</nav>

</div><!-- container -->


<div class="container">
     <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" >
<ItemTemplate>
                 <div class="oneDeal coupons">
       
                      <div class='<%# (int)Eval("Priority") >= 700 ? "PrintableListItem " : "PrintableListItem" %>'>
                          <!-- <div class='<%# (int)Eval("Priority") >= 700 ? "PrintableListItem Featured" : "PrintableListItem" %>'>!-->
           
                            <div class="header">
                        <span class="left"></span>
                        <span class="right-location"><asp:Label ID="Label5" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label> </span></span>
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
               
                             <div class="button"><a id="print-coupon<%#(int)Eval("ID") %>"   <%# post_Poz=((int)Eval("ID"))%> class="print-coupon"></a></div>
                                
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
   </section><!-- main -->
   
        
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" TableName="Businesses" 
        onselecting="LinqDataSource1_Selecting" OrderBy="Priority desc">
    </asp:LinqDataSource>  
 
      <% Response.Write("<script> var a=" + temp + ";</script>"); %>
    <script type="text/javascript">
       
        if (a!=0)
            {
        window.location.href = "DiscountsList.aspx#print-coupon" +a;
        }
    </script>
</asp:Content>
