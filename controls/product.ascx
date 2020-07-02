<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product.ascx.cs" Inherits="Belconfect.B2B.UI.controls.product" %>
<%@ Register Src="~/controls/productgroup.ascx" TagPrefix="uc" TagName="ProductGroup" %>
<uc:ProductGroup ID="ProductGroupList" runat="server" IsProductPage="true" />
<div id="articlecontent-detail">
    <h1 id="article-title"><asp:Literal ID="ProductTitle" runat="server"></asp:Literal></h1>
    <div id="article-detail">
        <div id="article-image">
            <a class="fancybox" id="img" runat="server"><asp:Image ID="ArticleImage" runat="server" /></a>
            <br /><lang:ContentHyperLink ID="cGoBack" runat="server" NavigateUrl="javascript:history.go(-1)" CssClass="goback" Code="article.detail.backtolist" Text="Terug naar overzicht"></lang:ContentHyperLink>
        </div>
        <div id="article-description">
            <p><span class="title"><lang:ContentLiteral ID="cDescription" runat="server" Code="article.detail.description.title" Text="Omschrijving"></lang:ContentLiteral></span></p>
            <p><asp:Literal ID="Description" runat="server"></asp:Literal></p>
            <asp:PlaceHolder ID="MeasurementsPanel" runat="server">
            <p><span class="title"><lang:ContentLiteral ID="cMeasurements" runat="server" Code="article.detail.measurements.title" Text="Maat:"></lang:ContentLiteral></span> <asp:Literal ID="Measurements" runat="server"></asp:Literal></p>
            </asp:PlaceHolder>
            <p><span class="title"><lang:ContentLiteral ID="cComposition" runat="server" Code="article.detail.composition.title" Text="Samenstelling:"></lang:ContentLiteral></span> <asp:Literal ID="Composition" runat="server"></asp:Literal></p>
            <p><span class="title"><lang:ContentLiteral ID="cCode" runat="server" Code="article.detail.code.title" Text="Artikel"></lang:ContentLiteral></span> <asp:Literal ID="ArticleCode" runat="server"></asp:Literal></p>
            <asp:PlaceHolder ID="TechnicalDocumentPanel" runat="server" Visible="false">
            <p><span class="title"><lang:ContentLiteral ID="cPdf" runat="server" Code="article.detail.pdf.title" Text="Technische fiche"></lang:ContentLiteral> <asp:Literal ID="TechnicalDocument" runat="server"></asp:Literal></span></p>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="DeclarationOfConformityPanel" runat="server" Visible="false">
            <p><span class="title"><lang:ContentLiteral ID="cPdf2" runat="server" Code="article.detail.pdfConform.title" Text="Conform fiche"></lang:ContentLiteral> <asp:Literal ID="DeclarationOfConformityDocument" runat="server"></asp:Literal></span></p>
            </asp:PlaceHolder>

            <asp:Repeater ID="NormList" runat="server" OnItemDataBound="NormList_ItemDataBound">
                <HeaderTemplate>
                    <p><span class="title"><lang:ContentLiteral ID="cNorms" runat="server" Code="artilce.detail.norm.title" Text="Norm"></lang:ContentLiteral></span></p>
                    <p class="details">
                </HeaderTemplate>
                <ItemTemplate><asp:Literal ID="lit" runat="server"></asp:Literal><br /></ItemTemplate>
                <FooterTemplate>
                    </p>
                </FooterTemplate>
            </asp:Repeater>
            
            <asp:Repeater ID="ScopeList" runat="server" OnItemDataBound="ScopeList_ItemDataBound">
                <HeaderTemplate>
                    <p><span class="title"><lang:ContentLiteral ID="cScope" runat="server" Code="article.detail.scope.title" Text="Toepassingsgebied"></lang:ContentLiteral></span></p>
                    <p class="details">
                </HeaderTemplate>
                <ItemTemplate><asp:Literal ID="lit" runat="server"></asp:Literal><br /></ItemTemplate>
                <FooterTemplate>
                    </p>
                </FooterTemplate>
            </asp:Repeater>

            <asp:PlaceHolder ID="ProjectPanel" runat="server" Visible="false">
                <p>
                    <span class="title"><lang:ContentLiteral ID="ContentLiteral1" runat="server" Code="article.detail.project.title" Text="Project"></lang:ContentLiteral></span>
                    <asp:Literal ID="Project" runat="server"></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="ProjectInfo" runat="server"></asp:Literal>
                </p>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="InfoPanel" runat="server" Visible="false">
                <p>
                    <asp:Literal ID="Info" runat="server"></asp:Literal>
                </p>
            </asp:PlaceHolder>

        </div>
        <div style="clear: both">&nbsp;</div>
        <asp:PlaceHolder ID="OrderPanel" runat="server">
        <div id="article-order">

            <asp:Repeater ID="SizePrices" runat="server" OnItemDataBound="SizePrices_ItemDataBound">
                <HeaderTemplate>
                <table>
                </HeaderTemplate>
                <ItemTemplate>
                <tr>
                    <td class="size-price border-top"><asp:Literal ID="lit" runat="server"></asp:Literal></td>

                    <asp:Repeater ID="Sizes" runat="server" OnItemDataBound="Sizes_ItemDataBound">
                        <HeaderTemplate><td class="border-top"></HeaderTemplate>
                        <ItemTemplate>
                            <div class="order-item"><div class="size-title"><asp:Literal ID="lit" runat="server"></asp:Literal></div><div id="stock" runat="server"></div><input id="img" runat="server" type="text" class="numeric order-qty" /></div>
                        </ItemTemplate>
                        <FooterTemplate></td></FooterTemplate>
                    </asp:Repeater>

                </tr>
                </ItemTemplate>
                <FooterTemplate>
                </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
        <div id="article-order-btn">
            <lang:ContentButton ID="Order" runat="server" ClientIDMode="Static" Code="article.detail.button.order" Text="Toevoegen aan winkelmandje" CssClass="submit" /><br /><br />
            <lang:ContentCheckBox ID="IncludeLogo" runat="server" ClientIDMode="Static" CssClass="check-label" Code="article.detail.includelogo" Text="Logo toevoegen aan het bestelde artikel" />
            <br />
            <table id="legend">
                <tr><td><div class="inventory full-stock"></div></td><td><lang:ContentLiteral ID="cLegendFullStock" runat="server" Code="article.detail.legend.fullstock" Text="Voldoende voorraad, levertermijn 2 dagen"></lang:ContentLiteral></td></tr>
                <tr><td><div class="inventory limited-stock"></div></td><td><lang:ContentLiteral ID="cLegendLimitedStock" runat="server" Code="article.detail.legend.limitedstock" Text="Beperkte voorraad, levertermijn 2 weken"></lang:ContentLiteral></td></tr>
                <tr><td><div class="inventory out-of-stock"></div></td><td><lang:ContentLiteral ID="cLegendOutOfStock" runat="server" Code="article.detail.legend.outofstock" Text="Enkel op aanvraag"></lang:ContentLiteral></td></tr>
            </table>

        </div>
        </asp:PlaceHolder>
    </div>
</div>
<asp:HiddenField ID="ProjectIdValue" runat="server" ClientIDMode="Static" Value="0" />
<script type="text/javascript">var articleId = <%=this.CurrentArticle.ArticleId %>;</script>