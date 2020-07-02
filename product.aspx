﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Belconfect.B2B.UI.product" %>
<%@ Register Src="~/controls/product.ascx" TagPrefix="uc" TagName="Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">

    var options, a;

    $(document).ready(function () {

        options = { serviceUrl: 'autocompletemodel.axd', onSelect: function (value, data) { window.location = '/product.aspx?l=' + languageId + '&p=' + data + '&ct=general'; }, autoSelectFirst: true };
        a = $('#productSearch').autocomplete(options);
    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:Product ID="Product" runat="server" />
</asp:Content>
