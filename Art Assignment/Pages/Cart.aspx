<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs" Inherits="Art_Assignment.Pages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Cart.css")%>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="flex w-full">
        <div class="px-16 py-8 flex-1">
            <h4 class="text-xl font-bold">Address</h4>
            <div class="my-4 border border-black py-4 px-8">
                <div class="my-2">
                    <p>Address 1:</p>
                    <asp:TextBox CssClass="border border-black outline-none p-2 w-full" ID="Address1Text"
                        runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server"
                        ControlToValidate="Address1Text" ErrorMessage="Please enter your address!" />
                </div>
                <div class="my-2">
                    <p>Address 2:</p>
                    <asp:TextBox CssClass="border border-black outline-none p-2 w-full" ID="Address2Text"
                        runat="server"></asp:TextBox>
                    <div class="h-4"></div>
                </div>
                <div class="my-2">
                    <p>State:</p>
                    <asp:TextBox CssClass="border border-black outline-none p-2" ID="StateText" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server"
                        ControlToValidate="StateText" ErrorMessage="Please enter your state!" />
                </div>
                <div class="my-2">
                    <p>Country:</p>
                    <asp:TextBox CssClass="border border-black outline-none p-2" ID="CountryText" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server"
                        ControlToValidate="CountryText" ErrorMessage="Please enter your country!" />
                </div>
            </div>
            <h4 class="text-xl font-bold">Items</h4>
            <asp:Repeater ID="CartRepeater" runat="server">
                <ItemTemplate>
                    <div class="flex border border-black h-36 w-full justify-between items-center px-5 my-4">
                        <div class="flex items-center">
                            <img class="w-16 h-16 min-w-[4rem] min-h-[4rem]" runat="server"
                                src='<%# Eval("ArtPicture", "~/upload/{0}") %>' />
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
                                    <asp:Literal runat="server" Text='<%# string.Format("{0:n2}", Eval("Price")) %>'>
                                    </asp:Literal>
                            </p>
                            <asp:HyperLink NavigateUrl='<%# Eval("Id", "~/Pages/Cart.aspx?DeleteId={0}") %>'
                                CssClass="m-4 mr-2 cross-icon cursor-pointer" runat="server"
                                CommandArgument='<%# Eval("Id").ToString() %>' />
                        </div>
                    </div>

                </ItemTemplate>
                <FooterTemplate>
                    <div runat="server" visible='<%# CartRepeater.Items.Count == 0 %>'
                        class="flex justify-center p-3">
                        -- There is nothing in your shopping cart --
                    </div>
                    <div runat="server" visible='<%# CartRepeater.Items.Count == 0 %>'
                        class="flex justify-center p-3">
                        <asp:HyperLink CssClass="btn text-lg cursor-pointer" runat="server" Text="Shop Now"
                            NavigateUrl="~/Pages/Gallery.aspx" />
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="w-px bg-black mx-12 sticky top-0"></div>
        <div class="total-price-container sticky top-[100px] px-16 py-8 flex flex-col items-center">
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
                    <asp:LinkButton CssClass="btn text-lg cursor-pointer" runat="server" Text="Checkout"
                        OnClick="Checkout_Action" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
