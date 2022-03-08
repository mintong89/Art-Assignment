<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="AddArtistProfile.aspx.cs" Inherits="Art_Assignment.Pages.Profile.AddArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Create Artist Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form id="Form1" method="post" runat="server" enctype="multipart/form-data" action="AddArtistProfile.aspx">
        <div class="grid gap-y-3">
            <h1 class="text-xl font-bold text-center">New Artist Profile</h1>
            <div class="flex justify-center">
                <div class="user-profile-upload-image-cont">
                    <img id="profile-pic-img" alt="profile-pic-preview" src="<%= Page.ResolveUrl("~/resources/profile-pic-blank.png") %>" />
                    <div class="user-profile-upload-image-hover-overlay">
                        Click to Upload
                    </div>
                </div>
            </div>
            <input type="file" id="profilePicInput" class="hidden" />
            <div>
                <div class="input-label">
                    Artist Display Name
                </div>
                <asp:TextBox class="input" runat="server" ID="txtArtistDisplayName"></asp:TextBox>
            </div>
            <div>
                <div class="input-label">
                    Biography
                </div>
                <asp:TextBox class="input" runat="server" ID="txtBiography" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <div class="inline-block">
                    <button runat="server" class="button-22">
                        <i class="fa-solid fa-pen-to-square"></i>&nbsp;
                            Add
                    </button>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="<%= Page.ResolveUrl("~/js/AddArtistProfile.js") %>"></script>
</asp:Content>
