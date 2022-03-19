<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Art_Assignment.Pages.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Gallery.css")%>" />
    <script src="<%= Page.ResolveUrl("~/js/Gallery.js") %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
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
            <div class="gallery-container sticky px-8 flex flex-col py-10">
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
            </div>
            <div class="my-10">
                <asp:Repeater ID="rptArtistProd" runat="server">
                    <HeaderTemplate>
                        <ul class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-x-8 gap-y-5">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "~/Pages/Product.aspx?Id={0}") %>'>
                                <div class="w-44 h-44 border border-black">
                                    <img src="<%# Eval("ArtPicture", "~/upload/{0}") %>" />
                                </div>
                                <h5 class="text-lg">
                                    <asp:Literal runat="server" Text='<%# Eval("Name") %>'></asp:Literal>
                                </h5>

                                <div class="flex py-1">
                                    <asp:Label CssClass="flex items-end" Font-Strikeout='<% #Eval("isSold") %>' runat="server">
                                    <p class="text-sm leading-none">RM</p>
                                    <p class="leading-none">
                                        <asp:Literal runat="server" Text='<%# string.Format("{0:n2}", Eval("Price")) %>'></asp:Literal>
                                    </p>
                                    </asp:Label>
                                    <asp:Label Visible='<% #Eval("isSold") %>' ID="Label1" runat="server">
                                    <p class="pl-1 leading-none text-red-500">Sold Out</p>
                                    </asp:Label>
                                </div>
                                <p class="text-xs text-gray-500 leading-3">
                                    By
                            <asp:Literal runat="server" Text='<%# Eval("ArtistName") %>'></asp:Literal>
                                </p>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</asp:Content>
