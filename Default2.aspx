<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:ListView  runat="server" ID="lvAll"  DataSource ="dsAllTypes"  DataKeyNames="ID">

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
               
                 <div class="button"><a id="print-coupon<%#(int)Eval("ID") %>"  class="print-coupon"></a></div>
               
                
                       
                <a class="more" href="">More about Cafe Greg</a>
            </figure>
             </div>
        </div><!-- oneDeal-hover -->
    </div><!-- oneDeal -->
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
    



    <asp:LinqDataSource TableName="vAllTypes" runat="server" ID="dsAllTypes" OnSelecting="dsAllTypes_Selecting" >

    </asp:LinqDataSource>
    
</asp:Content>

