<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Art_Assignment.Pages.Artist.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="display: grid; grid-template-columns: 300px 1fr; gap: 20px; margin: 20px; grid-template-rows: 300px 1fr;">
        <div style="padding: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s;">
            <img>
            <div>
                Shiji
       
            </div>
            <div>
                Im an artist :3
       
            </div>
            <div>
                email:
           
                <br>
                phone:
           
                <br>
                twitter:
           
                <br>
                pixiv: 
       
            </div>
        </div>
        <div style="padding: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s; grid-row-start: 1; grid-row-end: 3; grid-column-start: 2;">
            <div style="display: flex; flex-direction: row; column-gap: 10px;">
                <div style="padding: .5rem; border-radius: 10px; background-color: #b3e5fc; cursor: pointer; font-weight: bold;">
                    <i class="fa-solid fa-scale-balanced"></i>&nbsp;On sales    
   
                </div>
                <div style="padding: .5rem; border-radius: 10px; color: #a3b5dc; cursor: pointer; font-weight: bold;">
                    <i class="fa-solid fa-comment"></i>&nbsp;Comments
   
                </div>
            </div>
            <div>
                Item 1<br>
                Item 2<br>
                Item 3Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                Item
                <br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
