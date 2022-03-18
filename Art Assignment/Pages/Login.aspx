<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Art_Assignment.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Home.css")%>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server" autocomplete="off">
        <div class="flex items-center justify-center home-container">
            <div class="register-box-cont p-5 w-96 text-sm">
                <div class="text-base pb-3">Login</div>
                <div style="color: red">
                    <asp:Literal ID="errMsg" runat="server"></asp:Literal>
                </div>
                <div>
                    <div class="input-label">
                        Email
                    </div>
                    <asp:TextBox class="input" runat="server" ID="txtEmail"></asp:TextBox>
                </div>
                <div>
                    <div class="input-label">Password</div>
                    <asp:TextBox class="input" runat="server" ID="txtPassword" type="password"></asp:TextBox>
                </div>
                <div class="flex justify-center pt-3">
                    <asp:Button class="button-22" runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
                </div>
                <div class="text-center">
                    <a href="Register.aspx" style="text-decoration: underline; color: darkcyan">Register here !</a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
