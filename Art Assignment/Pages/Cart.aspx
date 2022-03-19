<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Art_Assignment.Pages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Cart.css")%>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form class="cart-container relative flex flex-1 items-start" runat="server">
        <div class="flex w-full">
            <div class="px-16 py-8 pt-4 flex-1">
                <asp:Repeater ID="CartRepeater" runat="server">
                    <ItemTemplate>
                        <div class="flex border border-black h-36 w-full justify-between items-center px-5 my-4">
                            <div class="flex items-center">
                                <img class="w-16 h-16 min-w-[4rem] min-h-[4rem]" src="https://via.placeholder.com/200x200" />
                                <div class="px-4">
                                    <h5 class="text-xl">
                                        <asp:Literal runat="server" Text='<%# Eval("Name") %>'></asp:Literal>
                                    </h5>
                                    <p>
                                        <asp:Literal runat="server" Text='<%# Eval("ArtistName") %>'></asp:Literal>
                                    </p>
                                </div>
                            </div>
                            <div class="flex items-center">
                                <p class="font-bold">
                                    RM
                                    <asp:Literal runat="server" Text='<%# string.Format("{0:n2}", Eval("Price")) %>'></asp:Literal>
                                </p>
                                <asp:HyperLink NavigateUrl='<%# Eval("Id", "~/Pages/Cart.aspx?DeleteId={0}") %>' CssClass="m-4 mr-2 cross-icon cursor-pointer" runat="server" CommandArgument='<%# Eval("Id").ToString() %>' />
                            </div>
                        </div>

                    </ItemTemplate>
                    <FooterTemplate>
                        <div runat="server" visible='<%# CartRepeater.Items.Count == 0 %>' class="flex justify-center p-3">
                            -- There is nothing in your shopping cart --
                        </div>
                        <div runat="server" visible='<%# CartRepeater.Items.Count == 0 %>' class="flex justify-center p-3">
                            <asp:HyperLink CssClass="btn text-lg cursor-pointer" runat="server" Text="Shop Now" NavigateUrl="~/Pages/Gallery.aspx" />
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="w-px bg-black mx-12"></div>
            <div class="total-price-container sticky top-0 px-16 py-8 flex flex-col items-center">
                <div class="total-price">
                    <div class="border border-black py-12 px-8">
                        <ul class="font-bold">
                            <li class="grid grid-cols-2 my-2">
                                <div>Subtotal</div>
                                <div class="text-right">
                                    <asp:Literal ID="SubtotalText" runat="server" Text='RM 0.00'></asp:Literal>
                                </div>
                            </li>
                            <li class="grid grid-cols-2 my-2">
                                <div>Shipping</div>
                                <div class="text-right">
                                    <asp:Literal ID="ShippingText" runat="server" Text='RM 0.00'></asp:Literal>
                                </div>
                            </li>
                            <li class="grid grid-cols-2 my-2">
                                <div>Tax</div>
                                <div class="text-right">
                                    <asp:Literal ID="TaxText" runat="server" Text='RM 0.00'></asp:Literal>
                                </div>
                            </li>
                        </ul>
                        <div class="h-px w-full bg-black my-4"></div>
                        <div class="font-bold grid grid-cols-2 my-2">
                            <div>Total</div>
                            <div class="text-right">
                                <asp:Literal ID="TotalText" runat="server" Text='RM 0.00'></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="my-4 flex justify-center">
                        <asp:LinkButton CssClass="btn text-lg cursor-pointer" runat="server" Text="Checkout" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
