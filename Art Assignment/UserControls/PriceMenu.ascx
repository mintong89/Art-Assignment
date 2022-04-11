<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriceMenu.ascx.cs" Inherits="Art_Assignment.UserControls.PriceMenu" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Cart.css")%>" />

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

</div>
