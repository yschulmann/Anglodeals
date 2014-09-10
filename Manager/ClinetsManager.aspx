<%@ Page Title="Users Management" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="ClinetsManager.aspx.cs" Inherits="Manager_ClinetsManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Users Management</h1>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" InsertItemPosition="LastItem" oniteminserting="ListView1_ItemInserting" 
        onitemupdating="ListView1_ItemUpdating" onitemdeleting="ListView1_ItemDeleting">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>                
                <td colspan="2">
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                </td>
                <td>
                    <asp:Label ID="LastDateLabel" runat="server" Text='<%# Eval("LastDate", "{0:d}") %>' ToolTip='<%# Eval("LastDate") %>' />
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Deletion? (Not refundable)')) return false;" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>No details on the system.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>               
                <td>
                    <asp:TextBox ID="NickTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                </td>

                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server" width="100%">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="width:100%;">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th4" runat="server"> Email</th>
                                <th id="Th2" runat="server"> Password</th>
                                 <th id="Th1" runat="server"> Name</th>
                                <th id="Th5" runat="server">
                                    Last login</th>
                                <th id="Th7" runat="server">
                                    </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" />
                    <br />
                    <label style="font-size:10px;">Satisfy only for setting a new password</label>
                </td>
                <td>
                    <asp:TextBox ID="NickTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                </td>
                
                <td>
                    <asp:Label ID="LastDateLabel" runat="server" Text='<%# Eval("LastDate", "{0:d}") %>' ToolTip='<%# Eval("LastDate") %>' />
                </td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" OrderBy="ID desc" TableName="Clients">
    </asp:LinqDataSource>
</asp:Content>