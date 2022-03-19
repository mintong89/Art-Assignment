<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Art_Assignment.Pages.Artist.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal runat="server" ID="ArtistPageTitle">Artist</asp:Literal></title>
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/css/Artist.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="artist-meta-cont">
            <div class="artist-profile-card-cont div-card">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="ArtistDataSource" RenderOuterTable="false" OnItemUpdating="FormView1_ItemUpdating" OnItemCreated="FormView1_ItemCreated">
                    <ItemTemplate>
                        <div class="grid gap-y-3 justify-items-center">
                            <div class="flex justify-center relative w-full">
                                <div class="absolute right-0">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CssClass="button-22 hidden"
                                        CommandName="Edit" Text="Edit" />
                                </div>
                                <div class="rounded-full w-20 h-20 overflow-hidden">
                                    <img runat="server" id="artistPic" class="w-full h-full" alt="profilePic" src='<%# Bind("ArtistImage") %>' />
                                </div>
                            </div>
                            <div class="font-bold text-lg">
                                <%# Eval("Name") %>
                            </div>
                            <div class="text-sm limit-lines-3">
                                <%# Eval("BioDesc") == DBNull.Value ? "" :((string) Eval("BioDesc")).Replace("\n", "<br />") %>
                            </div>
                            <div class="grid grid-cols-[auto_1fr] gap-x-3">
                                <div class="flex items-center" style="display: <%# Eval("ContactEmail")!=DBNull.Value && Eval("ContactEmail")!= "" ? "block" : "none" %>"><i class="fa-solid fa-envelope"></i></div>
                                <div style="display: <%# Eval("ContactEmail")!=DBNull.Value && Eval("ContactEmail")!= "" ? "block" : "none" %>"><%# Eval("ContactEmail") %></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value && Eval("ContactPhone")!= "" ? "block" : "none" %>" class="flex items-center"><i class="fa-solid fa-phone"></i></div>
                                <div style="display: <%# Eval("ContactPhone")!=DBNull.Value && Eval("ContactPhone")!= "" ? "block" : "none" %>"><%# Eval("ContactPhone") %></div>
                                <div class="flex items-center" style="display: <%# Eval("ContactTwitter")!=DBNull.Value && Eval("ContactTwitter")!= "" ? "block" : "none" %>"><i class="fa-brands fa-twitter"></i></div>
                                <div style="display: <%# Eval("ContactTwitter")!=DBNull.Value && Eval("ContactTwitter")!= "" ? "block" : "none" %>"><%# Eval("ContactTwitter") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="artist-edit-profile-bg-cont">
                            <div class="div-card w-96 bg-white p-3 grid gap-y-3" onmousedown="event.stopPropagation()">
                                <div class="flex justify-center">
                                    <div class="artist-upload-image-cont">
                                        <img runat="server" clientidmode="Static" id="edit_image_preview" style="width: 100%; height: 100%" alt="profile-pic-preview" src='<%# Eval("ArtistImage") %>' />
                                        <div class="artist-upload-image-hover-overlay">
                                            Click to Upload
                                        </div>
                                    </div>
                                </div>
                                <input type="file" id="profilePicInput" class="hidden" runat="server" clientidmode="Static" />
                                <div>
                                    <div class="input-label">
                                        Artist Display Name<span style="color: red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtistDisplayName" ForeColor="Red">Display Name is required.</asp:RequiredFieldValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="txtArtistDisplayName" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Biography
                                    </div>
                                    <asp:TextBox class="input" runat="server" ClientIDMode="Static" ID="txtBiography" TextMode="MultiLine" Text='<%# Bind("BioDesc") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Contact Phone Number
                                        <asp:CustomValidator ID="PhoneNumberValidator" runat="server" ErrorMessage="Invalid Phone Number!" ForeColor="red"></asp:CustomValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="cPhoneNum" Text='<%# Bind("ContactPhone") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Contact Email
                                        <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid Email !" ForeColor="red"></asp:CustomValidator>
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="cEmail" Text='<%# Bind("ContactEmail") %>'></asp:TextBox>
                                </div>
                                <div>
                                    <div class="input-label">
                                        Twitter
                                    </div>
                                    <asp:TextBox class="input" runat="server" ID="Twitter" Text='<%# Bind("ContactTwitter") %>'></asp:TextBox>
                                </div>
                                <div class="flex justify-center">
                                    <asp:LinkButton ID="btnArtistProfileUpdate" runat="server" CausesValidation="True" ClientIDMode="Static"
                                        CommandName="Update" Text="Update" CssClass="button-22 button-22-success" />
                                </div>
                                <div class="flex justify-center">
                                    <asp:LinkButton ID="btnArtistProfileUpdateCancel" runat="server" CssClass="button-22 button-22-danger" ClientIDMode="Static"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="ArtistDataSource" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" runat="server">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="ID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter DefaultValue="-1" Name="ArtistID" Type="Int32" />
                        <asp:Parameter DefaultValue="-1" Name="UserID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="artist-main-cont div-card">
                <div class="artist-nav-menu-cont">
                    <div class="item-active">
                        <i class="fa-solid fa-scale-balanced"></i>&nbsp;On sales    
   
                    </div>
                    <div class="item-idle">
                        <i class="fa-solid fa-comment"></i>&nbsp;Comments
                        <asp:LinkButton runat="server" ID="delIfSeen"></asp:LinkButton>
                    </div>
                </div>
                <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                    ItemPlaceholderID="itemPlaceHolder1" DataSourceID="ArtProdDataSource">
                    <LayoutTemplate>
                        <div class="p-3" style="display: grid; grid-template-columns: repeat(4, minmax(0, 1fr));">
                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                        </div>
                        <div class="flex justify-center">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" FirstPageText='<i style="color: blue" class="fa-solid fa-angles-left fa-lg"></i>' PreviousPageText='<i style="color: blue" class="fa-solid fa-angle-left fa-lg"></i>' />
                                    <%--<asp:NumericPagerField ButtonType="Link" />--%>
                                    <asp:TemplatePagerField>
                                        <PagerTemplate>
                                            <div style="display: inline">
                                                Page
                                <asp:Label runat="server" ID="labelCurrentPage" Text="<%# Container.TotalRowCount > 0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
                                                of
                                <asp:Label runat="server" ID="labelTotalPages" Text="<%#  Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
                                            </div>
                                            &nbsp;
                                        </PagerTemplate>
                                    </asp:TemplatePagerField>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" NextPageText='<i style="color: blue" class="fa-solid fa-angle-right fa-lg"></i>' LastPageText='<i style="color: blue" class="fa-solid fa-angles-right fa-lg"></i>' />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </GroupTemplate>
                    <ItemTemplate>
                        <a runat="server" href='<%# Eval("ID", "~/Pages/Product.aspx?ID={0}") %>'>
                            <div style="display: grid; width: 11rem;" class="p-3 div-card">
                                <div style="width: 100%; height: 100%">
                                    <img id="ArtPicture" alt="pic" runat="server" src='<%# Eval("ArtPictureAbs") %>' />
                                </div>
                                <div class="text"><%# Eval("Name") %></div>
                                <div class="text-gray-600"><%# Eval("ArtistName") %></div>
                                <div class="font-bold">RM <%# Eval("Price") %></div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" ID="ArtProdDataSource" runat="server">
                    <SelectParameters>
                        <asp:Parameter DbType="Int32" DefaultValue="-1" Name="ArtistOwner" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="<%=Page.ResolveUrl("~/js/Artist.js") %>"></script>
</asp:Content>
