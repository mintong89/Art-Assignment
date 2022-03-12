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
        <div class="grid grid-cols-3 gap-2.5">
            <asp:Repeater ID="ArtistProfileRepeater" runat="server" DataSourceID="ArtistDataSource">
                <ItemTemplate>
                    <div class="artist-profile-card-cont">
                        <div class="flex justify-center">
                            <img style="width: 100%; height: 100%" runat="server" id="profIcon" src='<%# Bind("Image") %>' alt="gay" />
                        </div>
                        <div class="artist-profile-card-name">
                            <%# Eval("Name") %>
                        </div>
                        <div class="artist-profile-card-biodesc">
                            <%# Eval("BioDesc") %>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <a href="AddArtistProfile.aspx">
                        <div class="artist-profile-card-cont flex justify-center items-center text-green-900">
                            <i class="fa-solid fa-circle-plus fa-2xl"></i>
                        </div>
                    </a>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <asp:SqlDataSource ID="ArtistDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" SelectCommand="SELECT
  [Name],
  [BioDesc],
  [Rating],
  case when [ArtistProfilePicture] IS NULL THEN
    '~/resources/profile-pic-blank-sq.png'
    else concat('~/upload/', ArtistProfilePicture)
  end AS Image
FROM
  [Artist]"></asp:SqlDataSource>
    </form>
</asp:Content>

