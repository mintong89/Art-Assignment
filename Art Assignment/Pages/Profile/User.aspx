<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Art_Assignment.Pages.Profile.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <div>
            Profile Completion Rate
        </div>
        <div>
            Progress Bar: 90%
        </div>
        <div class="flex justify-center">
            <div class="rounded-full overflow-hidden h-32 w-32">
                <img alt="profile_pic" src="https://upload.wikimedia.org/wikipedia/commons/e/ec/RandomBitmap.png" />
            </div>
        </div>
        <div class="grid grid-cols-2">
            <div class="field-cont">
                <div class="field-label">
                    Username
                </div>
                <div class="filed-text">
                    <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <div class="field-cont">
                <div class="field-label">Email</div>
                <div>
                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <div class="field-cont">
                <div class="field-label">First Name</div>
                <div>
                    <asp:Label ID="lblFirstName" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="field-cont">
                <div class="field-label">Last Name</div>
                <div>
                    <asp:Label ID="lblLastName" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="field-cont">
                <div class="field-label">Date of Birth</div>
                <div>
                    <asp:Label ID="lblDateOfBirth" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
