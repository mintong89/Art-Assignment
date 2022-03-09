<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Art_Assignment.Pages.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Art Gallery Display System</title>
    <link rel="stylesheet" type="text/css" href="<%= Page.ResolveUrl("~/css/Gallery.css")%>" />
    <script src="<%= Page.ResolveUrl("~/js/Gallery.js") %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form class="relative flex flex-1 items-start" runat="server">
        <div class="px-20 py-14 w-full">
            <div class="flex mb-4">
                <div class="product--image flex-1 mr-12">
                    <img class="w-full max-w-full max-h-full" src="https://via.placeholder.com/4000x3000.png?text=test" />
                </div>
                <div class="flex-1">
                    <div class="product--summary">
                        <h3 class="text-3xl drop-shadow-xl">Item Name</h3>
                        <h4 class="text-lg">By Artist Name</h4>
                        <div class="flex justify-between items-center mt-8">
                            <h3 class="text-3xl drop-shadow-xl">RM 79.99</h3>
                            <button class="btn text-lg">Add to Cart</button>
                        </div>
                    </div>
                    <div class="w-full h-px bg-black my-8"></div>
                    <div class="product--description">
                        <h4 class="text-2xl drop-shadow-xl mb-2">Description</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                             Nulla interdum purus ut libero venenatis ornare. Cras a 
                             risus aliquam, pellentesque mauris eu, bibendum mi. Nulla 
                             at turpis mi. Nam sed orci ac lectus sollicitudin 
                             interdum. Mauris pulvinar metus ante, vitae volutpat 
                             felis tincidunt sed. Ut pellentesque pellentesque 
                             laoreet. Cras eu diam ullamcorper, sagittis lectus id, 
                             luctus neque. Suspendisse semper metus id leo mollis, sit 
                             amet cursus eros malesuada. Ut iaculis metus sed mi 
                             molestie rhoncus. In eleifend non erat ornare suscipit. 
                             Nam vel mi vel felis condimentum dictum. Praesent eros 
                             sapien, vehicula et vulputate sed, placerat eu sapien. In 
                             nec.
                        </p>
                    </div>
                </div>
            </div>
            <%--            <div class="product--specification">
            </div>--%>
            <div class="product--comments">
                <h4 class="text-2xl drop-shadow-xl mb-2">Comments (100)</h4>
                <ul class="w-[60vw]">
                    <li class="flex mb-4">
                        <div class="min-w-[3rem] w-12 min-h-[3rem] h-12 mr-2">
                            <img class="w-full max-w-full max-h-full" src="https://via.placeholder.com/48x48.png?text=test" />
                        </div>
                        <div>
                            <p class="text-sm leading-none mb-1">Name 1</p>
                            <div class="flex">
                                <span class="star is-fill"></span>
                                <span class="star is-fill"></span>
                                <span class="star is-fill"></span>
                                <span class="star is-fill"></span>
                                <span class="star"></span>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Nulla interdum purus ut libero venenatis ornare. Cras a 
                                risus aliquam, pellentesque mauris eu, bibendum mi.
                            </p>
                        </div>
                    </li>
                    <li class="flex mb-4">
                        <div class="min-w-[3rem] w-12 min-h-[3rem] h-12 mr-2">
                            <img class="w-full max-w-full max-h-full" src="https://via.placeholder.com/48x48.png?text=test" />
                        </div>
                        <div>
                            <p class="text-sm leading-none mb-1">Name 2</p>
                            <div class="flex">
                                <span class="star is-fill"></span>
                                <span class="star is-fill"></span>
                                <span class="star is-fill"></span>
                                <span class="star"></span>
                                <span class="star"></span>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                Nulla interdum purus ut libero venenatis ornare. Cras a 
                                risus aliquam, pellentesque mauris eu, bibendum mi.
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</asp:Content>
