<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Art_Assignment.Pages.Gallery" %>

<%@ Register TagPrefix="gll" TagName="Item" Src="~/UserControls/GalleryItem.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Gallery.css")%>" />
    <script src="<%= Page.ResolveUrl("~/js/Gallery.js") %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="sticky top-[100px] z-10">
        <div class="flex bg-white px-8 pt-8">
            <div class="relative">
                <asp:TextBox class="rounded-full border border-black outline-none h-10 pl-12" ID="SearchBox" runat="server" placeholder="Find an Art Piece...">
                </asp:TextBox>
                <i class="fas fa-lg fa-search absolute z-10 left-4 leading-10"></i>
            </div>
            <asp:Button CssClass="btn cursor-pointer py-1 ml-8" ID="SearchButton" runat="server" Text="Search" OnClick="RedirectSearch" />
        </div>
    </div>
    <div class="relative flex flex-1 items-start">
        <%--        <div class="gallery-container sticky px-8 flex flex-col py-10">
            <div class="flex flex-1">
                <div class="gallery--search-filters">
                    <h3 class="font-bold text-lg drop-shadow-lg mb-2">Search Filters</h3>
                    <div class="gallery--tags">
                        <div class="gallery--tag">
                            <div onclick="handleTag(this)" class="flex items-center mb-2 cursor-pointer select-none" data-open="false">
                                <span class="mr-2">
                                    <img class="gallery-tag-chevron transition-all" src="<%= Page.ResolveUrl("~/resources/chevron.png") %>" /></span>
                                <p class="drop-shadow-lg">Tags</p>
                            </div>
                            <ul class="ml-6 max-h-0 transition-all overflow-hidden">
                                <li class="flex items-center">
                                    <input class="mr-2" type="checkbox" />
                                    <p class="text-sm">Test 1</p>
                                </li>
                                <li class="flex items-center">
                                    <input class="mr-2" type="checkbox" />
                                    <p class="text-sm">Test 1</p>
                                </li>
                            </ul>
                        </div>
                        <div class="gallery--tag">
                            <div onclick="handleTag(this)" class="flex items-center mb-2 cursor-pointer select-none" data-open="false">
                                <span class="mr-2">
                                    <img class="gallery-tag-chevron transition-all" src="<%= Page.ResolveUrl("~/resources/chevron.png") %>" /></span>
                                <p class="drop-shadow-lg">Tags</p>
                            </div>
                            <ul class="ml-6 max-h-0 transition-all overflow-hidden">
                                <li class="flex items-center">
                                    <input class="mr-2" type="checkbox" />
                                    <p class="text-sm">Test 1</p>
                                </li>
                                <li class="flex items-center">
                                    <input class="mr-2" type="checkbox" />
                                    <p class="text-sm">Test 1</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="w-px bg-black mx-12"></div>
            </div>
        </div>--%>
        <div class="my-10 mx-8">
            <asp:Repeater ID="rptArtistProd" runat="server">
                <HeaderTemplate>
                    <ul class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-x-8 gap-y-5">
                </HeaderTemplate>
                <ItemTemplate>
                    <gll:Item runat="server" ID="ContactUC" />
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
