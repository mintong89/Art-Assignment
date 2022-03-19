<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="Security.aspx.cs" Inherits="Art_Assignment.Pages.Profile.Security" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Security
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="border border-black py-2 px-4">
        <h4 class="text-xl font-bold">Changing Password</h4>
        <form runat="server">
            <%--            <div class="my-2">
                <h5>Current Password</h5>
                <asp:TextBox CssClass="px-4 py-2 border border-black w-full outline-none" TextMode="Password" ID="CurrentPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Please enter your password!" />
            </div>--%>
            <div class="my-2">
                <h5>New Password</h5>
                <asp:TextBox CssClass="px-4 py-2 border border-black w-full outline-none" TextMode="Password" ID="NewPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server" ControlToValidate="NewPassword" ErrorMessage="Please enter your password!" />
            </div>
            <div class="my-2">
                <h5>Confirmation New Password</h5>
                <asp:TextBox CssClass="px-4 py-2 border border-black w-full outline-none" TextMode="Password" ID="ConfirmationPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="block text-red-600 text-xs" runat="server" ControlToValidate="ConfirmationPassword" ErrorMessage="Please enter your password!" />
            </div>
            <div class="flex items-center my-2 mt-4">
                <asp:Button OnClick="Submit_Password" CssClass="btn cursor-pointer" ID="ChangePasswordButton" runat="server" Text="Submit" UseSubmitBehavior="False" CausesValidation="False" />
                <asp:Label Visible="false" CssClass="text-red-600 text-xs ml-4" ID="ErrorMessage" runat="server" Text=""></asp:Label>
            </div>
        </form>
    </div>
</asp:Content>
