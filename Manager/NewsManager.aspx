<%@ Page Title="News Manager" Language="C#" ValidateRequest="false" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="NewsManager.aspx.cs" Inherits="Manager_NewsManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../ckeditor3/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>News Manager</h1>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" oniteminserting="ListView1_ItemInserting"
        DataSourceID="LinqDataSource1" InsertItemPosition="FirstItem">
        <ItemTemplate>
            <div style="margin:6px 0">
            <h4><asp:Label ID="IDLabel" runat="server" Text='<%# Eval("Title") %>' /></h4>
            <div>
                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
            </div>
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" /> | 
            <asp:Label ID="InDateLabel" runat="server" Text='<%# Eval("InDate") %>' /> | 
            <asp:Label ID="Label1" runat="server" Text='<%# (drvvv.Sites)((int)Eval("SiteID")) %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;"/>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div style="float:right; width:500px;">
            <h2 style="margin:0 0 6px;">New new</h2>
            Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            Site:
                <asp:DropDownList ID="DropDownListSitesInsert" runat="server" DataSource='<%# drvvv.SourceList.SitesList() %>' DataTextField="Key" DataValueField="Value">
                    <asp:ListItem Value="1" Text="Anglodeals" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Zebradeals"></asp:ListItem>
                    <asp:ListItem Value="3" Text="FrancoDeals"></asp:ListItem>
                </asp:DropDownList>
            <br />
            <asp:TextBox ID="TextBoxInformationDefault" runat="server" Text='<%# Bind("Subject") %>' TextMode="MultiLine" Rows="2"></asp:TextBox>
            <script language="javascript" type="text/javascript">
                CKEDITOR.replace(document.getElementById('<%= ListView1.InsertItem.FindControl("TextBoxInformationDefault").ClientID%>'),
                {
                    height: '100px',
                    width: '400px',
                    toolbar: 'Minimum'
                }
                );
            </script>
            <br />
             <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' Text="Active" />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <br />
            </div>
        </InsertItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <EditItemTemplate>
            <div style="">
            Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            Site:
                <asp:DropDownList ID="DropDownListSites" runat="server" SelectedValue='<%# Bind("SiteID") %>' DataSource='<%# drvvv.SourceList.SitesList() %>' DataTextField="Key" DataValueField="Value">
                    <asp:ListItem Value="1" Text="Anglodeals"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Zebradeals"></asp:ListItem>
                </asp:DropDownList>
            <br />
            <asp:TextBox ID="TextBoxInformationDefault" runat="server" Text='<%# Bind("Subject") %>' TextMode="MultiLine" Rows="2"></asp:TextBox>
           
            <script language="javascript" type="text/javascript">
                CKEDITOR.replace(document.getElementById('<%= ListView1.EditItem.FindControl("TextBoxInformationDefault").ClientID%>'),
	                {
	                    height: '100px',
	                    width: '400px',
	                    toolbar: 'Minimum'
	                }
                    );
                </script>
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' Text="Active" />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update"  Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            </div>
        </EditItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="ID desc" 
        TableName="News">
    </asp:LinqDataSource>
</asp:Content>


