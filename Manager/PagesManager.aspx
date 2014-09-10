<%@ Page Title="Pages Manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="PagesManager.aspx.cs" Inherits="Manager_PagesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Pages Manager</h1>
<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">New Page</asp:LinkButton> 
<br />
    <asp:Label ID="Label4" runat="server"></asp:Label>
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="50" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" CssClass="table" Width="100%" 
        onselectedindexchanging="GridView1_SelectedIndexChanging" 
        onrowdeleting="GridView1_RowDeleting" >
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="false" ReadOnly="true"/>
            <asp:TemplateField HeaderText="Title" SortExpression="TitlePage">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("TitlePage") %>' CommandName="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Site" SortExpression="SiteID">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# (drvvv.Sites)((int)Eval("SiteID")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"/>
            <asp:CheckBoxField DataField="ActiveMenu" HeaderText="Menu" SortExpression="ActiveMenu"/>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" OrderBy="ID desc" 
        TableName="Pages" EnableDelete="True">
    </asp:LinqDataSource>
    
    <asp:DetailsView ID="DetailsView1" runat="server" 
        oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting" Width="100%" CssClass="table"
        onitemupdated="DetailsView1_ItemUpdated" 
        onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" 
        AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="LinqDataSource2" 
        onitemdeleting="DetailsView1_ItemDeleting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="false" ReadOnly="true"/>
            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxActive" runat="server" Checked='<%# Bind("Active") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TitlePage" HeaderText="Title" SortExpression="TitlePage"  ControlStyle-Width="99%">
            <ControlStyle Width="99%"></ControlStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Site" SortExpression="SiteID">
                <ItemTemplate>
                    <asp:Label ID="LabelCat" runat="server" Text='<%# (drvvv.Sites)((int)Eval("SiteID")) %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListSiteID" runat="server" DataSource='<%# drvvv.SourceList.SitesList() %>' DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("SiteID") %>' AppendDataBoundItems="true">
                        <%--<asp:ListItem Value="0" Text="AngloDeals"></asp:ListItem>
                        <asp:ListItem Value="1" Text="ZebraDeals"></asp:ListItem>
                        <asp:ListItem Value="2" Text="FrancoDeals"></asp:ListItem>--%>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Rows="6" Width="99%"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Content" SortExpression="ContentPage">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ContentPage") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="editor1" runat="server" Text='<%# Bind("ContentPage") %>' TextMode="MultiLine" Rows="6"></asp:TextBox>
                    <script language="javascript" type="text/javascript">
                    CKEDITOR.replace(document.getElementById('<%= DetailsView1.FindControl("editor1").ClientID%>'),
	                    {
	                        height: '400px',
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
            </asp:TemplateField>
            <asp:CheckBoxField DataField="ActiveMenu" HeaderText="Menu" SortExpression="ActiveMenu"/>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" oninserted="LinqDataSource2_Inserted"
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="Pages" Where="ID == @ID">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="-1" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

</asp:Content>

