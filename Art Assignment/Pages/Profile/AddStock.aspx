<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.AddStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Add Stock
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <h1 class="text-xl font-bold">Add Stock</h1>
    <form id="Form1" method="post" runat="server" enctype="multipart/form-data" autocomplete="off">
        <div class="flex justify-center">
            <div class="user-profile-upload-image-cont">
                <img runat="server" clientidmode="Static" id="userProfileImg" style="width: 100%; height: 100%" alt="profile-pic-preview" src="~/resources/Blank_Art.jpg" />
                <div class="user-profile-upload-image-hover-overlay">
                    Click to Upload
                </div>
            </div>
        </div>
        <input type="file" id="profilePicInput" class="hidden" runat="server" clientidmode="Static" />
        <div>
            <div class="input-label">
                Art Name<span style="color: red">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtName" ForeColor="Red">Art Name Is Required.</asp:RequiredFieldValidator>
            </div>
            <asp:TextBox class="input" runat="server" ID="txtArtName"></asp:TextBox>
        </div>

        <div>
            <div class="input-label">
                Art Description
            </div>
            <asp:TextBox class="input" runat="server" ID="txtArtDescription"></asp:TextBox>
        </div>
        <div>
            <div class="input-label">
                Price
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtPrice" ForeColor="Red">Price Is Required.</asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtArtPrice" ErrorMessage="Value must be a number" />
            </div>
            <asp:TextBox class="input" runat="server" ID="txtArtPrice"></asp:TextBox>
        </div>
        <div>
            <div class="inline-block">
                <button runat="server" class="button-22 button-22-success" onserverclick="AddArtProd_OnClick">
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
