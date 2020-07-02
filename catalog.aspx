<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="catalog.aspx.cs" Inherits="Belconfect.B2B.UI.catalog" %>
<%@ Register Src="~/controls/catalog.ascx" TagPrefix="uc" TagName="Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">

    var productGroupId = <%=ProductGroupId %>;

    $(document).ready(function () {
        showProducts(productGroupId);
    });

    var options, a;

    $(document).ready(function () {

        options = { serviceUrl: 'autocompletemodel.axd', onSelect: function (value, data) { window.location = '/product.aspx?l=' + languageId + '&p=' + data + '&ct=general'; }, autoSelectFirst: true };
        a = $('#productSearch').autocomplete(options);
    });

</script>

<script id="articleListTemplate" type="text/x-jquery-tmpl">
<div class="article">
    <div class="category">${Brand}<br />${ArticleCode}<br />${SubTitle}</div>
    <div class="image" onclick="window.location='/product.aspx?l=${LanguageId}&p=${ArticleId}&ct=general'"><img src="${Image}" /></div>
</div>
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<uc:Catalog id="ArticleCatalog" runat="server"></uc:Catalog>
</asp:Content>
