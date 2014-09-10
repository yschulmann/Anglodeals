<%@ Page Title="Discounts manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DiscountsManager.aspx.cs" Inherits="Manager_DiscountsManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
    </asp:ToolkitScriptManager>
<h2>Discounts manager</h2>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Manager/BusinessesManager.aspx">Businesses Manager</asp:HyperLink>
    <asp:Button ID="LinkButton1" runat="server" onclick="LinkButton1_Click" Text="Add Discounts" ></asp:Button> 
<br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
<br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AllowPaging="True" onselectedindexchanging="GridView1_SelectedIndexChanging" PageSize="50"
         onrowdeleting="GridView1_RowDeleting"  AllowSorting="True" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" DataKeyNames="ID" Width="100%">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Title" SortExpression="TitleDefault">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Bind("TitleEn") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Business" SortExpression="BusinessID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkBusinessesManager" runat="server" NavigateUrl='<%# "~/Manager/BusinessesManager.aspx?ItemID=" + Eval("BusinessID") %>' Text='<%# Eval("BusinessTitleEn") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Link" SortExpression="Link" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkLink" runat="server" NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Link") %>' Target="_blank" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DiscountEn" HeaderText="Discount" SortExpression="DiscountEn" />
            <asp:BoundField DataField="Priority" HeaderText="Priority"  SortExpression="Priority" />
            <asp:BoundField DataField="InDate" HeaderText="InDate" SortExpression="InDate" />
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="true" SelectText="Edit" />
        </Columns>
    </asp:GridView>
    
    <asp:DetailsView ID="DetailsView1" runat="server" oniteminserting="DetailsView1_ItemInserting" Width="100%" CssClass="table"
        onitemupdated="DetailsView1_ItemUpdated" onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" onitemdeleting="DetailsView1_ItemDeleting"
        AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID" Visible="false"
        DataSourceID="LinqDataSource2">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False"  ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Business" SortExpression="BusinessID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListBusinessID" runat="server" DataSourceID="LinqDataSource3" DataTextField="TitleEn" 
                        SelectedValue='<%# Bind("BusinessID") %>' DataValueField="ID"  AppendDataBoundItems="true">
                            <asp:ListItem Value="" Text="-Select Business-"></asp:ListItem>
                         </asp:DropDownList>
                        <asp:LinqDataSource ID="LinqDataSource3" runat="server" OrderBy="TitleEn"
                            ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" TableName="Businesses">
                        </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Business.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Title" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("TitleDefault") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    <asp:TextBox ID="TextBoxTitleEn" runat="server" Text='<%# Bind("TitleEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    <asp:TextBox ID="TextBoxTitleFr" runat="server" Text='<%# Bind("TitleFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("TitleDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleEn" runat="server" Text='<%# Bind("TitleEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleFr" runat="server" Text='<%# Bind("TitleFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Fine print" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    <asp:TextBox ID="TextBoxSubjectDefault" runat="server" Text='<%# Bind("SubjectDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    <asp:TextBox ID="TextBoxSubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    <asp:TextBox ID="TextBoxSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    
                    <script language="javascript" type="text/javascript">
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxSubjectDefault").ClientID%>'),
                        {
                            contentsLangDirection: 'rtl',
                            height: '200px',
                            filebrowserBrowseUrl: '../ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl: '../ckfinder/ckfinder.html?Type=Images',
                            filebrowserFlashBrowseUrl: '../ckfinder/ckfinder.html?Type=Flash',
                            filebrowserUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
                            filebrowserImageUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',
                            filebrowserFlashUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
                        }
                        );
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxSubjectEn").ClientID%>'),
                        {
                            contentsLangDirection: 'ltr',
                            height: '200px',
                            filebrowserBrowseUrl: '../ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl: '../ckfinder/ckfinder.html?Type=Images',
                            filebrowserFlashBrowseUrl: '../ckfinder/ckfinder.html?Type=Flash',
                            filebrowserUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
                            filebrowserImageUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',
                            filebrowserFlashUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
                        }
                        );
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxSubjectFr").ClientID%>'),
                        {
                            contentsLangDirection: 'ltr',
                            height: '200px',
                            filebrowserBrowseUrl: '../ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl: '../ckfinder/ckfinder.html?Type=Images',
                            filebrowserFlashBrowseUrl: '../ckfinder/ckfinder.html?Type=Flash',
                            filebrowserUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
                            filebrowserImageUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',
                            filebrowserFlashUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
                        }
                        );
                    </script>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelSubject" runat="server" Text='<%# Bind("SubjectDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelSubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>'></asp:Label>
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
            <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName"  ControlStyle-Width="99%"/>
            <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link"  ControlStyle-Width="99%"/>
            <asp:BoundField DataField="Tags" HeaderText="Tags" SortExpression="Tags" ControlStyle-Width="99%"/>
            <asp:TemplateField HeaderText="Discount" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    <asp:TextBox ID="TextBoxDiscount" runat="server" Text='<%# Bind("DiscountDefault") %>'  Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    <asp:TextBox ID="TextBoxDiscountEn" runat="server" Text='<%# Bind("DiscountEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    <asp:TextBox ID="TextBoxDiscountFr" runat="server" Text='<%# Bind("DiscountFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("DiscountDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelDiscountEn" runat="server" Text='<%# Bind("DiscountEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelDiscountFr" runat="server" Text='<%# Bind("DiscountFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                <ItemTemplate>
                    <asp:Label ID="LabelEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEndDate" runat="server" Text='<%# Bind("EndDate", "{0:dd\/MM\/yyyy HH:mm}") %>' Width="100%"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender5" runat="server"
                        TargetControlID="TextBoxEndDate" Mask="99\/99\/9999 99:99" MessageValidatorTip="true" ClearMaskOnLostFocus="false"
                        OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" DisplayMoney="Left" AcceptNegative="Left" ErrorTooltipEnabled="True" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="InDate" HeaderText="InDate"  SortExpression="InDate" ReadOnly="true"  InsertVisible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="ID desc" TableName="Discounts" 
        onselecting="LinqDataSource2_Selecting">
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="ID desc" 
        TableName="Discounts" onselecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
</asp:Content>

