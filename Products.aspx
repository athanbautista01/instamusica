<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="upProducts" runat="server">
        <ContentTemplate>
            <div class="men">
                <div class="container">
                    <div class="col-md-4 sidebar_men">
                        <h3>
                            Advanced Search</h3>
                        <%--                <div class="input-group">
                    <asp:TextBox ID="txtKeyword" runat="server" class="form-control" placeholder="Keyword..." />
                    <span class="input-group-btn">
                        <asp:LinkButton ID="btnSearch" runat="server" class="form-control btn btn-primary3 btn-normal btn-inline" Text="Search" OnClick="btnSearch_Click">
                        <i class="fa fa-search"></i><span class="clearfix text-center">Search</span>
                        </asp:LinkButton>
                    </span>
                </div>--%>
                        <div class="input-group" style="width: 100%">
                            <asp:TextBox ID="txtKeyword" runat="server" class="form-control text1"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnSearch" OnClick="btnSearch_Click" class="btn btn-default searchimg"
                                    runat="server"><img src="images/search-48.png" height="50px" onContextMenu="return false" /></asp:LinkButton>
                            </span>
                        </div>
                        <br />
                        <h3>
                            <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnDefault" OnClick="btnDefault_Click">Categories</asp:LinkButton>
                        </h3>
                        <h5 style="color: Gray">
                            Total Products: <span class="count">(<asp:Literal runat="server" ID="ltTotalProducts" />)</span></h5>
                        <ul class="product-categories color">
                            <li>
                                <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnDrums" OnClick="btnDrums_Click">Drums </asp:LinkButton><span
                                    class="count">(<asp:Literal runat="server" ID="ltDrums" />)</span>
                                <%-- (<asp:Literal runat="server" ID="ltDrums" />)--%>
                            </li>
                            <li>
                                <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnGuitar" OnClick="btnGuitar_Click">Guitar</asp:LinkButton><span
                                    class="count">(<asp:Literal runat="server" ID="ltGuitar" />)</span> </li>
                            <li>
                                <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnLaunchpad" OnClick="btnLaunchpad_Click">Launchpad</asp:LinkButton><span
                                    class="count">(<asp:Literal runat="server" ID="ltLaunchpad" />)</span> </li>
                            <li>
                                <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnPiano" OnClick="btnPiano_Click">Piano</asp:LinkButton><span
                                    class="count">(<asp:Literal runat="server" ID="ltPiano" />)</span> </li>
                            <li>
                                <asp:LinkButton class="cat-item cat-item-42" runat="server" ID="btnViolin" OnClick="btnViolin_Click">Violin</asp:LinkButton><span
                                    class="count">(<asp:Literal runat="server" ID="ltViolin" />)</span> </li>
                            <%--<asp:ListView ID="lvCategories" runat="server">
                        <ItemTemplate>
                            <li class="cat-item cat-item-42"><a href="Products.aspx">
                                <%# Eval("Category") %></a></li>
                        </ItemTemplate>
                    </asp:ListView>--%>
                        </ul>
                    </div>
                    <div class="col-md-8">
                        <div class="dreamcrub">
                            <ul class="breadcrumbs">
                                <li class="home"><a href="Home.aspx" title="Go to Home Page">Home</a>&nbsp; <span>&gt;</span>
                                </li>
                                <li class="home">&nbsp; Products&nbsp; </li>
                            </ul>
                            <ul class="previous">
                                <li><a href="Home.aspx">Back to Previous Page</a></li>
                            </ul>
                            <div class="clearfix">
                            </div>
                        </div>
                        <div class="mens-toolbar">
                            <div class="sort">
                                <div class="sort-by">
                                    <%--<label>
                                Sort By</label>
                            <select>
                                <option value="">Position </option>
                                <option value="">Name </option>
                                <option value="">Price </option>
                            </select>--%>
                                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0">Select Sort</asp:ListItem>
                                        <asp:ListItem Value="1">Price</asp:ListItem>
                                        <asp:ListItem Value="2">Featured</asp:ListItem>
                                        <asp:ListItem Value="3">Alphabetical</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <a data-toggle="modal" data-target="#myModal">
                            <div id="errorMessage" class="alert alert-danger text-center" visible="false" runat="server">
                                You must login first to maximize your transactions.
                            </div>
                        </a>
                        <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                            <%--<div class="cbp-vm-options">
<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid" title="grid">Grid View</a>
<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list" title="list">List View</a>
</div>--%>
                            <%--                    <div class="pages">
                        <div class="limiter visible-desktop">
                            <label>
                                Show</label>
                            <select>
                                <option value="" selected="selected">9 </option>
                                <option value="">15 </option>
                                <option value="">30 </option>
                            </select>
                            per page
                        </div>
                    </div>--%>
                            <br />
                            <br />
                            <br />
                            <div class="clearfix">
                            </div>
                            <asp:ListView ID="lvProducts" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                                ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">
                                <ItemTemplate>
                                    <div class="col-lg-4">
                                        <div class="clearfix">
                                            <a class="cbp-vm-image" href='ProductDetails.aspx?ID=<%# Eval("ProductID") %>' style="text-decoration: none;">
                                                <div class="view view-first">
                                                    <div class="inner_content clearfix">
                                                        <div class="product_image ratio form-group">
                                                            <div class="mask1">
                                                                <img src='img/products/<%# Eval("Image") %>' alt="image" class="img-responsive zoom-img"
                                                                    style='height: 300px; width: auto;'></div>
                                                            <div class="mask">
                                                                <div class="info">
                                                                    Quick View</div>
                                                            </div>
                                                            <br />
                                                            <div class="product_desc">
                                                                <h4>
                                                                    <%# Eval("Name") %></h4>
                                                                <p>
                                                                    <small>
                                                                        <%# Eval("Category") %></small></p>
                                                                <p class="color1">
                                                                    P<%# Eval("Price", "{0: #,###.00}") %></p>
                                                                <p>
                                                                    <a href='AddToCart.aspx?ID=<%# Eval("ProductID") %>&qty=1' class="btn btn-primary btn-normal btn-inline">
                                                                        <i class="fa fa-shopping-cart"></i>Add to Cart </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <tr>
                                        <td colspan="10">
                                            <h1 class="text-center">
                                                No records found.</h1>
                                        </td>
                                    </tr>
                                </EmptyDataTemplate>
                                <LayoutTemplate>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvProducts" PageSize="10">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                ShowNextPageButton="false" ButtonCssClass="btn btn-default btn-normal btn-inline"
                                                RenderNonBreakingSpacesBetweenControls="true" RenderDisabledButtonsAsLabels="false" />
                                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-success btn-normal btn-inline active"
                                                RenderNonBreakingSpacesBetweenControls="true" NumericButtonCssClass="btn btn-default btn-normal btn-inline"
                                                NextPreviousButtonCssClass="btn btn-default btn-normal btn-inline" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                                ShowPreviousPageButton="false" ButtonCssClass="btn btn-default btn-normal btn-inline"
                                                RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </LayoutTemplate>
                                <GroupTemplate>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </GroupTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <script src="js/cbpViewModeSwitch.js" type="text/javascript"></script>
                    <script src="js/classie.js" type="text/javascript"></script>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
