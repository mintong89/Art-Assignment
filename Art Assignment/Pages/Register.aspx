<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Art_Assignment.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Home.css")%>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="flex items-center justify-center home-container">
        <div class="register-box-cont p-5 w-96 h-96 text-sm">
            <div class="text-base pb-3">Register</div>
            <div>
                <div>
                    Email&nbsp;
                    <asp:CustomValidator ValidateEmptyText="True" ID="CustomValidator1" runat="server" ErrorMessage="(Email had been previously registered !)" ControlToValidate="txtEmail" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="txtEmail"></asp:TextBox>
            </div>
            <div>
                <div>Password</div>
                <asp:TextBox class="input" runat="server" ID="txtPassword" type="password"></asp:TextBox>
            </div>
            <div>
                <div>
                    Confirm Password&nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red">(Password do not match!)</asp:CompareValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="txtConfirmPassword" type="password"></asp:TextBox>
            </div>
            <div class="flex justify-center pt-3">
                <asp:Button class="button-22" runat="server" ID="btnRegister" Text="Register" />
            </div>
            <div class="text-center">
                <a href="Login.aspx" style="text-decoration: underline; color: darkcyan">Already have an account?</a>
            </div>
        </div>
    </div>
</asp:Content>
