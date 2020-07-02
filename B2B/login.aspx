<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Belconfect.B2B.UI.login" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 330px; margin: auto">
        <h1><lang:ContentLiteral ID="cLogin" runat="server" Code="login.title" Text="login"></lang:ContentLiteral></h1>
        <table class="inputpanel">
            <tr>
                <td><lang:ContentLiteral ID="ml4" runat="server" Code="login.languagelist" Text="Language"></lang:ContentLiteral></td>
                <td><asp:DropDownList ID="LanguageList" runat="server" Width="170"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><lang:ContentLiteral ID="ml1" runat="server" code="login.username" Text="Username"></lang:ContentLiteral></td>
                <td><asp:TextBox ID="UserName" runat="server" Width="170" TabIndex="0" Text=""></asp:TextBox></td>
            </tr>
            <tr>
                <td><lang:ContentLiteral ID="ml2" runat="server" Code="login.password" Text="Password"></lang:ContentLiteral></td>
                <td><asp:TextBox ID="Password" runat="server" Width="170" TextMode="Password" Text="Testpasswoord"></asp:TextBox></td>
            </tr>
            <tr>
                <td><lang:ContentLiteral ID="ml5" runat="server" Code="login.rememberme" Text="Remember me"></lang:ContentLiteral></td>
                <td><asp:CheckBox ID="RememberMe" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2"><lang:ContentButton Id="LogIn" runat="server" CssClass="submit" Code="login.logon" Text="Log on" /></td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            $('#LanguageList').live('change', function () {
                window.location = '/login.aspx?l=' + $('#LanguageList').val();
            });

        });

    </script>
</asp:Content>
