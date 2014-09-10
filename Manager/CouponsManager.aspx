<%@ Page Title="Coupons Management" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="CouponsManager.aspx.cs" Inherits="Manager_CouponsManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
    </asp:ToolkitScriptManager>
<h1>Coupons Management</h1>
<div  style="margin:12px 0;">
<asp:Button ID="LinkButton1" runat="server" onclick="LinkButton1_Click" Text="Add Coupon" style="float:right;"></asp:Button> 
Filter: 
    <asp:DropDownList ID="DropDownListSites" runat="server" DataSourceID="LinqDataSource6" DataTextField="TitleEn" DataValueField="ID" 
        AppendDataBoundItems="true" AutoPostBack="true" 
        onselectedindexchanged="DropDownListSites_SelectedIndexChanged">
        <asp:ListItem Value="" Text="-All Sites-"></asp:ListItem>
    </asp:DropDownList>
    <asp:LinqDataSource ID="LinqDataSource6" runat="server" OrderBy="TitleEn"
        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" TableName="CouponsSites">
    </asp:LinqDataSource>
    
    <asp:TextBox ID="TextBoxSearchID" runat="server" ValidationGroup="SearchID"></asp:TextBox> 
    <asp:Button ID="ButtonSearchID" runat="server" Text="Search Coupon ID" 
        ValidationGroup="SearchID" onclick="ButtonSearchID_Click"/>
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="TextBoxSearchID" ErrorMessage="Enter only the number" 
        Type="Integer" ValidationGroup="SearchID" MinimumValue="0" 
        MaximumValue="9999999" Display="Dynamic"></asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="The conference ID for search" ControlToValidate="TextBoxSearchID" 
        ValidationGroup="SearchID" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:Label ID="Label4" runat="server"></asp:Label>
    <br />
    <asp:CheckBox ID="CheckBoxInactive" runat="server" AutoPostBack="true" 
        oncheckedchanged="CheckBoxInactive_CheckedChanged" /> <span>Show Expired Coupons</span>
