<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Art_Assignment.Pages.Artist.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shiji</title>
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/Artist.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="artist-meta-cont">
            <div class="artist-profile-card-cont div-card">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="ArtistDataSource" RenderOuterTable="false">
                    <ItemTemplate>
                        <div class="grid gap-y-3 justify-items-center">
                            <div class="flex justify-center">
                                <div class="rounded-full w-20 h-20 overflow-hidden">
                                    <img runat="server" id="artistPic" class="w-full h-full" alt="profilePic" src='<%# Bind("ArtistImage") %>' />
                                </div>
                            </div>
                            <div class="font-bold text-lg">
                                <%# Eval("Name") %>
                            </div>
                            <div class="text-sm limit-lines-3">
                                <%# Eval("BioDesc") %>
                            </div>
                            <div class="grid grid-cols-[auto_1fr] gap-x-3">
                                <div class="flex items-center" style="display: <%# Eval("ContactEmail")!=DBNull.Value ? "block" : "none" %>"><i class="fa-solid fa-envelope"></i></div>
                                <div style="display: <%# Eval("ContactEmail")!=DBNull.Value ? "block" : "none" %>"><%# Eval("ContactEmail") %></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value ? "block" : "none" %>" class="flex items-center"><i class="fa-solid fa-phone"></i></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value ? "block" : "none" %>"><%# Eval("ContactPhone") %></div>
                                <div class="flex items-center" style="display: <%# Eval("ContactTwitter")!=DBNull.Value ? "block" : "none" %>"><i class="fa-brands fa-twitter"></i></div>
                                <div style="display: <%# Eval("ContactTwitter")!=DBNull.Value ? "block" : "none" %>"><%# Eval("ContactTwitter") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="ArtistDataSource" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" runat="server"></asp:SqlDataSource>
            </div>
            <div class="artist-main-cont div-card">
                <div class="artist-nav-menu-cont">
                    <div class="item-active">
                        <i class="fa-solid fa-scale-balanced"></i>&nbsp;On sales    
   
                    </div>
                    <div class="item-idle">
                        <i class="fa-solid fa-comment"></i>&nbsp;Comments
   
                    </div>
                </div>
                <div>
                    Item 1<br>
                    Item 2<br>
                    Item 3Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    Item
                <br>
                    <br>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
