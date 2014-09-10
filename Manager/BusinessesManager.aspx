<%@ Page Title="Businesses manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="BusinessesManager.aspx.cs" Inherits="Manager_BusinessesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Businesses manager</h2>
    <br />
    <asp:Button ID="LinkButton1" runat="server" onclick="LinkButton1_Click" Text="Add Business" ></asp:Button> 
     <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Manager/DiscountsManager.aspx">Discounts Manager</asp:HyperLink>
     <asp:HyperLink ID="HyperLinkAll" runat="server" NavigateUrl="~/Manager/BusinessesManager.aspx" Visible="false"> | Show All</asp:HyperLink>
     
    
<br />
<asp:Label ID="Label1" runat="server"></asp:Label>
<br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="LinqDataSource1" PageSize="50" onselectedindexchanging="GridView1_SelectedIndexChanging"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" Width="100%" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Title" SortExpression="TitleDefault">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Bind("TitleEn") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discounts" SortExpression="Discounts.Count">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Discounts.Count")%>' NavigateUrl='<%# "~/Manager/DiscountsManager.aspx?BusinessID=" + Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <ItemTemplate>
                    <asp:Label ID="LabelCategoryID" runat="server" Text='<%# Bind("Category.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="CityID">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("City.TitleEn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Priority" HeaderText="Priority" 
                SortExpression="Priority" />
            <asp:BoundField DataField="Visits" HeaderText="Visits" 
                SortExpression="Visits" />
            <asp:BoundField DataField="InDate" HeaderText="Date" 
                SortExpression="InDate" />
            <asp:CommandField ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    
    <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table" Width="100%"
        AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="LinqDataSource2"
        oniteminserting="DetailsView1_ItemInserting"
        onitemupdated="DetailsView1_ItemUpdated" onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" onitemdeleting="DetailsView1_ItemDeleting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Name" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    &nbsp;&nbsp;<asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("TitleDefault") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    &nbsp;&nbsp;<asp:TextBox ID="TextBoxTitleEn" runat="server" Text='<%# Bind("TitleEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    &nbsp;&nbsp;<asp:TextBox ID="TextBoxTitleFr" runat="server" Text='<%# Bind("TitleFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("TitleDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleEn" runat="server" Text='<%# Bind("TitleEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelTitleFr" runat="server" Text='<%# Bind("TitleFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    &nbsp;<asp:TextBox ID="TextBoxSubject" runat="server" Text='<%# Bind("SubjectDefault") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    &nbsp;<asp:TextBox ID="TextBoxSubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    &nbsp;<asp:TextBox ID="TextBoxSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelSubject" runat="server" Text='<%# Bind("SubjectDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelSubjectEn" runat="server" Text='<%# Bind("SubjectEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCategoryID" runat="server" DataSourceID="LinqDataSource3" DataTextField="TitleEn" DataValueField="ID"  AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("CategoryID") %>'>
                    <asp:ListItem Value="" Text="-Select Category-"></asp:ListItem>
                 </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" OrderBy="TitleEn"
                    ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
                    TableName="Categories">
                </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="CityID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCityID" runat="server" DataSourceID="LinqDataSource5" DataTextField="TitleEn" DataValueField="ID" AppendDataBoundItems="true"
                    SelectedValue='<%# Bind("CityID") %>'>
                    <asp:ListItem Value="" Text="-All Israel-"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource5" runat="server" OrderBy="TitleEn"
                        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
                        TableName="Cities">
                    </asp:LinqDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("CityID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    &nbsp;<asp:TextBox ID="TextBoxAddress" runat="server" Text='<%# Bind("AddressDefault") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    &nbsp;<asp:TextBox ID="TextBoxAddressEn" runat="server" Text='<%# Bind("AddressEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    &nbsp;<asp:TextBox ID="TextBoxAddressFr" runat="server" Text='<%# Bind("AddressFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelAddress" runat="server" Text='<%# Bind("AddressDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelAddressEn" runat="server" Text='<%# Bind("AddressEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelAddressFr" runat="server" Text='<%# Bind("AddressFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ControlStyle-Width="99%" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ControlStyle-Width="99%" />
            <asp:BoundField DataField="LinkSite" HeaderText="web site" SortExpression="LinkSite" ControlStyle-Width="99%" />
            <asp:TemplateField HeaderText="kosher">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    &nbsp;<asp:TextBox ID="TextBoxkosher" runat="server" Text='<%# Bind("kosherDefault") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    &nbsp;<asp:TextBox ID="TextBoxkosherEn" runat="server" Text='<%# Bind("kosherEn") %>' Width="95%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    &nbsp;<asp:TextBox ID="TextBoxkosherFr" runat="server" Text='<%# Bind("kosherFr") %>' Width="95%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Labelkosher" runat="server" Text='<%# Bind("kosherDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelkosherEn" runat="server" Text='<%# Bind("kosherEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelkosherFr" runat="server" Text='<%# Bind("kosherFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="information" HeaderStyle-Width="140px">
                <EditItemTemplate>
                    <label>Hebrew</label>
                    &nbsp;<asp:TextBox ID="TextBoxDescriptionDefault" runat="server" Text='<%# Bind("DescriptionDefault") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>English</label>
                    &nbsp;<asp:TextBox ID="TextBoxDescriptionEn" runat="server" Text='<%# Bind("DescriptionEn") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    <br />
                    <label>French</label>
                    &nbsp;<asp:TextBox ID="TextBoxDescriptionFr" runat="server" Text='<%# Bind("DescriptionFr") %>' TextMode="MultiLine" Rows="2" Width="99%"></asp:TextBox>
                    
                    <script language="javascript" type="text/javascript">
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxDescriptionDefault").ClientID%>'),
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
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxDescriptionEn").ClientID%>'),
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
                        CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("TextBoxDescriptionFr").ClientID%>'),
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
                    <asp:Label ID="LabelDescription" runat="server" Text='<%# Bind("DescriptionDefault") %>'></asp:Label><br />
                    <asp:Label ID="LabelDescriptionEn" runat="server" Text='<%# Bind("DescriptionEn") %>'></asp:Label><br />
                    <asp:Label ID="LabelDescriptionFr" runat="server" Text='<%# Bind("DescriptionFr") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Logo" SortExpression="ImgName">
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
            <asp:BoundField DataField="Priority" HeaderText="Priority"  SortExpression="Priority" />
            <asp:TemplateField HeaderText="Tags" SortExpression="Tags">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Tags") %>' Width="98%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Tags") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EmailManager" HeaderText="EmailManager" SortExpression="EmailManager" ControlStyle-Width="99%" />
            <asp:CheckBoxField DataField="ShowForm" HeaderText="ShowForm" SortExpression="ShowForm" />
            <asp:BoundField DataField="Visits" HeaderText="Visits" InsertVisible="False"   ReadOnly="True" SortExpression="Visits" />
            <asp:BoundField DataField="InDate" HeaderText="InDate" InsertVisible="False"  ReadOnly="True" SortExpression="InDate" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>

    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="Businesses" 
        Where="ID == @ID &#124;&#124; ID == @ID1">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="-1" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="-1" Name="ID1" 
                QueryStringField="itemID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="TitleEn" 
        TableName="Businesses" onselecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
</asp:Content>

