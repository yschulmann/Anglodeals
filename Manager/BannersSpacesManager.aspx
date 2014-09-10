<%@ Page Title="Banners Spaces Manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master"  AutoEventWireup="true" CodeFile="BannersSpacesManager.aspx.cs" Inherits="Manager_BannersSpacesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Banners Spaces Manager</h2>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Manager/BannersManager.aspx">Back to Banner</asp:HyperLink>
    <br /><br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
        DataSourceID="LinqDataSource1" InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("ID")+ ": " + Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                </td>
                <td>
                    <asp:Label ID="HeightLabel" runat="server" Text='<%# Eval("Height") %>' />
                </td>
                 <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="if(!confirm('Really want to delete? (Not refundable)')) return false;"/>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>Not defined as areas.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Title" ControlToValidate="TitleTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                 <td>
                    <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>' ValidationGroup="Edit"/>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Only number" Type="Double" MinimumValue="0" MaximumValue="9999999" ValidationGroup="Insert" ControlToValidate="WidthTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' ValidationGroup="Edit"/>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Only number" Type="Double" MinimumValue="0" MaximumValue="9999999" ValidationGroup="Insert" ControlToValidate="HeightTextBox"></asp:RangeValidator>
                    
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"/>
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                
                                <th id="Th1" runat="server">Area name</th>
                                <th id="Th2" runat="server">Width (px)</th>
                                <th id="Th3" runat="server">Height (px)</th>
                                <th id="Th4" runat="server"></th>
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
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' ValidationGroup="Edit"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Title" ControlToValidate="TitleTextBox" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    
                </td>
                <td>
                    <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>' ValidationGroup="Edit"/>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Only number" Type="Double" MinimumValue="0" MaximumValue="9999999" ValidationGroup="Edit" ControlToValidate="WidthTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' ValidationGroup="Edit"/>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Only number" Type="Double" MinimumValue="0" MaximumValue="9999999" ValidationGroup="Edit" ControlToValidate="HeightTextBox"></asp:RangeValidator>
                    
                </td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"  Text="Cancel"/>
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>   
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" OrderBy="Title" 
        TableName="BannersSpaces">
    </asp:LinqDataSource>
</asp:Content>

