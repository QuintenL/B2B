<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="orderdetail.ascx.cs" Inherits="Belconfect.B2B.UI.controls.orderdetail" %>
<asp:PlaceHolder ID="Header" runat="server" Visible="false">
<table id="print-order-header">
    <tr>
        <td id="order-header-logo"><img src="/images/logo.jpg" id="HeaderLogo" runat="server" /></td>
        <td id="order-header-id"><lang:ContentLiteral ID="cHeaderOrderId" runat="server" Code="order.header.id" Text="Bestellingsnr."></lang:ContentLiteral> <asp:Literal ID="HeaderOrderId" runat="server"></asp:Literal></td>
    </tr>
</table>
</asp:PlaceHolder>

<table id="order-header">
    <tr>
        <td class="order-header-left"><lang:ContentLiteral ID="cDeliveryAddress" runat="server" Code="order.deliveryaddress.title" Text="Levering (departement):"></lang:ContentLiteral> <asp:Literal ID="DeliveryAddress" runat="server"></asp:Literal></td>
        <td class="order-header-right totalprice"><asp:Literal ID="TotalOrderPrice" runat="server"></asp:Literal></td>
    </tr>
<asp:PlaceHolder ID="DiscountPanel" runat="server">
    <tr>
        <td class="order-header-left"><lang:ContentLiteral ID="ContentLiteral1" runat="server" Code="cart.dicountprice.title" Text="Handelskorting"></lang:ContentLiteral> <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
        <td class="order-header-right totalprice"><span class="total-discount"><asp:Literal ID="DiscountPrice" runat="server"></asp:Literal></span></td>
    </tr>
    <tr>
        <td class="order-header-left"><lang:ContentLiteral ID="ContentLiteral2" runat="server" Code="cart.totalprice.title" Text="Totaal"></lang:ContentLiteral> <asp:Literal ID="Literal3" runat="server"></asp:Literal></td>
        <td class="order-header-right totalprice"><span class="total-price"><asp:Literal ID="TotalPrice" runat="server"></asp:Literal></span></td>
    </tr>
</asp:PlaceHolder>
    <tr>
        <td colspan="2"><pre><asp:Literal ID="litReference" runat="server"></asp:Literal></pre></td>
    </tr>
    <tr>
        <td colspan="2"><lang:ContentLiteral ID="info" runat="server" Code="cart.info.message" Text="prijzen exclusief btw"></lang:ContentLiteral></td>
    </tr>
</table>
<table id="order-result">
    <tr class="header">
        <th class="order1-3"><lang:ContentLiteral ID="cImage" runat="server" Code="order.list.image.title" Text="Afbeelding"></lang:ContentLiteral></th>
        <th class="order2-3"><lang:ContentLiteral ID="cDescription" runat="server" Code="order.list.desscription.title" Text="Omschrijving"></lang:ContentLiteral></th>
        <th class="order3-3"><lang:ContentLiteral ID="cPrice" runat="server" Code="order.list.price.title" Text="Prijs"></lang:ContentLiteral></th>
    </tr>

    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td><asp:Image ID="Img" runat="server" /></td>
                <td>
                    <span class="order-description"><asp:Literal ID="Description" runat="server"></asp:Literal></span>
                    <span class="order-size-list"><lang:ContentLiteral ID="cSizeList" runat="server" Code="order.sizelist.title" Text="Maten:"></lang:ContentLiteral> <asp:Literal ID="SizeList" runat="server"></asp:Literal></span>
                    <span class="cart-logo"><asp:Literal ID="IncludeLogo" runat="server"></asp:Literal></span>
                </td>
                <td class="orderitem3-3"><asp:Literal ID="Price" runat="server"></asp:Literal></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="order-alternate">
                <td><asp:Image ID="Img" runat="server" /></td>
                <td>
                    <span class="order-description"><asp:Literal ID="Description" runat="server"></asp:Literal></span>
                    <span class="order-size-list"><lang:ContentLiteral ID="cSizeList" runat="server" Code="order.sizelist.title" Text="Maten:"></lang:ContentLiteral> <asp:Literal ID="SizeList" runat="server"></asp:Literal></span>
                    <span class="cart-logo"><asp:Literal ID="IncludeLogo" runat="server"></asp:Literal></span>
                </td>
                <td class="orderitem3-3"><asp:Literal ID="Price" runat="server"></asp:Literal></td>
            </tr>
        </AlternatingItemTemplate>
    </asp:Repeater>

</table>