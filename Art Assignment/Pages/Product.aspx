<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Product2.aspx.cs" Inherits="Art_Assignment.Pages.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Gallery.css")%>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form class="relative flex flex-1 items-start" runat="server">
        <asp:FormView ID="ProdView" runat="server">
            <ItemTemplate>
                <div class="px-20 py-14 w-full">
                    <div class="lg:flex mb-4">
                        <div class="product--image flex-1 lg:mr-12 mb-4 lg:mb-0">
                            <img class="w-full max-w-full max-h-full" src="https://via.placeholder.com/4000x3000.png?text=test" />
                        </div>
                        <div class="flex-1">
                            <div class="product--summary">
                                <h3 class="text-3xl drop-shadow-xl">
                                    <asp:Literal runat="server" Text='<%# Eval("Name") %>'></asp:Literal>
                                </h3>
                                <h4 class="text-lg">By 
                                    <asp:Literal runat="server" Text='<%# Eval("ArtistName") %>'></asp:Literal>
                                </h4>
                                <div class="flex justify-between items-center mt-8">
                                    <div class="flex items-center">
                                        <asp:Label Font-Strikeout='<% #Eval("isSold") %>' runat="server">
                                        <h3 class="text-3xl drop-shadow-xl">RM
                                            <asp:Literal runat="server" Text='<%# string.Format("{0:n2}", Eval("Price")) %>'></asp:Literal>
                                        </h3>
                                        </asp:Label>
                                    </div>
                                    <div class="relative">
                                        <asp:Button CssClass="btn text-lg cursor-pointer" ID="AddCartButton" runat="server" Text='<%# Eval("isSold").ToString() == "False" ? "Add To Cart" : "Sold Out" %>' OnClick="AddCartButton_Click" />
                                        <div visible="false" runat="server" id="CartResultPanel" class="text-xs text-center p-1 absolute w-[120%] -left-[10%] bg-white border border-slate-500 mt-2 rounded whitespace-pre-wrap">
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-8 flex items-center">
                                    <asp:Button ID="WishlistButton" CssClass="heart mr-2 cursor-pointer" runat="server" OnClick="ToggleWishlist" />
                                    <h4 class="text-2xl">
                                        <asp:Literal ID="WishlistText" runat="server" Text="Add to Wishlist"></asp:Literal>
                                    </h4>
                                </div>
                            </div>
                            <div class="w-full h-px bg-black my-8"></div>
                            <div class="product--description">
                                <h4 class="text-2xl drop-shadow-xl mb-2">Description</h4>
                                <p>
                                    <asp:Literal runat="server" Text='<%# Eval("Description") %>'></asp:Literal>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </form>
</asp:Content>
