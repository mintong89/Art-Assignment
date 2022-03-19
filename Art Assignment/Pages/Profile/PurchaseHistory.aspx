<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="Art_Assignment.Pages.Profile.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    My Purchase
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="ph-cont">
        <div class="ph-top-status-nav">
            <div class="nav-item">
                Pending
            </div>
            <div class="nav-item">
                Accepted
            </div>
            <div class="nav-item">
                Rejected
            </div>
        </div>
        <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                <div class="ph-content-cont">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <GroupTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
            </GroupTemplate>
            <ItemTemplate>
                <div class="ph-order-row div-card">
                    <div style="grid-row: 1 / 3">
                        <div class="flex h-full items-center p-3">
                            <i class="fa-solid fa-caret-right fa-xl"></i>
                        </div>
                    </div>
                    <div class="ph-order-header-wrapper">
                        <div>
                            Order ID
                        </div>
                        <div>
                            Items
                        </div>
                        <div>
                            Delivery Address
                        </div>
                        <div>
                            Payment Date
                        </div>
                        <div>
                            Total Amount
                        </div>
                    </div>
                    <div>
                        1
                    </div>
                    <div>
                        2
                    </div>
                    <div>
                        3, Fruits Street<br />
                        10201 TreeState
                    </div>
                    <div>
                        19 Mar 2022
                    </div>
                    <div>
                        MYR 299.99
                    </div>
                </div>
                <div class="ph-order-details">
                    <div class="ph-od-cont">
                        <div>#</div>
                        <div>Item Name</div>
                        <div>Amount</div>
                        <div>
                            1
                        </div>
                        <div>
                            Famous Art
                        </div>
                        <div>
                            RM 200
                        </div>
                    </div>
                    <div class="ph-od-subtotal">
                        <div>
                        </div>
                        <div>
                            MYR
                        </div>
                        <div>
                            Subtotal
                        </div>
                        <div>
                            10.00
                        </div>
                        <div>
                            Tax
                        </div>
                        <div>
                            3.00
                        </div>
                        <div>
                            Delivery
                        </div>
                        <div>
                            1.47
                        </div>
                        <div>
                            Grand Total
                        </div>
                        <div>
                            999
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <div class="ph-content-cont">
            <div class="ph-order-row div-card">
                <div style="grid-row: 1 / 3">
                    <div class="flex h-full items-center p-3">
                        <i class="fa-solid fa-caret-right fa-xl"></i>
                    </div>
                </div>
                <div class="ph-order-header-wrapper">
                    <div>
                        Order ID
                    </div>
                    <div>
                        Items
                    </div>
                    <div>
                        Delivery Address
                    </div>
                    <div>
                        Payment Date
                    </div>
                    <div>
                        Total Amount
                    </div>
                </div>
                <div>
                    1
                </div>
                <div>
                    2
                </div>
                <div>
                    3, Fruits Street<br />
                    10201 TreeState
                </div>
                <div>
                    19 Mar 2022
                </div>
                <div>
                    MYR 299.99
                </div>
            </div>
            <div class="ph-order-details">
                <div class="ph-od-cont">
                    <div>#</div>
                    <div>Item Name</div>
                    <div>Amount</div>
                    <div>
                        1
                    </div>
                    <div>
                        Famous Art
                    </div>
                    <div>
                        RM 200
                    </div>
                </div>
                <div class="ph-od-subtotal">
                    <div>
                    </div>
                    <div>
                        MYR
                    </div>
                    <div>
                        Subtotal
                    </div>
                    <div>
                        10.00
                    </div>
                    <div>
                        Tax
                    </div>
                    <div>
                        3.00
                    </div>
                    <div>
                        Delivery
                    </div>
                    <div>
                        1.47
                    </div>
                    <div>
                        Grand Total
                    </div>
                    <div>
                        999
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
