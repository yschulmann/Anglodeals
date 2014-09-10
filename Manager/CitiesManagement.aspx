<%@ Page Title="Cities Management" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="CitiesManagement.aspx.cs" Inherits="Manager_CitiesManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Cities Management</h1>
<asp:Label ID="Label1" runat="server"></asp:Label>
<br />
<div style="background-color: #C6C6C6;float: right;padding: 9px;width: 280px;" class="form">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" DefaultMode="Insert"
        AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="LinqDataSource1" CssClass="table"
            onitemdeleting="DetailsView1_ItemDeleting" 
            oniteminserting="DetailsView1_ItemInserting" 
            oniteminserted="DetailsView1_ItemInserted" 
            onitemupdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="מזהה" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="TitleDefault" HeaderText="Title He:" />
            <asp:BoundField DataField="TitleEn" HeaderText="Title En:" />
            <asp:BoundField DataField="TitleFr" HeaderText="Title Fr:" />
            <asp:TemplateField HeaderText="From City">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListFromCategory" runat="server" SelectedValue='<%# Bind("FromID") %>'
                        AppendDataBoundItems="True" DataSourceID="LinqDataSourceFromCategory" DataTextField="TitleDefault" DataValueField="ID">
                        <asp:ListItem Selected="True" Value="" Text="-Main City-"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSourceFromCategory" runat="server" ContextTypeName="DataClassesDataContext" 
                        OrderBy="TitleDefault" Select="new (ID, TitleDefault)" 
                        TableName="Cities">
                    </asp:LinqDataSource>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="FromCategoryLabel" runat="server" Text='<%# string.IsNullOrEmpty((string)Eval("City1.TitleDefault")) ? "Main City" : Eval("City1.TitleDefault") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ButtonType="Button" 
                ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True"  >
            <ItemStyle HorizontalAlign="right" />
            </asp:CommandField>
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="ID" 
        TableName="Cities" Where="ID == @ID">
        <WhereParameters>
            <asp:ControlParameter ControlID="TreeView1" DefaultValue="-1" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    </div>
    <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="0" onselectednodechanged="TreeView1_SelectedNodeChanged">
    <DataBindings>
        <asp:TreeNodeBinding TextField="TitleDefault" ValueField="ID" />
    </DataBindings>
</asp:TreeView>

</asp:Content>

