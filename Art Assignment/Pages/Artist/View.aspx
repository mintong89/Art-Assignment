<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Art_Assignment.Pages.Artist.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shiji</title>
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/Artist.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="artist-meta-cont">
        <div class="artist-profile-card-cont div-card">
            <div class="grid gap-y-3 justify-items-center">
                <div class="flex justify-center">
                    <div class="rounded-full w-20 h-20 overflow-hidden">
                        <img class="w-full h-full" alt="profilePic" src="https://i.scdn.co/image/ab6761610000e5ebd861f5765d0ef3b9aa69cf20" />
                    </div>
                </div>
                <div class="font-bold text-lg">
                    Shiji
                </div>
                <div class="text-sm limit-lines-3">
                    Im an artist :3
                    <br />
                    Im an artist :3
                    <br />
                    Im an artist :3
                    <br />
                    Im an artist :3
                    <br />
                </div>
                <div class="grid grid-cols-[auto_1fr] gap-x-3">
                    <div class="flex items-center"><i class="fa-solid fa-envelope"></i></div>
                    user@gmail.com
                <div class="flex items-center"><i class="fa-solid fa-phone"></i></div>
                    012-345 6789
                <div class="flex items-center"><i class="fa-brands fa-twitter"></i></div>
                    @shiji
                </div>
            </div>
        </div>
        <div class="artist-main-cont div-card">
            <div class="artist-nav-menu-cont">
                <div class="item-active">
                    <i class="fa-solid fa-scale-balanced"></i>&nbsp;On sales    
   
                </div>
                <div class="item-idle">
                    <i class="fa-solid fa-comment"></i>&nbsp;Comments
   
                </div>
            </div>
            <div>
                Item 1<br>
                Item 2<br>
                Item 3Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
