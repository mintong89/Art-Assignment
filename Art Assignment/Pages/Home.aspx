<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Art_Assignment.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Home.css")%>" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="home-container flex justify-center items-center">
        <div class="home-content">
            <div class="flex font-bold justify-center text-7xl">Buy Art from us!</div>
            <div class="text-gray-400">Every artist dips his brush in his own soul, and paints his own nature into his pictures</div>

            <div class="flex justify-center mt-3 ">
                <div class="relative">
                    <asp:TextBox class="rounded-full h-10 pl-12" ID="SearchBox" runat="server" placeholder="Find an Art Piece...">
                    </asp:TextBox>
                    <i class="fas fa-lg fa-search absolute z-10 left-4 leading-10"></i>
                    <asp:Button CssClass="hidden" OnClick="RedirectSearch" runat="server" Text="Button" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
