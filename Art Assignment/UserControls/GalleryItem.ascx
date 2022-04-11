<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GalleryItem.ascx.cs" Inherits="Art_Assignment.UserControls.GalleryItem" %>

<li>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "~/Pages/Product.aspx?Id={0}") %>'>
        <div class="w-44 h-44 border border-black">
            <img class="w-full h-full" runat="server" src='<%# Eval("ArtPicture", "~/upload/{0}") %>' />
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
