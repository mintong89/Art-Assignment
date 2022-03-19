<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Art_Assignment.Pages.Profile.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Wishlist
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="font-bold mb-3 text-xl">
        <i class="fa-solid fa-star"></i>&nbsp;My Wishlist
    </div>
    <form runat="server">
        <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="groupPlaceHolder1"
            ItemPlaceholderID="itemPlaceHolder1" DataSourceID="WishListDataSource">
            <EmptyDataTemplate>
                <div class="flex justify-center p-3">
                    -- Your wishlist is empty --
                </div>
                <div class="flex justify-center p-3">
                    <a class="button-22" runat="server" href="~/Pages/Gallery.aspx">Click me to browse gallery</a>
                </div>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <div style="display: grid; row-gap: 10px;">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                </div>
                <div class="flex justify-center">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="5" class="wishlist-pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" FirstPageText='<i class="fa-solid fa-angles-left fa-lg"></i>' PreviousPageText='<i class="fa-solid fa-angle-left fa-lg"></i>' />
                            <%--<asp:NumericPagerField ButtonType="Link" />--%>
                            <asp:TemplatePagerField>
                                <PagerTemplate>
                                    <div>
                                        Page
                                <asp:Label runat="server" ID="labelCurrentPage" Text="<%# Container.TotalRowCount > 0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
                                        of
                                <asp:Label runat="server" ID="labelTotalPages" Text="<%#  Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
                                    </div>
                                    &nbsp;
                                </PagerTemplate>
                            </asp:TemplatePagerField>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" NextPageText='<i class="fa-solid fa-angle-right fa-lg"></i>' LastPageText='<i class="fa-solid fa-angles-right fa-lg"></i>' />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <GroupTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
            </GroupTemplate>
            <ItemTemplate>
                <div style="display: grid; grid-template-columns: auto auto 1fr auto; grid-template-rows: auto 1fr; row-gap: 10px; column-gap: 10px; padding: 10px" class="div-card">
                    <a runat="server" href='<%# Eval("ArtProdID", "~/Pages/Profile/Wishlist.aspx?DeleteId={0}")%>' style="display: contents">
                        <div runat="server" class="flex items-center font-bold" style="grid-row-start: 1; grid-row-end: 3; cursor: pointer">
                            <i class="fa-solid fa-trash fa-xl text-red-400 hover:text-red-500"></i>
                        </div>
                    </a>
                    </a>
                    <a runat="server" href='<%# "~/Pages/Product.aspx?ID=" + Eval("ArtProdID") %>' style="display: contents">
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
                    </a>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="WishListDataSource" runat="server">
            <SelectParameters>
                <asp:Parameter Name="UserID" Type="Int32" DefaultValue="-1" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
