<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Art_Assignment.Pages.Profile.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Wishlist
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="font-bold mb-3 text-xl">
        <i class="fa-solid fa-star"></i>&nbsp;My Wishlist
    </div>
    <div style="display: grid; row-gap: 10px;">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="WishListDataSource">
            <ItemTemplate>
                <a runat="server" href='<%# "~/Pages/Product.aspx?ID=" + Eval("ArtProdID") %>'>
                    <div style="display: grid; grid-template-columns: auto auto 1fr auto; grid-template-rows: auto 1fr; row-gap: 10px; column-gap: 10px; padding: 10px" class="div-card">
                        <div class="flex items-center font-bold" style="grid-row-start: 1; grid-row-end: 3">
                            <i style="color: red" class="fa-solid fa-trash fa-xl"></i>
                        </div>
                        <div style="grid-row-start: 1; grid-row-end: 3; width: 128px; height: 128px">
                            <img runat="server" class="w-full h-full" src='<%# Eval("ArtPicture") %>' />
                        </div>
                        <div style="grid-column: 3 / 4">
                            <%# Eval("Name") %>
                        </div>
                        <div style="grid-row-start: 2; color: grey; font-style: italic">
                            <%# "By: " + Eval("ArtistName") %>
                        </div>
                        <div style="grid-row-start: 1; grid-row-end: 3; grid-column: 4 / 5" class="flex items-center font-bold">
                            RM <%# Eval("Price") %>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="WishListDataSource" runat="server">
            <SelectParameters>
                <asp:Parameter Name="UserID" Type="Int32" DefaultValue="-1" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
