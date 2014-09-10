<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForumMessage.aspx.cs" Inherits="ForumMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Content">
        <%--<a href="#AddComment" class="buttom">הוסף תגובה</a>--%>
 <h2><asp:HyperLink ID="HyperLinkH1" runat="server" style="text-decoration:none;" /></h2>
 <br />
 <div id="Comment">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" InsertItemPosition="LastItem"
        DataSourceID="LinqDataSource2" oniteminserting="ListView1_ItemInserting">
        <ItemTemplate>
            <div class="ForumMsg">
               <h3><asp:Literal ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></h3>
                <h5>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("FromName") %>'/> | 
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("InDate", "{0:D}") %>' />
                </h5>
                <p><asp:Label ID="SubjectLabel" runat="server" Text='<%# drvvv.CatSummary.ReplaceBr((string)Eval("Subject")) %>' /></p>
                <asp:Label ID="Literal2" runat="server" Text='<%# drvvv.CatSummary.ReplaceBr((string)Eval("ManagerReply")) %>' Visible='<%# Eval("ManagerReply") != null %>' style="color:Red; border-top:1px solid black; display:block; padding:6px 12px;" />
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span><asp:Localize ID="LocalizeNoData" runat="server"  Text="<%$ Resources:Resource, NoData %>" /></span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <br />
            <div id="AddComment" class="form">
                <h3><asp:Localize ID="LocalizeNoData" runat="server"  Text="<%$ Resources:Resource, AddComment %>" /></h3>
                <label><asp:Localize ID="Localize5" runat="server"  Text="<%$ Resources:Resource, Name %>" /></label> 
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FromName") %>' CssClass="textfield"/><br />
                <label><asp:Localize ID="Localize7" runat="server"  Text="<%$ Resources:Resource, Title %>" /></label> 
                <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("Title") %>' CssClass="textfield"/><br />
                <label><asp:Localize ID="Localize6" runat="server"  Text="<%$ Resources:Resource, Email %>" />:</label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textfield" Text='<%# Bind("Email") %>'></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, PublicNot %>"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="<%$ Resources:Resource, InvalidEmail %>" ControlToValidate="TextBoxEmail" Display="Dynamic" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                <br />
                <label><asp:Localize ID="Localize8" runat="server"  Text="<%$ Resources:Resource, Subject %>" />:</label>
                <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' TextMode="MultiLine" Rows="4"  ValidationGroup="AddComment" CssClass="textfield"/><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<%$ Resources:Resource, MessageEmpty %>" ControlToValidate="SubjectTextBox" Display="Dynamic" ValidationGroup="AddComment"></asp:RequiredFieldValidator>
                
                <%--<script language="javascript" type="text/javascript">
                    CKEDITOR.replace(document.getElementById('<%= ListView1.InsertItem.FindControl("SubjectTextBox").ClientID%>'),
	                {
	                    height: '200px',
	                    width: '475px',
	                    toolbar: 'Basic'
	                } 
                    );
                </script>--%>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:Resource, Send %>"  ValidationGroup="AddComment" style="margin:3px 140px" />
                <br />
            </div>
        </InsertItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
           <%-- <div style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="15">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </div>--%>
        </LayoutTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" EnableInsert="True" ContextTypeName="DataClassesDataContext"
         OrderBy="ID" TableName="Messages" onselecting="LinqDataSource2_Selecting">
    </asp:LinqDataSource>
    </div>

    </div>
</asp:Content>

