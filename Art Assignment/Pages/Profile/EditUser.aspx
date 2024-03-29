﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Art_Assignment.Pages.Profile.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="grid gap-y-3">
        <h1 class="text-xl font-bold">Edit Profile
        </h1>
        <div class="flex justify-center">
            <div class="upload-image-cont">
                <img runat="server" ClientIDMode="Static" ID="displayImage" style="width:100%; height:100%" alt="profile-pic-preview" src="~/resources/profile-pic-blank.png" />
                <div class="upload-image-hover-overlay">
                    Click to Upload
                </div>  
            </div>
        </div>
        <input type="file" id="imageInput" class="hidden" runat="server" ClientIDMode="Static" />

        <div>
            <div class="input-label">
                Username
            </div>
            <asp:TextBox class="input" runat="server" ID="txtUsername"></asp:TextBox>
        </div>
        <div>
            <div class="input-label">
                First Name
            </div>
            <asp:TextBox class="input" runat="server" ID="txtFirstName"></asp:TextBox>
        </div>
        <div>
            <div class="input-label">
                Last Name
            </div>
            <asp:TextBox class="input" runat="server" ID="txtLastName"></asp:TextBox>
        </div>
        <div>
            <div class="input-label">
                Date of Birth
            </div>
            <asp:TextBox class="input" runat="server" ID="txtDateOfBirth" TextMode="Date"></asp:TextBox>
        </div>
        <div>
            <div class="inline-block">
                <button runat="server" class="button-22" onserverclick="btnSubmit_OnClick">
                    <i class="fa-solid fa-pen-to-square"></i>&nbsp;
            Submit
                </button>
            </div>
            <div class="inline-block">
                <a href="User.aspx" class="button-22 button-22-danger">
                    <i class="fa-solid fa-xmark"></i>&nbsp;
            Cancel
                </a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="<%= Page.ResolveUrl("~/js/UploadImage.js") %>"></script>
</asp:Content>