</div>
     
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  onselectedindexchanging="GridView1_SelectedIndexChanging" PageSize="50"
       AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" Width="100%" CssClass="table" 
        onrowdeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="V" SortExpression="Active">
                <ItemTemplate>
                    <asp:CheckBox ID="SentCheckBox" runat="server" Checked='<%# Bind("Active") %>' oncheckedchanged="AectiveCheckBox_CheckedChanged" AutoPostBack="true" ValidationGroup='<%# Eval("ID") %>' />
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="SentCheckBox" runat="server" Checked='<%# Bind("Active") %>' oncheckedchanged="AectiveCheckBox_CheckedChanged" AutoPostBack="true" ValidationGroup='<%# Eval("ID") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="TitleEn">
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton21" runat="server" Text='<%# Eval("TitleEn") %>' CommandName="Select"></asp:LinkButton>
                     <asp:LinkButton ID="LinkButton31" runat="server" Text='<%# Eval("TitleDefault") %>' CommandName="Select" style="direction:rtl; text-align:right;display: block;"></asp:LinkButton>
                     <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("TitleFr") %>' CommandName="Select"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("TitleEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox><br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TitleDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox><br />
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TitleFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Fine Print" SortExpression="SubjectEn">
                <ItemTemplate>
                     <asp:LinkButton ID="LinkButton22" runat="server" Text='<%# Eval("SubjectEn") %>' CommandName="Select"></asp:LinkButton>
                     <asp:LinkButton ID="LinkButton32" runat="server" Text='<%# Eval("SubjectDefault") %>' CommandName="Select" style="direction:rtl; text-align:right;display: block;"></asp:LinkButton>
                     <asp:LinkButton ID="LinkButton4" runat="server" Text='<%# Eval("SubjectFr") %>' CommandName="Select"></asp:LinkButton>
                     
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox><br />
                    <asp:TextBox ID="TextBoxSubjectDefault" runat="server" Text='<%# Bind("SubjectDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubjectFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox><br />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink11" runat="server" Text='<%# Bind("Category.TitleEn") %>' NavigateUrl='<%#"~/Manager/CatgoryManager.aspx?item=" +  Eval("ID")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CouponSite" SortExpression="CouponSiteID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink13" runat="server" Text='<%# Bind("CouponsSite.TitleEn") %>' NavigateUrl='<%#"~/Manager/SitesManager.aspx?item=" +  Eval("ID")%>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="links" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink4" runat="server" Text='<%# "All: " + drvvv.Clicks.couponClicks(Eval("Clicks")) %>' NavigateUrl='<%#"~/Manager/ClicksReport.aspx?couponID=" +  Eval("ID")%>' ToolTip="Click the full statistics"></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink12" runat="server" Text='<%# string.Format("Anglodeals ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),1))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=1&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# string.Format("Newsletter ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),2))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=2&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# string.Format("AFacebook ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),3))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=3&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# string.Format("Zebradeals ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),5))%>' NavigateUrl='<%#"http://zebradeals.co.il/CouponAddress.aspx?SiteID=5&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink5" runat="server" Text='<%# string.Format("francodeals ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),8))%>' NavigateUrl='<%#"http://francodeals.co.il/CouponAddress.aspx?SiteID=8&couponID=" +  Eval("ID")%>'></asp:HyperLink>

                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Clicks">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# drvvv.Clicks.couponClicks((int)Eval("ID")) + (int)Eval("Visits") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate></InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Kosher" HeaderText="Kosher" SortExpression="Kosher" />--%>
            <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EndDate", @"{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="ButtonSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Select" />
                    <%--<asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>--%>
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="ButtonUpdate" runat="server" CausesValidation="False" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
 
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" OrderBy="ID desc" 
        TableName="Coupons" EnableDelete="True" EnableUpdate="true"
        onselecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
    
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Visible="false"
        DataKeyNames="ID" DataSourceID="LinqDataSource2" OnItemInserted="DetailsView1_ItemInserted"
        oniteminserting="DetailsView1_ItemInserting" Width="100%" CssClass="table"
        onitemupdated="DetailsView1_ItemUpdated" onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" onitemdeleting="DetailsView1_ItemDeleting">
        <Fields>
            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <ItemTemplate>
                    <asp:Label ID="LabelTitle" runat="server" Text='<%#" ID: " + Eval("ID") %>' style="float:right;"></asp:Label>              
                    <asp:CheckBox ID="SentCheckBox" runat="server" Checked='<%# Bind("Active") %>' Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%#" ID: " + Eval("ID") %>' style="float:right;"></asp:Label>
                    <asp:CheckBox ID="SentCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("TitleDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    <asp:TextBox ID="TextBoxTitleEn" runat="server" Text='<%# Bind("TitleEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    <asp:TextBox ID="TextBoxTitleFr" runat="server" Text='<%# Bind("TitleFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("TitleDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleEn" runat="server" Text='<%# Bind("TitleEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleFr" runat="server" Text='<%# Bind("TitleFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
           <asp:TemplateField HeaderText="Fine Print">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    <asp:TextBox ID="TextBoxubject" runat="server" Text='<%# Bind("SubjectDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    <asp:TextBox ID="TextBoxubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    <asp:TextBox ID="TextBoxubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Labelubject" runat="server" Text='<%# Bind("SubjectDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource3" DataTextField="TitleEn" DataValueField="ID"  AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("CategoryID") %>'>
                        <asp:ListItem Value="" Text="-Select Category-"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="CityID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource5" DataTextField="TitleEn" DataValueField="ID" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("CityID") %>'>
                        <asp:ListItem Value="" Text="-All Israel-"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("City.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CouponSite" SortExpression="CouponSiteID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="LinqDataSource6" DataTextField="TitleEn" DataValueField="ID" 
                        SelectedValue='<%# Bind("CouponSiteID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CouponsSite.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" SortExpression="ImgName">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImgName")) %>' style="max-width:200px;" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUploadImageReplacement" runat="server" />
                    <asp:Button ID="ButtonImageReplacement" runat="server" Text="Picture update" CommandArgument='<%# Eval("ID") %>' onclick="ButtonImageReplacement_Click" />
                    <asp:Label ID="LabelUploadImageReplacement" runat="server"></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                <asp:FileUpload ID="FileUploadImage" runat="server" />
                    <asp:Label ID="LabelUploadImage" runat="server"></asp:Label>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LinkToDeal" HeaderText="LinkToDeal" 
                SortExpression="LinkToDeal" ControlStyle-Width="99%">
<ControlStyle Width="99%"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ApplyFormatInEditMode="true" DataFormatString="{0:F2}"
                ControlStyle-Width="99%">
<ControlStyle Width="99%"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OriginalPrice" HeaderText="OriginalPrice" 
                SortExpression="OriginalPrice" ControlStyle-Width="99%" ApplyFormatInEditMode="true" DataFormatString="{0:F2}">
<ControlStyle Width="99%"></ControlStyle>
            </asp:BoundField>
            <asp:CheckBoxField DataField="Kosher" HeaderText="Kosher" SortExpression="Kosher" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" 
                SortExpression="Priority" ControlStyle-Width="99%">
<ControlStyle Width="99%"></ControlStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                <ItemTemplate>
                    <asp:Label ID="LabelEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEndDate" runat="server" Text='<%# Bind("EndDate", "{0:dd/MM/yyyy HH:mm}") %>' Width="100%"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender5" runat="server"
                        TargetControlID="TextBoxEndDate" Mask="99\/99\/9999 99:99" MessageValidatorTip="true" ClearMaskOnLostFocus="false"
                        OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" DisplayMoney="Left" AcceptNegative="Left" ErrorTooltipEnabled="True" />
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" EnabledOnClient="true" Format="dd/MM/yyyy 23:59" TargetControlID="TextBoxEndDate">
                    </asp:CalendarExtender>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Clicks">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink4" runat="server" Text='<%# "All: " + drvvv.Clicks.couponClicks(Eval("Clicks")) %>' NavigateUrl='<%#"~/Manager/ClicksReport.aspx?couponID=" +  Eval("ID")%>' ToolTip="Click the full statistics"></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink12" runat="server" Text='<%# string.Format("Anglodeals ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),1))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=1&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# string.Format("Newsletter ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),2))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=2&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# string.Format("Facebook ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),3))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=3&couponID=" +  Eval("ID")%>'></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# string.Format("Zebradeals ({0})", drvvv.Clicks.couponClicks(Eval("Clicks"),5))%>' NavigateUrl='<%#"http://anglodeals.co.il/CouponAddress.aspx?SiteID=5&couponID=" +  Eval("ID")%>'></asp:HyperLink>
                </ItemTemplate>
                <InsertItemTemplate></InsertItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" OrderBy="Priority Desc, ID Desc"
        EnableInsert="True" EnableUpdate="True" TableName="Coupons"  onselecting="LinqDataSource2_Selecting">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="-1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="-1" Name="ID1" QueryStringField="ItemID" Type="Int32"/>
        </WhereParameters>
    </asp:LinqDataSource>  
    <asp:Button ID="Button1" runat="server" Text="Enable all active coupons" onclick="Button1_Click" OnClientClick="if(!confirm('Make all coupons active? (Not refundable)')) return false;" />
    <asp:Button ID="ButtonClearPriorities" runat="server" Text="Clear Priorities" onclick="ButtonClearPriorities_Click" OnClientClick="if(!confirm('Clear Priorities? (Not refundable)')) return false;" />
    
      <asp:LinqDataSource ID="LinqDataSource3" runat="server" OrderBy="TitleEn"
            ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
            TableName="Categories">
        </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource5" runat="server" OrderBy="TitleEn"
        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
        TableName="Cities">
    </asp:LinqDataSource>
     <asp:LinqDataSource ID="LinqDataSource4" runat="server" OrderBy="TitleEn"
        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
        TableName="CouponsSites">
    </asp:LinqDataSource>
</asp:Content>  

