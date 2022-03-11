<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="Art_Assignment.Pages.Profile.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    My Artist Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <%--<table>
        <thead>
            <tr>
                <td>Actions</td>
                <td>No.</td>
                <td>Picture</td>
                <td>Name</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    Edit | Delete
                </td>
                <td>
                    1.
                </td>
                <td>
                    Picture
                </td>
                <td>
                    Artist Name 1
                </td>
            </tr>
        </tbody>
    </table>--%>
    <form runat="server">
        <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ArtistDataSource" AllowPaging="true" AllowSorting="true" PageSize="5">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="BioDesc" HeaderText="BioDesc" SortExpression="BioDesc" />
                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                <asp:BoundField DataField="ArtistProfilePicture" HeaderText="ArtistProfilePicture" SortExpression="ArtistProfilePicture" />
            </Columns>
            <PagerStyle HorizontalAlign = "Right" CssClass = "GridPager" />
        </asp:GridView>
        <asp:SqlDataSource ID="ArtistDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" SelectCommand="SELECT [Name], [BioDesc], [Rating], [ArtistProfilePicture] FROM [Artist]"></asp:SqlDataSource>
    </form>
</asp:Content>
