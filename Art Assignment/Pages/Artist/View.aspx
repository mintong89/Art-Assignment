<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Art_Assignment.Pages.Artist.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shiji</title>
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/Artist.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="artist-meta-cont">
            <div class="artist-profile-card-cont div-card">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="ArtistDataSource" RenderOuterTable="false" OnItemUpdating="FormView1_ItemUpdating" OnItemCreated="FormView1_ItemCreated">
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
                                <div class="flex items-center" style="display: <%# Eval("ContactEmail")!=DBNull.Value && Eval("ContactEmail")!= "" ? "block" : "none" %>"><i class="fa-solid fa-envelope"></i></div>
                                <div style="display: <%# Eval("ContactEmail")!=DBNull.Value && Eval("ContactEmail")!= "" ? "block" : "none" %>"><%# Eval("ContactEmail") %></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value && Eval("ContactPhone")!= "" ? "block" : "none" %>" class="flex items-center"><i class="fa-solid fa-phone"></i></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value && Eval("ContactPhone")!= "" ? "block" : "none" %>"><%# Eval("ContactPhone") %></div>
                                <div class="flex items-center" style="display: <%# Eval("ContactTwitter")!=DBNull.Value && Eval("ContactTwitter")!= "" ? "block" : "none" %>"><i class="fa-brands fa-twitter"></i></div>
                                <div style="display: <%# Eval("ContactTwitter")!=DBNull.Value && Eval("ContactTwitter")!= "" ? "block" : "none" %>"><%# Eval("ContactTwitter") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="artist-edit-profile-bg-cont">
                            <div class="div-card w-96 bg-white p-3 grid gap-y-3" onclick="event.stopPropagation()">
                                <div class="flex justify-center">
                                    <div class="artist-upload-image-cont">
                                        <img runat="server" ClientIDMode="Static" id="edit_image_preview" style="width: 100%; height: 100%" alt="profile-pic-preview" src='<%# Eval("ArtistImage") %>' />
                                        <div class="artist-upload-image-hover-overlay">
                                            Click to Upload
                                        </div>
                                    </div>
                                </div>
                                <input type="file" id="profilePicInput" class="hidden" runat="server" ClientIDMode="Static" />
                                <div>
                                    <div class="input-label">
                                        Artist Display Name<span style="color: red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtistDisplayName" ForeColor="Red">Display Name is required.</asp:RequiredFieldValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="txtArtistDisplayName" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Biography
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="txtBiography" TextMode="MultiLine" Text='<%# Bind("BioDesc") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Contact Phone Number
                                        <asp:CustomValidator ID="PhoneNumberValidator" runat="server" ErrorMessage="Invalid Phone Number!" ForeColor="red"></asp:CustomValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="cPhoneNum" Text='<%# Bind("ContactPhone") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Contact Email
                                        <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid Email !" ForeColor="red"></asp:CustomValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="cEmail" Text='<%# Bind("ContactEmail") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Twitter
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="Twitter" Text='<%# Bind("ContactTwitter") %>'></asp:TextBox>
                                </div>
                                <div class="flex justify-center">
                                    <asp:LinkButton ID="btnArtistProfileUpdate" runat="server" CausesValidation="True" ClientIDMode="Static"
                                        CommandName="Update" Text="Update" CssClass="button-22 button-22-success" />
                                </div>
                                <div class="flex justify-center">
                                    <asp:LinkButton ID="btnArtistProfileUpdateCancel" runat="server" CssClass="button-22 button-22-danger" ClientIDMode="Static"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </div>
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
   <asp:LinkButton runat="server" ID="delIfSeen"></asp:LinkButton>
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
