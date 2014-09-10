<%@ Page Language="C#" AutoEventWireup="true" CodeFile="janglo.aspx.cs" Inherits="Frames_janglo" Theme="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Today's Recommended deal from Anglodeals</title>
    <style type="text/css">
    *{ margin:0; padding:0;}
    #main
    {
    	font-family: Arial;
        width: 552px;
    }
    h2{font-size:14px; color:#14549e;margin:0 0 6px;}
    p a{font-size:12px; color:Black; text-decoration:none;}
    .CouponImg img{ margin-right:6px; height:60px; border:1px solid black;float: left;}
    </style>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-21956328-2']);
    _gaq.push(['_trackPageview']);
    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>
</head>
<body>
    <form id="form1" runat="server" action="janglo.aspx" target="_blank">
    <div id="main">
        <div style="width:98px; float:right;">
            <a href="http://anglodeals.co.il" target="_blank"><img src="images/logo.png" alt="anglodeals" border="0" /></a>
            <asp:HyperLink ID="HyperLinkView" runat="server" Target="_blank" ImageUrl="~/Frames/images/view_deal.png"></asp:HyperLink>
            <%--<asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton2_Click" ImageUrl="" />--%>
        </div>
        <asp:HyperLink ID="HyperLinkImage" runat="server" CssClass="CouponImg" Target="_blank"></asp:HyperLink>
        
        <%--<asp:ImageButton ID="ImageButtonCoupon" runat="server" OnClick="ImageButton2_Click" Height="60px" CssClass="CouponImg" ImageAlign="Left" BorderWidth="1px"/>--%>
        <h2>Today's Recommended deal from <a href="http://anglodeals.co.il" target="_blank">Anglodeals.co.il</a></h2>
        <p>
        <asp:HyperLink ID="HyperLinkTitle" runat="server" Text='<%# Eval("TitleEn") %>' Target="_blank" ></asp:HyperLink>
        <%--<asp:LinkButton ID="LinkButtonTitle" runat="server" onClientClick="aspnetForm.target='_blank';" onclick="LinkButton1_Click"></asp:LinkButton>--%>
        </p>
    </div>
    </form>
</body>
</html>
