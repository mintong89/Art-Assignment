<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.AddStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Add Stock
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <h1 class="text-xl font-bold">Add Stock</h1>
    <form id="Form1" method="post" runat="server" enctype="multipart/form-data" action="StockDetails.aspx">
        <div class="grid gap-y-3">
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
