<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Art_Assignment.Pages.Payment" %>

<%@ Register TagPrefix="pce" TagName="Menu" Src="~/UserControls/PriceMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <script>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="flex flex-col-reverse lg:flex-row justify-between px-10 py-4">
        <div class="flex-1 px-4">
            <h2 class="text-center text-2xl font-bold">Enter your payment details</h2>
            <div class="flex flex-col items-center mx-auto w-[400px] space-y-4 py-8">
                <div class="flex w-full space-x-2">
                    <asp:TextBox onkeypress="return isNumberKey(event)" MaxLength="16" placeholder="Card Number" CssClass="border border-black outline-none px-3 py-1.5 flex-1" ID="CardNumber" runat="server"></asp:TextBox>
                    <asp:TextBox onkeypress="return isNumberKey(event)" MaxLength="3" placeholder="CVC" CssClass="border border-black outline-none px-3 py-1.5 w-14" ID="CVC" runat="server"></asp:TextBox>
                </div>
                <asp:TextBox placeholder="Full Name" CssClass="border border-black outline-none w-full px-3 py-1.5" ID="FullName" runat="server"></asp:TextBox>
                <div class="w-full flex justify-end">
                    <asp:Button OnClick="Checkout_Action" CssClass="btn text-md cursor-pointer" ID="SubmitButton" runat="server" Text="Submit" />
                </div>
            </div>
            <div class="w-[400px] mx-auto">
                <asp:RequiredFieldValidator CssClass="block w-full text-red-600 text-xs text-left" runat="server"
                    ControlToValidate="CardNumber" ErrorMessage="Please enter your card number!" />
                <asp:RequiredFieldValidator CssClass="block w-full text-red-600 text-xs text-left" runat="server"
                    ControlToValidate="CVC" ErrorMessage="Please enter your cvc!" />
                <asp:RequiredFieldValidator CssClass="block w-full text-red-600 text-xs text-left" runat="server"
                    ControlToValidate="FullName" ErrorMessage="Please enter your full name!" />
            </div>
        </div>
        <div class="mx-auto mb-4">
            <pce:Menu runat="server" />
        </div>
    </div>
</asp:Content>
