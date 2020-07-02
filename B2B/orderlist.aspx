<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="orderlist.aspx.cs" Inherits="Belconfect.B2B.UI.orderlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table id="orderlist">
    <tr class="header">
        <th class="orderheader-col1"><lang:ContentLiteral ID="cOrderCode" runat="server" Code="orderlist.header.ordercode" Text="Order-nr"></lang:ContentLiteral></th>
        <th class="orderheader-col2"><lang:ContentLiteral ID="cDate" runat="server" Code="orderlist.header.date" Text="Datum"></lang:ContentLiteral></th>
        <th class="orderheader-col3"><lang:ContentLiteral ID="cDeliveryAddress" runat="server" Code="orderlist.header.deliveryaddress" Text="Aflever adres"></lang:ContentLiteral></th>
        <th class="orderheader-col4"><lang:ContentLiteral ID="cTotal" runat="server" Code="orderlist.header.total" Text="Totaal"></lang:ContentLiteral></th>
        <th class="orderheader-col5">&nbsp;</th>
    </tr>
    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
        <ItemTemplate>
        <tr class="orderline">
            <td id="LineCellA" runat="server" class="orderlist-col1"><asp:Literal ID="OrderCode" runat="server"></asp:Literal></td>
            <td id="LineCellB" runat="server" class="orderlist-col1"><asp:Literal ID="OrderDate" runat="server"></asp:Literal></td>
            <td id="LineCellC" runat="server" class="orderlist-col1"><asp:Literal ID="DeliveryAddress" runat="server"></asp:Literal></td>
            <td id="LineCellD" runat="server" class="orderlist-col1"><asp:Literal ID="Total" runat="server"></asp:Literal></td>
            <td class="orderlist-col1"><asp:Literal ID="Actions" runat="server"></asp:Literal></td>
        </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <tr class="orderline order-alternate">
            <td id="LineCellA" runat="server" class="orderlist-col1"><asp:Literal ID="OrderCode" runat="server"></asp:Literal></td>
            <td id="LineCellB" runat="server" class="orderlist-col1"><asp:Literal ID="OrderDate" runat="server"></asp:Literal></td>
            <td id="LineCellC" runat="server" class="orderlist-col1"><asp:Literal ID="DeliveryAddress" runat="server"></asp:Literal></td>
            <td id="LineCellD" runat="server" class="orderlist-col1"><asp:Literal ID="Total" runat="server"></asp:Literal></td>
            <td class="orderlist-col1"><asp:Literal ID="Actions" runat="server"></asp:Literal></td>
        </tr>
        </AlternatingItemTemplate>
    </asp:Repeater>
</table>
</asp:Content>
