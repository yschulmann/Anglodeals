<%@ Control Language="C#" AutoEventWireup="true" CodeFile="scrinShadw.ascx.cs" Inherits="scrinShadw" %>
<div id="screen-shadow-coupons<%#(int)Eval("ID") %>" class="printCouponPerId" >
<div id="popups">
    <div class="oneDeal coupons">
            <div class="header">
                <button id="leftImg<%#(int)Eval("ID") %>" class="leftImg" > </button>
                <span class="right-location"><asp:Label ID="Label9" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City.TitleEn"))? "All Israel" : Eval("City.Title" + Page.Theme) %>'></asp:Label> </span>
            </div>
            <figure> 
                <img class="old" src="img/po5.png" alt="">

                <a class="more" href="">More info about GREG</a>              
                            
                <p class="description" id="popup_description"> פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על 
                    המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים 
                    על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה 
                    פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים על המסעדה פרטים ע</p>
                    
                <div class="title"><asp:Label ID="Label10" runat="server" Text='<%# drvvv.Plugins.TitleDiscount(Eval("Discounts")) %>' CssClass="title"></asp:Label>
                <asp:Label ID="Label11" runat="server" Text='<%# drvvv.Plugins.CouponsCountTitle((int)Eval("Discounts.Count"))%>' CssClass="mor"></asp:Label></div>
                <p  class="desc"><asp:Label ID="Label12" runat="server" Text='<%# Eval("Title" + Page.Theme) %>'></asp:Label>
            <asp:HyperLink ID="HyperLink2" runat="server"  Text='<%# drvvv.CatSummary.Cat((string)Eval("Subject" + Page.Theme), 450) %>' NavigateUrl='<%#"~/BusinesPage.aspx?Busines=" + Eval("ID") %>'></asp:HyperLink></p>
                    <div class="code">
                        <div class="input">
                            <input type="text" value="Name:">
                        </div>
                        <div class="input">
                            <input type="text" value="Mail:">
                        </div>
                       <!-- <div class="input">
                            <input type="text" value="Phone:">
                        </div>-->
                       <!-- <div class="MyBid">
                            <input type="text" value="My bid:">
                        </div>-->
                        
                    </div>    
                <div class="button"><a href="">print coupon</a></div>
                
            </figure>
                <div class="credit">
            A short text that explains the Terms of Use, A short text that explains the Terms of Use, A 
short text that explains the Terms of Use
                </div>
    </div><!-- oneDealPopups -->
    </div>  
</div><!-- screen-shadow-coupons -->