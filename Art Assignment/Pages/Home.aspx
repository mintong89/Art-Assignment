<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Art_Assignment.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Home.css")%>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="home-container flex justify-content-center align-items-center">
        <div class="home-content">
            <div class="flex justify-content-center">Buy Art from {n} artist</div>
            <asp:TextBox ID="SearchBox" runat="server" placeholder="Find an Art Piece..."></asp:TextBox>
        </div>
    </div>
</asp:Content>
