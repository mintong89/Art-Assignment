<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="Art_Assignment.Pages.Profile.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    My Artist Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="grid grid-cols-3 gap-2.5">
            <asp:Repeater ID="ArtistProfileRepeater" runat="server" DataSourceID="ArtistDataSource">
                <ItemTemplate>
                    <a runat="server" href='<%# Eval("Url") %>'>
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
                    </a>
                </ItemTemplate>
                <FooterTemplate>
                    <a href="AddArtistProfile.aspx">
                        <div class="artist-profile-card-cont flex justify-center items-center text-green-900 flex-col">
                            <i class="fa-solid fa-circle-plus fa-2xl"></i>
                            <br />
                            Add Artist Profile...
                        </div>
                    </a>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <asp:SqlDataSource ID="ArtistDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" SelectCommand="SELECT
  concat('~/Pages/Artist/View.aspx?ID=', [ID]) as Url,
  [Name],
  [BioDesc],
  [Rating],
  case when [ArtistProfilePicture] IS NULL THEN
    '~/resources/profile-pic-blank-sq.png'
    else concat('~/upload/', ArtistProfilePicture)
  end AS Image
FROM
  [Artist]
WHERE
  UserID = @UserID">
            <SelectParameters>
                <asp:Parameter DefaultValue="-1" Name="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

