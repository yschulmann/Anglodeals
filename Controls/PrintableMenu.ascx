<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrintableMenu.ascx.cs" Inherits="Controls_PrintableMenu" %>


    <!--<asp:BulletedList ID="BulletedListTabsCategories" CssClass="TabsCategories" DisplayMode="HyperLink" runat="server">
    </asp:BulletedList>-->
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
        <hr />
        <div class="SubCategories">
            <asp:RadioButtonList ID="RadioButtonListTags" runat="server" 
                AppendDataBoundItems="true" RepeatLayout="Flow" RepeatDirection="Horizontal" 
                AutoPostBack="true" 
                onselectedindexchanged="RadioButtonListTags_SelectedIndexChanged"> 
            </asp:RadioButtonList>
            <asp:CheckBox ID="CheckBoxMehadrin" runat="server" Text="<%$ Resources:Resource, Mehadrin %>" AutoPostBack="true" 
                Visible="false" CssClass="CheckBoxMehadrin"  oncheckedchanged="CheckBoxMehadrin_CheckedChanged"/>
        </div>    
    </div>
   

        <p class="clear"></p>

</div><!-- container -->
</section><!-- deals-filter -->
