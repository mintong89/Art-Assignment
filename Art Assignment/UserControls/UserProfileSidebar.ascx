<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfileSidebar.ascx.cs" Inherits="Art_Assignment.UserControls.UserProfileSidebar" %>
<div class="flex flex-col user-profile-sidebar-cont">
    <div runat="server" id="divUserProfile" class="user-profile-sidebar-item">
        <i class="fa-solid fa-id-card"></i>
        User Profile
    </div>
    <div runat="server" id="divSecurity" class="user-profile-sidebar-item">
        <i class="fa-solid fa-lock"></i>
        Security
    </div>
    <div runat="server" id="divMyPurchase" class="user-profile-sidebar-item">
        <i class="fa-solid fa-cart-shopping"></i>
        My Purchase
    </div>
    <div runat="server" id="divManageArtistProfile" class="user-profile-sidebar-item">
        <i class="fa-solid fa-palette"></i>
        Manage Artist Profile
    </div>
    <div runat="server" id="divStockManagement" class="user-profile-sidebar-item">
        <i class="fa-solid fa-boxes-stacked"></i>
        Stock Management
    </div>
    <div class="user-profile-sidebar-submenu">
        <div runat="server" id="divStockDetails" class="user-profile-sidebar-item">
            <i></i>
            Stock Details
        </div>
        <div runat="server" id="divOrders" class="user-profile-sidebar-item">
            <i></i>
            Orders
        </div>
    </div>
</div>
