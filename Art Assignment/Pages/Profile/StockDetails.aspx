<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="StockDetails.aspx.cs" Inherits="Art_Assignment.Pages.Profile.StockDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Stock Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">


    <asp:HyperLink ID="StockAdd" runat="server" NavigateUrl="~/Pages/Profile/StockAdd.aspx">
            <div class="button-22 w-1/6  float-right">Add Stock</div></asp:HyperLink>
    <br />
   

    <div class="grid grid-cols-5 mt-9">
        <div>No.</div>
        <div>Name</div>
        <div>Stock</div>
        <div>Unit Price</div>
        <div>Action</div>
    </div>



</asp:Content>
