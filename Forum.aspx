<%@ Page Title="Forum | Anglodeals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Content">
        <h2><asp:Localize ID="Localize2" runat="server"  Text="<%$ Resources:Resource, ForumH1 %>" /></h2>

        <asp:LinkButton ID="ButtonAddComment" runat="server" Text="<%$ Resources:Resource, ForumNew %>" CssClass="buttomNew" onclick="ButtonAddComment_Click"></asp:LinkButton>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="LinqDataSource1">
        <ItemTemplate>
            <tr class="ForumMsg">
                <td class="Title">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# string.Format("~/ForumMessage.aspx?Discussion={0}",  Eval("ID")) %>'></asp:HyperLink>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FromName") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# GetNumComment((int)Eval("ID")) %>'></asp:Label>
                </td>
                <td> 
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Visits") %>'></asp:Label>
                </td>  
                <td> 
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("InDate", "{0:D}") %>'></asp:Label>
                </td>              
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td><asp:Localize ID="LocalizeNoData" runat="server"  Text="<%$ Resources:Resource, NoData %>" /></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server" style="width:100%;margin-top:12px;">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="width:100%;" cellspacing="0">
                            <tr id="Tr2" runat="server" class="ForumMsgTitle" >
                                <th id="Th1" runat="server"><asp:Localize ID="Localize2" runat="server"  Text="<%$ Resources:Resource, ForumTopics  %>" /></th>
                                <th id="Th2" runat="server"><asp:Localize ID="Localize1" runat="server"  Text="<%$ Resources:Resource, ForumReplies %>" /></th>
                                <th id="Th3" runat="server"><asp:Localize ID="Localize3" runat="server"  Text="<%$ Resources:Resource, ForumViews %>" /></th>
                                <th id="Th4" runat="server"><asp:Localize ID="Localize4" runat="server"  Text="<%$ Resources:Resource, ForumDate %>" /></th>
                            </tr>
                            <tr><td style="height:10px;"> </td></tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" OrderBy="ID desc" TableName="Messages" 
        onselecting="LinqDataSource1_Selecting" 
            Select="new (ID, FromName, Title, Active, InDate, FromMessagesID, Visits, Before)">
    </asp:LinqDataSource>
    
    <asp:Panel ID="PanelAddComment" runat="server" Visible="false">
    <div id="Comment">
        <div id="AddComment" class="form">
            <h3><asp:Localize ID="LocalizeNoData" runat="server"  Text="<%$ Resources:Resource, ForumNew %>" /></h3>
            <label><asp:Localize ID="Localize5" runat="server"  Text="<%$ Resources:Resource, Name %>" /></label> 
        <asp:TextBox ID="TextBoxName" runat="server" CssClass="textfield"/> <br />
            <label><asp:Localize ID="Localize6" runat="server"  Text="<%$ Resources:Resource, Email %>" />:</label>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textfield"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, PublicNot %>"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="<%$ Resources:Resource, InvalidEmail %>" ControlToValidate="TextBoxEmail" Display="Dynamic" SetFocusOnError="True"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
            <br />
            <label><asp:Localize ID="Localize7" runat="server"  Text="<%$ Resources:Resource, Title %>" /></label> 
            <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="textfield"/><br />
            <label><asp:Localize ID="Localize8" runat="server"  Text="<%$ Resources:Resource, Subject %>" /></label>
            <asp:TextBox ID="SubjectTextBox" runat="server" TextMode="MultiLine" Rows="4"  ValidationGroup="AddComment" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<%$ Resources:Resource, MessageEmpty %>" ControlToValidate="SubjectTextBox" Display="Dynamic" ValidationGroup="AddComment"></asp:RequiredFieldValidator>
            
          <%--  <script language="javascript" type="text/javascript">
                CKEDITOR.replace(document.getElementById('<%= SubjectTextBox.ClientID%>'),
                {
                    height: '200px',
                    width: '475px',
                    toolbar: 'Basic'
                } 
                );
            </script>--%>
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:Resource, Send %>" ValidationGroup="AddComment" onclick="InsertButton_Click" style="margin:3px 140px" />
            <br />
        </div>
    </div>
    </asp:Panel>
    </div>
    <%--<asp:Localize ID="Localize1" runat="server"  Text="<%$ Resources:Resource, Forum %>" />--%>

</asp:Content>

