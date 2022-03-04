<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Art_Assignment.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Home.css")%>" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="home-container flex justify-content-center align-items-center">
        <div class="home-content">
            <div class="flex justify-content-center text-7xl">Buy Art from {n} artist</div>
            
            <div class="flex justify-content-center mt-3 "><i class="fas fa-lg fa-search" style="position:absolute; left:655px; top:395px;"></i><asp:TextBox class="rounded-full p-3 pl-9" ID="SearchBox" runat="server" placeholder="Find an Art Piece..." ></asp:TextBox></div>
          
            
        </div>
    </div>
</asp:Content>
