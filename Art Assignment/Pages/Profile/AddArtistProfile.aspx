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
                    <img id="userProfileImg" style="width:100%; height:100%" alt="profile-pic-preview" src="<%= Page.ResolveUrl("~/resources/profile-pic-blank.png") %>" />
                    <div class="user-profile-upload-image-hover-overlay">
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
                <asp:TextBox class="input" runat="server" ID="txtArtistDisplayName"></asp:TextBox>
            </div>
            <div>
                <div class="input-label">
                    Biography
                </div>
                <asp:TextBox class="input" runat="server" ID="txtBiography" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <div class="input-label">
                    Contact Phone Number
                    <asp:CustomValidator ID="PhoneNumberValidator" runat="server" ErrorMessage="Invalid Phone Number!" ForeColor="red"></asp:CustomValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="cPhoneNum"></asp:TextBox>
            </div>
            <div>
                <div class="input-label">
                    Contact Email
                    <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid Email !" ForeColor="red"></asp:CustomValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="cEmail"></asp:TextBox>
            </div>
            <div>
                <div class="input-label">
                    Twitter
                </div>
                <asp:TextBox class="input" runat="server" ID="Twitter"></asp:TextBox>
            </div>
            <div>
                <div class="inline-block">
                    <button runat="server" class="button-22 button-22-success" onserverclick="AddArtist_OnClick">
                        <i class="fa-solid fa-plus"></i>&nbsp;
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
