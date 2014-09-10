<%@ Control Language="C#" AutoEventWireup="true" CodeFile="U_C_Coupone.ascx.cs" Inherits="U_C_Coupone" %>

<%@ Register Src="~/scrinShadw.ascx" TagPrefix="uc" TagName="scrinShadw" %>
 
    


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

  
       
        
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" TableName="Businesses" 
        onselecting="LinqDataSource1_Selecting" OrderBy="Priority desc">
    </asp:LinqDataSource>  
</asp:Content>