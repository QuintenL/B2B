<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Belconfect.B2B.UI.print.order" %>
<%@ Register Src="~/controls/orderdetail.ascx" TagPrefix="uc" TagName="OrderDetail" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>order detail</title>
    <link href="/Styles/Main.css?20130121" rel="stylesheet" id="MainCss" runat="server" />
    <style type="text/css">
        html, body { background-color: #fff; }
    </style>
    <!--[if IE 7]>
    <link href="/Styles/Main.ie7.css" rel="stylesheet" />
    <![endif]-->
    <asp:PlaceHolder ID="PrintPanel" runat="server">
    <script type="text/javascript">
        window.print();
    </script>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <uc:OrderDetail ID="OrderDetail" runat="server" />
     </form>
</body>
</html>
