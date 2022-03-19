<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="Art_Assignment.Pages.Profile.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    My Purchase
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="ph-cont">
            <div class="ph-top-status-nav">
                <a runat="server" href="~/Pages/Profile/PurchaseHistory.aspx">
                    <div runat="server" id="CatAll" class="nav-item">
                        All
                    </div>
                </a>
                <a runat="server" href="~/Pages/Profile/PurchaseHistory.aspx?filter=PENDING">
                    <div runat="server" id="CatPending" class="nav-item">
                        Pending
                    </div>
                </a>
                <a runat="server" href="~/Pages/Profile/PurchaseHistory.aspx?filter=ACCEPT">
                    <div runat="server" id="CatAccepted" class="nav-item">
                        Accepted
                    </div>
                </a>
                <a runat="server" href="~/Pages/Profile/PurchaseHistory.aspx?filter=REJECT">
                    <div runat="server" id="CatRejected" class="nav-item">
                        Rejected
                    </div>
                </a>
            </div>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="OrderDataSource" GroupPlaceholderID="groupPlaceHolder1"
                ItemPlaceholderID="itemPlaceHolder1">
                <EmptyDataTemplate>
                    <div class="flex justify-center p-3">
                        -- No Purchase History --
                    </div>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <div class="ph-content-cont">
                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                    </div>
                    <div class="flex justify-center">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" FirstPageText='<i style="color: blue" class="fa-solid fa-angles-left fa-lg"></i>' PreviousPageText='<i style="color: blue" class="fa-solid fa-angle-left fa-lg"></i>' />
                            <%--<asp:NumericPagerField ButtonType="Link" />--%>
                            <asp:TemplatePagerField>
                                <PagerTemplate>
                                    <div style="display: inline">
                                        Page
                                <asp:Label runat="server" ID="labelCurrentPage" Text="<%# Container.TotalRowCount > 0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
                                        of
                                <asp:Label runat="server" ID="labelTotalPages" Text="<%#  Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
                                    </div>
                                    &nbsp;
                                </PagerTemplate>
                            </asp:TemplatePagerField>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" NextPageText='<i style="color: blue" class="fa-solid fa-angle-right fa-lg"></i>' LastPageText='<i style="color: blue" class="fa-solid fa-angles-right fa-lg"></i>' />
                        </Fields>
                    </asp:DataPager>
                </div>
                </LayoutTemplate>
                <GroupTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </GroupTemplate>
                <ItemTemplate>
                    <div class="ph-order-row div-card" data-open="0">
                        <div style="grid-row: 1 / 3">
                            <div class="flex h-full items-center py-3 pr-3">
                                <i class="fa-solid fa-caret-right fa-xl collapse-tag"></i>
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
                            <div>
                                Status
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
                        <div>
                            <%# Eval("OrderStatus") %>
                        </div>
                        <asp:TextBox Visible="false" runat="server" ID="OrderIDLiteral" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                    </div>
                    <div class="ph-order-details" style="overflow: hidden; max-height: 0">
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
                    <asp:Parameter DbType="String" DefaultValue="Nope" Name="OrderStatus" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src='<%=Page.ResolveUrl("~/js/PurchaseHistory.js") %>'></script>
</asp:Content>
