<%@ Page Title="Category Manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="CatgoryManager.aspx.cs" Inherits="Manager_CatgoryManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Category Manager</h1>
<asp:Label ID="Label1" runat="server"></asp:Label>
<br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" oniteminserting="ListView1_ItemInserting" onitemdeleting="ListView1_ItemDeleting"
        DataSourceID="LinqDataSource1" InsertItemPosition="LastItem">
        <ItemTemplate>
            <div style="">
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/UploadImage/" + Eval("Image") %>' style="max-height:50px;margin-left:6px;" ImageAlign="Right" />
            <h3>
                <asp:Label ID="TitleDefaultLabel" runat="server" Text='<%# Eval("TitleDefault") %>' /> - 
                <asp:Label ID="TitleEnLabel" runat="server" Text='<%# Eval("TitleEn") %>' /> - 
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TitleFr") %>' />
            </h3>
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"  Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"/>
            <br />
            <br />
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div style="">
            <h3>Add a new category</h3>
            Title He:<br />
            <asp:TextBox ID="TitleDefaultTextBox" runat="server" Text='<%# Bind("TitleDefault") %>' />
            <br />
            Title En:<br />
            <asp:TextBox ID="TitleEnTextBox" runat="server" Text='<%# Bind("TitleEn") %>' />
            <br />
            Title Fr:<br />
            <asp:TextBox ID="TextBoxTitleFr" runat="server" Text='<%# Bind("TitleFr") %>' />
            <br />
            Subject He:<br />
            <asp:TextBox ID="SubjectDefaultTextBox" runat="server" Text='<%# Bind("SubjectDefault") %>' />
            <br />
            Subject En:<br />
            <asp:TextBox ID="SubjectEnTextBox" runat="server" Text='<%# Bind("SubjectEn") %>' />
            <br />
            Subject Fr:<br />
            <asp:TextBox ID="TextBoxSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>' />
            <br />
            <label>העלאת תמונה</label>
            <asp:FileUpload ID="FileUploadImg" runat="server"/>
            <br />
            Priority:<br />
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Priority") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert"  Text="הוספה" />
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
            Title Fr:<br />
            <asp:TextBox ID="TextBoxTitleFr" runat="server" Text='<%# Bind("TitleFr") %>' />
            <br />
            Subject He:<br />
            <asp:TextBox ID="SubjectDefaultTextBox" runat="server" Text='<%# Bind("SubjectDefault") %>' />
            <br />
            Subject En:<br />
            <asp:TextBox ID="SubjectEnTextBox" runat="server" Text='<%# Bind("SubjectEn") %>' />
            <br />
            Subject Fr:<br />
            <asp:TextBox ID="TextBoxSubjectFr" runat="server" Text='<%# Bind("SubjectFr") %>' />
            <br />
            <label>&nbsp;</label>
            <asp:FileUpload ID="FileUploadImageReplacement" runat="server" />
                <asp:Button ID="ButtonImageReplacement" runat="server" Text="Image Replacement" CommandArgument='<%# Eval("ID") %>' onclick="ButtonImageReplacement_Click" />
            <br />
            Priority:<br />
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Priority") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            </div>
        </EditItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="TitleDefault" 
        TableName="Categories">
    </asp:LinqDataSource>

    <br />
    <h4>Coupons transfer between categories</h4>
    <asp:DropDownList ID="DropDownListOriginalCategory" runat="server" ValidationGroup="CouponsTransfer"
        AppendDataBoundItems="True" DataSourceID="LinqDataSource2" 
        DataTextField="TitleEn" DataValueField="ID" >
        <asp:ListItem Value="" Text="-Category transferable-"></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="DropDownListOriginalCategory" ValidationGroup="CouponsTransfer"></asp:RequiredFieldValidator>
    <span>to</span>
    <asp:DropDownList ID="DropDownListToCategory" runat="server" ValidationGroup="CouponsTransfer" AppendDataBoundItems="true"
        DataSourceID="LinqDataSource3" DataTextField="TitleEn" DataValueField="ID">
        <asp:ListItem Value="" Text="-Destination Categories-"></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="DropDownListToCategory" ValidationGroup="CouponsTransfer"></asp:RequiredFieldValidator>
    
    <asp:Button ID="Button1" runat="server" Text="Transference" ValidationGroup="CouponsTransfer"
        OnClientClick="if(!confirm('Transference? (Not refundable)')) return false;" 
        onclick="Button1_Click"/>
    
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DataClassesDataContext" OrderBy="TitleEn" 
        Select="new (ID, TitleEn)" TableName="Categories">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" 
        ContextTypeName="DataClassesDataContext" Select="new (ID, TitleEn)" 
        TableName="Categories">
        <WhereParameters>
            <asp:ControlParameter ControlID="DropDownListOriginalCategory" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>

