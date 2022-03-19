<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="Art_Assignment.Pages.Profile.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    My Purchase
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
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
            <asp:ListView ID="ListView1" runat="server" DataSourceID="OrderDataSource" GroupPlaceholderID="groupPlaceHolder1"
                ItemPlaceholderID="itemPlaceHolder1">
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
                            <%# Eval("OrderID") %>
                        </div>
                        <div>
                            <%# Eval("ItemCount") %>
                        </div>
                        <div>
                            <%# Eval("Address1") %><br />
                            <%# Eval("Address2") %><br />
                            <%# Eval("State") %><br />
                            <%# Eval("Country") %><br />
                        </div>
                        <div>
                            <%# Eval("DateCreated") %>
                        </div>
                        <div>
                            RM <%# Eval("OrderTotal") %>
                        </div>
                        <asp:TextBox Visible="false" runat="server" ID="OrderIDLiteral" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                    </div>
                    <div class="ph-order-details">
                        <asp:ListView ID="ListViewInner" runat="server" GroupPlaceholderID="gph1"
                            ItemPlaceholderID="iph1" DataSourceID="OrderDetailsDataSource">
                            <LayoutTemplate>

                                <div class="ph-od-cont">
                                    <div>#</div>
                                    <div>Item Name</div>
                                    <div>Amount</div>
                                    <asp:PlaceHolder runat="server" ID="gph1"></asp:PlaceHolder>
                                </div>

                            </LayoutTemplate>
                            <GroupTemplate>
                                <asp:PlaceHolder runat="server" ID="iph1"></asp:PlaceHolder>
                            </GroupTemplate>
                            <ItemTemplate>
                                <div>
                                    <%# Eval("Row") %>
                                </div>
                                <div>
                                    <%# Eval("Name") %>
                                </div>
                                <div>
                                    RM <%# Eval("Price") %>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="OrderSubtotalDataSource" RenderOuterTable="false">
                            <ItemTemplate>
                                <div class="ph-od-subtotal">
                                    <div>
                                    </div>
                                    <div>
                                        RM
                                    </div>
                                    <div>
                                        Subtotal
                                    </div>
                                    <div>
                                        <%# Eval("Subtotal") %>
                                    </div>
                                    <div>
                                        Tax
                                    </div>
                                    <div>
                                        <%# Eval("TaxFee") %>
                                    </div>
                                    <div>
                                        Delivery
                                    </div>
                                    <div>
                                        <%# Eval("DeliveryFee") %>
                                    </div>
                                    <div>
                                        Grand Total
                                    </div>
                                    <div>
                                        <%# Eval("OrderTotal") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                    <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="OrderDetailsDataSource" runat="server" SelectCommand="SELECT 
  ROW_NUMBER() OVER(ORDER BY OrderID) AS [Row],
  ArtProd.Name,
  ArtProd.Price
FROM OrderItem
INNER JOIN ArtProd ON OrderItem.ArtItemID = ArtProd.ID
WHERE OrderID = @OrderID
ORDER BY OrderID;">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="OrderIDLiteral" DbType="Int32" DefaultValue="-1" Name="OrderID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="OrderSubtotalDataSource" runat="server" SelectCommand="SELECT
  OrderTotal - TaxFee - DeliveryFee AS Subtotal,
  TaxFee,
  DeliveryFee,
  OrderTotal
FROM
  [Order]
WHERE ID = @ID;">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="OrderIDLiteral" DbType="Int32" DefaultValue="-1" Name="ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="OrderDataSource" runat="server">
                <SelectParameters>
                    <asp:Parameter DbType="Int32" DefaultValue="-1" Name="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
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
                        RM 299.99
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
                            RM
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
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
