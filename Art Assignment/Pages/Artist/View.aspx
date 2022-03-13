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
                            <div class="flex justify-center relative w-full">
                                <div class="absolute right-0">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CssClass="button-22"
                                        CommandName="Edit" Text="Edit" />
                                </div>
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
                    <EditItemTemplate>
                        <div class="artist-edit-profile-bg-cont">
                            <div class="div-card h-48 w-48 bg-white" onclick="event.stopPropagation()">
                                <div>Weird text</div>
                                <asp:LinkButton ID="btnArtistProfileUpdate" runat="server" CausesValidation="True" ClientIDMode="Static"
                                    CommandName="Update" Text="Update" CssClass="button-22 button-22-success" />
                                <asp:LinkButton ID="btnArtistProfileUpdateCancel" runat="server" CssClass="button-22 button-22-danger" ClientIDMode="Static"
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                    </EditItemTemplate>
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
    <script src="<%=Page.ResolveUrl("~/js/Artist.js") %>"></script>
</asp:Content>
