<%@ Page Title="Coupons Sites Management" ValidateRequest="false" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="SitesManager.aspx.cs" Inherits="Manager_SitesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Coupons Sites Management</h1>
<asp:Button ID="LinkButton1" runat="server" onclick="LinkButton1_Click" Text="Add Site" ></asp:Button> 
<asp:Label ID="Label1" runat="server"></asp:Label>
<br />
    <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table" PageSize="50"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" onselectedindexchanging="GridView1_SelectedIndexChanging" >
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:TemplateField HeaderText="logo" SortExpression="ImageName">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton21" runat="server" CommandName="Select">
                        <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%#"~/UploadImage/" + Eval("ImageName") %>' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="TitleDefault">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton20" runat="server" Text='<%# Eval("TitleEn") %>' CommandName="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LinkSite" SortExpression="LinkSite">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("LinkSite") %>' NavigateUrl='<%# Eval("LinkSite") %>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CssClass="table" 
        Visible="False" AutoGenerateRows="False" DataKeyNames="ID" 
        DataSourceID="LinqDataSource2"
        oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting"
        onitemupdated="DetailsView1_ItemUpdated" 
        onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" 
        onitemdeleting="DetailsView1_ItemDeleting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Title" HeaderStyle-Width="140px">
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
            <asp:TemplateField HeaderText="Guide" HeaderStyle-Width="140px">
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
   
            <asp:BoundField DataField="LinkSite" HeaderText="LinkSite" SortExpression="LinkSite" ItemStyle-Width="99%" />
            <asp:TemplateField HeaderText="Logo" SortExpression="ImageName">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#drvvv.Plugins.ReturnImgAddress((string)Eval("ImageName")) %>' style="max-width:200px;" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="50px" ImageAlign="Right" ImageUrl='<%#"~/UploadImage/" + Eval("ImageName") %>' />
                    <asp:FileUpload ID="FileUploadImageReplacement" runat="server" />
                    <asp:Button ID="ButtonImageReplacement" runat="server" Text="Picture update" CommandArgument='<%# Eval("ID") %>' onclick="ButtonImageReplacement_Click" />
                    <asp:Label ID="LabelUploadImageReplacement" runat="server"></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                <asp:FileUpload ID="FileUploadImage" runat="server" />
                    <asp:Label ID="LabelUploadImage" runat="server"></asp:Label>
                </InsertItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Nots" SortExpression="Nots">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Nots") %>' TextMode="MultiLine" Rows="6" Width="99%"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nots") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="CouponsSites" 
        Where="ID == @ID &#124;&#124; ID == @ID1">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="-1" Name="ID"  PropertyName="SelectedValue" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="-1" Name="ID1" QueryStringField="itemID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    
<%--<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" oniteminserting="ListView1_ItemInserting" onitemdeleting="ListView1_ItemDeleting" DataSourceID="LinqDataSource1" InsertItemPosition="LastItem">
    <ItemTemplate>
        <div style="">
        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/UploadImage/" + Eval("ImageName") %>' style="max-height:50px;margin-left:6px;" ImageAlign="Right" />
        <h3>
            <asp:Label ID="TitleDefaultLabel" runat="server" Text='<%# Eval("TitleDefault") %>' /> - 
            <asp:Label ID="TitleEnLabel" runat="server" Text='<%# Eval("TitleEn") %>' /> 
            (<asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>' />)
        </h3>
        <label>Guide: </label>
        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%# !string.IsNullOrEmpty((string) Eval("Nots")) %>' />
        <br />
        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"  Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"/>
        <br />
        </div>
    </ItemTemplate>
    <EmptyDataTemplate>
        <span>No data was returned.</span>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <div style="">
        <h3>Add a New Site</h3>
        Title He:<br />
        <asp:TextBox ID="TitleDefaultTextBox" runat="server" Text='<%# Bind("TitleDefault") %>' />
        <br />
        Title En:<br />
        <asp:TextBox ID="TitleEnTextBox" runat="server" Text='<%# Bind("TitleEn") %>' />
        <br />
        Subject He:<br />
        <asp:TextBox ID="SubjectDefaultTextBox" runat="server" Text='<%# Bind("SubjectDefault") %>' />
        <br />
        Subject En:<br />
        <asp:TextBox ID="SubjectEnTextBox" runat="server" Text='<%# Bind("SubjectEn") %>' />
        <br />
        <label>Upload Img</label>
        <asp:FileUpload ID="FileUploadImg" runat="server"/>
        <br />
        Link Site:<br />
        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LinkSite") %>' />
        <br />
        <label>Guide: </label>
         You may enter a Guide after saving
        <br />
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert"  Text="Insert" />
        </div>
    </InsertItemTemplate>
    <LayoutTemplate>
        <div ID="itemPlaceholderContainer" runat="server" style="">
            <span ID="itemPlaceholder" runat="server" />
        </div>
        <div style="">
        </div>
    </LayoutTemplate>
    <EditItemTemplate>
        <div style="">
        Title He:<br />
        <asp:TextBox ID="TitleDefaultTextBox" runat="server" Text='<%# Bind("TitleDefault") %>' />
        <br />
        Title En:<br />
        <asp:TextBox ID="TitleEnTextBox" runat="server" Text='<%# Bind("TitleEn") %>' />
        <br />
        Subject He:<br />
        <asp:TextBox ID="SubjectDefaultTextBox" runat="server" Text='<%# Bind("SubjectDefault") %>' />
        <br />
        Subject En:<br />
        <asp:TextBox ID="SubjectEnTextBox" runat="server" Text='<%# Bind("SubjectEn") %>' />
        <br />
        <label>&nbsp;</label>
        <asp:FileUpload ID="FileUploadImageReplacement" runat="server" />
        <asp:Button ID="ButtonImageReplacement" runat="server" Text="Image Replacement" CommandArgument='<%# Eval("ID") %>' onclick="ButtonImageReplacement_Click" />
        <br />
        Link Site:<br />
        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LinkSite") %>' />
        <br />
        <label>Guide: </label>
        <br />
        <asp:TextBox ID="TextBoxNotsEdit" runat="server" Text='<%# Bind("Nots") %>' TextMode="MultiLine" Rows="3"></asp:TextBox>
            <script language="javascript" type="text/javascript">
                CKEDITOR.replace(document.getElementById('<%= ListView1.EditItem.FindControl("TextBoxNotsEdit").ClientID%>'),
                {
                    height: '300px',
                    filebrowserBrowseUrl: '../ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '../ckfinder/ckfinder.html?Type=Images',
                    filebrowserFlashBrowseUrl: '../ckfinder/ckfinder.html?Type=Flash',
                    filebrowserUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
                    filebrowserImageUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',
                    filebrowserFlashUploadUrl: '../ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
                }
                );
            </script>
        <br />
        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
        </div>
    </EditItemTemplate>
</asp:ListView>--%>
<asp:LinqDataSource ID="LinqDataSource1" runat="server" 
    ContextTypeName="DataClassesDataContext" OrderBy="TitleDefault" 
        TableName="CouponsSites" 
        Select="new (ID, TitleDefault, TitleEn, TitleFr, LinkSite, ImageName)">
</asp:LinqDataSource>
</asp:Content>

