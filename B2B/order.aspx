<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Belconfect.B2B.UI.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:PlaceHolder ID="OrderPanel" runat="server">
<table id="cart-header">

    <tr>
        <td class="cart-header-left">
            <table>
                <tr>
                    <td><lang:ContentLiteral ID="cDeliveryAddressa" runat="server" Code="cart.deliveryaddress.title" Text="Levering (departement):"></lang:ContentLiteral></td>
                    <td><asp:DropDownList ID="DeliveryAddress" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="vertical-align: top;"><lang:ContentLiteral ID="cReference" runat="server" Code="cart.reference.title" Text="Referentie (max. 255 karakters):"></lang:ContentLiteral></td>
                    <td><asp:TextBox ID="Reference" runat="server" Width="250" cols="40" rows="3" TextMode="MultiLine" MaxLength="255"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><lang:ContentLiteral ID="cOrderFile" runat="server" Code="cart.fileupload.title" Text="Bestand opladen:"></lang:ContentLiteral></td>
                    <td><asp:FileUpload ID="OrderFile" runat="server" /></td>
                </tr>
            </table>
        </td>
        <td class="cart-header-right totalprice">
            <table style="width: 100%; text-align: right;">
                <tr>
                    <td></td>
                    <td><asp:Literal ID="TotalOrderPrice" runat="server"></asp:Literal></td>
                </tr>
                <asp:PlaceHolder ID="HasDiscount" runat="server">
                <tr>
                    <td><lang:ContentLiteral ID="ContentLiteral1" runat="server" Code="cart.dicountprice.title" Text="Handelskorting"></lang:ContentLiteral></td>
                    <td><span class="total-discount"><asp:Literal ID="CartDiscountPrice" runat="server"></asp:Literal></span></td>
                </tr>
                <tr>
                    <td><lang:ContentLiteral ID="ContentLiteral2" runat="server" Code="cart.totalprice.title" Text="Totaal"></lang:ContentLiteral></td>
                    <td><span class="total-price"><asp:Literal ID="CartTotalPrice" runat="server"></asp:Literal></span></td>
                </tr>
                </asp:PlaceHolder>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="cart-header-right"><lang:ContentButton ID="Order" runat="server" Code="cart.button.order" Text="Bestelling plaatsen" CssClass="submit" OnClick="Order_Click" /></td>
    </tr>

</table>
<table id="cart-result">
    <tr class="header">
        <th class="cart1-3"><lang:ContentLiteral ID="cImage" runat="server" Code="cart.list.image.title" Text="Afbeelding"></lang:ContentLiteral></th>
        <th class="cart2-3"><lang:ContentLiteral ID="cDescription" runat="server" Code="cart.list.desscription.title" Text="Omschrijving"></lang:ContentLiteral></th>
        <th class="cart3-3"><lang:ContentLiteral ID="cPrice" runat="server" Code="cart.list.price.title" Text="Prijs"></lang:ContentLiteral></th>
    </tr>

    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td><asp:Image ID="Img" runat="server" /></td>
                <td>
                    <span class="cart-description"><asp:Literal ID="Description" runat="server"></asp:Literal></span>
                    <span class="cart-size-list"><lang:ContentLiteral ID="cSizeList" runat="server" Code="cart.sizelist.title" Text="Maten:"></lang:ContentLiteral> <asp:Literal ID="SizeList" runat="server"></asp:Literal></span>
                    <span class="cart-logo"><asp:Literal ID="IncludeLogo" runat="server"></asp:Literal></span>
                </td>
                <td class="cartitem3-3"><asp:Literal ID="Price" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="3" class="delete-item"><lang:ContentHyperLink ID="Delete" runat="server" Code="cart.item.delete" Text="[ Verwijderen ]"></lang:ContentHyperLink></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="cart-alternate">
                <td><asp:Image ID="Img" runat="server" /></td>
                <td>
                    <span class="cart-description"><asp:Literal ID="Description" runat="server"></asp:Literal></span>
                    <span class="cart-size-list"><lang:ContentLiteral ID="cSizeList" runat="server" Code="cart.sizelist.title" Text="Maten:"></lang:ContentLiteral> <asp:Literal ID="SizeList" runat="server"></asp:Literal></span>
                    <span class="cart-logo"><asp:Literal ID="IncludeLogo" runat="server"></asp:Literal></span>
                </td>
                <td class="cartitem3-3"><asp:Literal ID="Price" runat="server"></asp:Literal></td>
            </tr>
            <tr class="cart-alternate">
                <td colspan="3" class="delete-item"><lang:ContentHyperLink ID="Delete" runat="server" Code="cart.item.delete" Text="[ Verwijderen ]"></lang:ContentHyperLink></td>
            </tr>
        </AlternatingItemTemplate>
    </asp:Repeater>

</table>
</asp:PlaceHolder>
<asp:PlaceHolder ID="EmptyOrderPanel" runat="server">
    <table id="order-empty">
        <tr><td><lang:ContentLiteral ID="cEmptyOrder" runat="server" Code="cart.empty.message" Text="Winkelmandje is leeg!"></lang:ContentLiteral></td></tr>
    </table>
</asp:PlaceHolder>

<asp:PlaceHolder ID="ConfirmPanel" runat="server">
    <table id="order-empty">
        <tr><td><asp:Literal ID="ConfirmationComment" runat="server"></asp:Literal></td></tr>
        <tr><td><asp:Literal ID="ConfirmationPrint" runat="server"></asp:Literal></td></tr>
    </table>
</asp:PlaceHolder>

</asp:Content>
