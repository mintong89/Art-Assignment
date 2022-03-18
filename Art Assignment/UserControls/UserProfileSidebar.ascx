<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfileSidebar.ascx.cs" Inherits="Art_Assignment.UserControls.UserProfileSidebar" %>
<div class="flex flex-col user-profile-sidebar-cont">
    <a href="User.aspx">
        <div runat="server" id="divUserProfile" class="user-profile-sidebar-item">
            <i class="fa-solid fa-id-card"></i>
            User Profile
        </div>
    </a>
    <a href="Security.aspx">
        <div runat="server" id="divSecurity" class="user-profile-sidebar-item">
            <i class="fa-solid fa-lock"></i>
            Security
        </div>
    </a>
    <div runat="server" id="divMyPurchase" class="user-profile-sidebar-item">
        <i class="fa-solid fa-cart-shopping"></i>
        My Purchase
    </div>
    <a href="~/Pages/Profile/Wishlist.aspx" runat="server" id="a_WishList">
        <div runat="server" id="divMyWishlist" class="user-profile-sidebar-item">
            <i class="fa-solid fa-star"></i>
            My Wishlist
        </div>
    </a>
    <a href="~/Pages/Profile/AddArtistProfile.aspx" runat="server" id="a_AddArtistProfile">
        <div runat="server" id="divManageArtistProfile" class="user-profile-sidebar-item">
            <i class="fa-solid fa-palette"></i>
            Become an Artist
        </div>
    </a>
    <a class="hidden" runat="server" id="a_artist_view">
        <div runat="server" id="div1" class="user-profile-sidebar-item">
            <i class="fa-solid fa-palette"></i>
            My Artist Profile
        </div>
    </a>
    <div runat="server" id="divStockManagement" class="user-profile-sidebar-item">
        <i class="fa-solid fa-boxes-stacked"></i>
        Stock Management
    </div>
    <div runat="server" id="submenuStockManagement" class="user-profile-sidebar-submenu hidden">
        <a href="StockDetails.aspx">
            <div runat="server" id="divStockDetails" class="user-profile-sidebar-item">
                <i></i>
                Stock Details
            </div>
        </a>
        <div runat="server" id="divOrders" class="user-profile-sidebar-item">
            <i></i>
            Orders
        </div>
    </div>
</div>
