<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.AddStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Add Stock
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <%--<h1 class="text-xl font-bold">Add Stock</h1>--%>
    <div class="flex justify-center">
            <div class="upload-image-cont" style="border-radius:0px;">
                <img runat="server" ClientIDMode="Static" ID="displayImage" style="width:100%; height:100%" alt="artProduct-Preview" src="~/resources/Blank_Art.jpg" />
                <div class="upload-image-hover-overlay" style="border-radius:0px;">
                    Click to Upload
                </div>  
            </div>
        </div>
    <input type="file" id="imageInput" class="hidden" runat="server" clientidmode="Static" />
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
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtArtPrice" ErrorMessage="Value must be a number"  ForeColor="Red"/>
            <asp:CompareValidator runat="server" Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer" ControlToValidate="txtArtPrice" ErrorMessage="Value must be greater or equal to 0" ForeColor="Red"/>

        </div>
        <asp:TextBox class="input" runat="server" ID="txtArtPrice" OnTextChanged="txtArtPrice_TextChanged"></asp:TextBox>
    </div>
    <div>
        <div class="inline-block mt-2">
            <button runat="server" class="button-22 button-22-success" onserverclick="AddArtProd_OnClick">
                <i class="fa-solid fa-plus"></i>&nbsp;
                        Add</button>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="<%= Page.ResolveUrl("~/js/UploadImage.js") %>"></script>
</asp:Content>
