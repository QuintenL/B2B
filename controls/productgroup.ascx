<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="productgroup.ascx.cs" Inherits="Belconfect.B2B.UI.controls.productgroup" %>
<div id="sidebar-left">
    <input type="text" id="productSearch" placeholder="PRODUCT CODE" /><br /><br />

    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
        <HeaderTemplate>
        <ul id="leftmenu">
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Literal ID="lit" runat="server"></asp:Literal>
        </ItemTemplate>
        <FooterTemplate>
        </ul>
        </FooterTemplate>
    </asp:Repeater>

    <asp:Repeater ID="rpt2" runat="server" OnItemDataBound="rpt_ItemDataBound">
        <HeaderTemplate>
        <ul id="leftmenu2">
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Literal ID="lit" runat="server"></asp:Literal>
        </ItemTemplate>
        <FooterTemplate>
        </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>