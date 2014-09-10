<%@ Page Title="Forum manager" Language="C#" MasterPageFile="~/Manager/MasterPage.master" AutoEventWireup="true" CodeFile="CommentManager.aspx.cs" Inherits="Manager_CommentManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Forum manager</h2>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="LinqDataSource1">
        <ItemTemplate>
            <tr style="">
                <td><asp:CheckBox ID="AectiveCheckBox" runat="server" Checked='<%# Eval("Active") %>' 
                oncheckedchanged="AectiveCheckBox_CheckedChanged" AutoPostBack="true" ValidationGroup='<%# Eval("ID") %>' /></td>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FromName") %>' ToolTip='<%# Eval("FromIp") %>' />
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("Email") %>' NavigateUrl='<%#"mailto:" +  Eval("Email") %>' Target="_blank"></asp:HyperLink>
                </td>
                <td><asp:Label ID="InDateLabel" runat="server" Text='<%# Eval("InDate", "{0:d}") %>' ToolTip='<%# Eval("InDate") %>' />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# drvvv.Forum.GetUrlMsg((Message)Container.DataItem) %>' Text='<%# (drvvv.Sites) Eval("SiteID") %>'></asp:HyperLink>
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" 
                style="">
                <tr>
                    <td>
                        no date.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server" class="Comment" width="100%">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" width="100%" style="">
                            <tr id="Tr2" runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th id="Th1" runat="server"></th>
                                <th id="Th2" runat="server">Title</th>
                                <th id="Th3" runat="server">From</th>
                                <th id="Th4" runat="server">Date</th>
                                <th id="Th5" runat="server">Site</th>
                                <th id="Th6" runat="server"></th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" 
                        style="text-align: center;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="30">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="false" ShowPreviousPageButton="true" 
                                    />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="true" ShowPreviousPageButton="false"
                                      />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color:#CCCCCC;color: #FFFFFF;" class="Edit">
                 <td>
                    <asp:CheckBox ID="AectiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Rows="4" TextMode="MultiLine" Width="100%" />
                </td>
                <td colspan="3">
                    <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' Rows="3" TextMode="MultiLine" Width="100%" />
                    <asp:TextBox ID="TextBoxManagerReply" runat="server" Text='<%# Bind("ManagerReply") %>' Rows="2" TextMode="MultiLine" Width="100%" />
                </td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableUpdate="True" OrderBy="ID desc" TableName="Messages" 
        onselecting="LinqDataSource1_Selecting" >
    </asp:LinqDataSource>
</asp:Content>

