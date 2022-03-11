<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Art_Assignment.Pages.Profile.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div style="row-gap: 10px;">
            <div>
                Profile Completion Rate
            </div>
            <div>
                Progress Bar: 90%
            </div>
            <div class="flex justify-center">
                <div class="rounded-full overflow-hidden h-32 w-32">
                    <img alt="profile_pic" src="https://upload.wikimedia.org/wikipedia/commons/e/ec/RandomBitmap.png" />
                </div>
            </div>
            <div class="inline-block">
                <a href="EditUser.aspx" class="button-22">
                    <i class="fa-solid fa-pen-to-square"></i>&nbsp;
                Edit Profile
                </a>
            </div>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="UserDataSource" RenderOuterTable="false">
                <itemtemplate>
                    <div class="grid grid-cols-2">
                        <div class="field-cont">
                            <div class="field-label">
                                Username
                            </div>
                            <div class="filed-text">
                                <%# Eval("Name") %>
                            </div>
                        </div>

                        <div class="field-cont">
                            <div class="field-label">Email</div>
                            <div>
                                <%# Eval("Email") %>
                            </div>
                        </div>

                        <div class="field-cont">
                            <div class="field-label">First Name</div>
                            <div>
                                <%# Eval("FirstName") %>
                            </div>
                        </div>
                        <div class="field-cont">
                            <div class="field-label">Last Name</div>
                            <div>
                                <%# Eval("LastName") %>
                            </div>
                        </div>
                        <div class="field-cont">
                            <div class="field-label">Date of Birth</div>
                            <div>
                                <%# Eval("DateBirth") %>
                            </div>
                        </div>
                    </div>
                </itemtemplate>
            </asp:FormView>
            <asp:SqlDataSource
                ID="UserDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ArtDBContext %>">
                <selectparameters>
                    <asp:Parameter DefaultValue="-1" Name="ID" Type="Int32" />
                </selectparameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
