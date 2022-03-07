<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Art_Assignment.Pages.Profile.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="grid gap-y-3">
        <h1 class="text-xl font-bold">Edit Profile
        </h1>
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
                <a href="EditUser.aspx" class="button-22">
                    <i class="fa-solid fa-pen-to-square"></i>&nbsp;
                Submit
                </a>
            </div>
            <div class="inline-block">
                <a href="EditUser.aspx" class="button-22 button-22-danger">
                    <i class="fa-solid fa-pen-to-square"></i>&nbsp;
                Cancel
                </a>
            </div>
        </div>
    </div>
</asp:Content>
