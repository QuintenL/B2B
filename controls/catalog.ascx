<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="catalog.ascx.cs" Inherits="Belconfect.B2B.UI.controls.catalog" %>
<%@ Register Src="~/controls/productgroup.ascx" TagPrefix="uc" TagName="ProductGroup" %>
<uc:ProductGroup ID="ProductGroupList" runat="server" />
<div id="articlecontent">
    <h1 id="ArticleGroup"></h1>
    <div id="article-result"></div>
    <div id="emptylist" style="display: none;"><img src="/images/ajax-loader.gif" /></div>
    <div style="clear: left">&nbsp;</div>
</div>
<div id="right-col">
    <asp:Repeater ID="rptProject" runat="server" OnItemDataBound="rptProject_ItemDataBound" ClientIDMode="Static">
        <HeaderTemplate>
            <div class="filters">
            <h2><lang:ContentLiteral ID="Project" runat="server" Code="catalog.filter.project" Text="Project"></lang:ContentLiteral></h2>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:RadioButton ID="chk" runat="server" GroupName="projectfilter" CssClass="project-filter" /></td>
                <td><asp:Literal ID="lit" runat="server"></asp:Literal></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <div class="filters">
        <h2><lang:ContentLiteral ID="Brand" runat="server" Code="catalog.filter.brand" Text="Merk"></lang:ContentLiteral></h2>
        <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
            <HeaderTemplate><table></HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:CheckBox ID="chk" runat="server" CssClass="brand-filter" /></td>
                    <td><asp:Literal ID="lit" runat="server"></asp:Literal></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>
        </asp:Repeater>
    </div>
    <div class="filters">
        <asp:Repeater ID="rpt2" runat="server" OnItemDataBound="rpt_ItemDataBound">
            <HeaderTemplate><table></HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:CheckBox ID="chk" runat="server" CssClass="brand-filter" /></td>
                    <td><asp:Literal ID="lit" runat="server"></asp:Literal></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>
        </asp:Repeater>
    </div>
</div>
