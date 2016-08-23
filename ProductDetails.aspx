<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="men">
        <div class="container">
            <div class="col-md-9 single_top">
                <div class="single_left">
                    <div class="labout span_1_of_a1">
                        <ul id="etalage">
                            <li>
                                <asp:Image ID="imgProduct" runat="server" class="etalage_thumb_image img-responsive" />
                                <asp:Image ID="imgProductZoom" runat="server" class="etalage_source_image img-responsive"
                                    title="" />
                            </li>
                        </ul>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="cont1 span_2_of_a1">
                        <h1>
                            <asp:Literal ID="ltName" runat="server" />
                            (<asp:Literal ID="ltCode" runat="server" />)</h1>
                        <p class="availability">
                            Category: <span class="color">
                                <asp:Literal ID="ltCategory" runat="server" /></span>
                        </p>
                        <div class="price_single">
                            <%--<span class="reducedfrom">$140.00</span>--%>
                            <span class="actual">$<asp:Literal ID="ltPrice" runat="server" /></span>
                        </div>
                        <%--<h2 class="quick">
                            Quick Overview:</h2>
                        <p class="quick_desc">
                            <asp:Literal ID="ltQuickDesc" runat="server" /></p>--%>
                        <div class="wish-list">
                            <div class="input-group col-lg-5">
                                <asp:TextBox ID="txtQty" runat="server" min="1" max="50" Text="1" CssClass="form-control"
                                    type="number" />
                                <span class="input-group-btn">
                                    <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-success form-control" OnClick="btnAdd_Click">
<i class="fa fa-shopping-cart"></i> Add to Cart
                                    </asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <%--				<ul class="size">
<h3>Length</h3>
<li><a href="#">32</a></li>
<li><a href="#">34</a></li>
</ul>--%>
                        <div class="quantity_box">
                            <%--<ul class="product-qty">
<span>Quantity:</span>
<select>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
</select>
</ul>--%>
                            <a href="Home.aspx">
                                <div id="errorMessage" class="alert alert-danger text-center" visible="false" runat="server">
                                    You must login first to do this action.
                                </div>
                            </a>
                            <ul class="single_social">
                                <li><a href="#"><i class="fb1"></i></a></li>
                                <li><a href="#"><i class="tw1"></i></a></li>
                                <li><a href="#"><i class="g1"></i></a></li>
                                <li><a href="#"><i class="linked"></i></a></li>
                            </ul>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <ul class="resp-tabs-list">
                            <br />
                            <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Product Description</span></li>
                            <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Reviews</span></li>
                            <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Add Review</span></li>
                            <div class="clear">
                            </div>
                        </ul>
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                <div class="facts">
                                    <ul class="tab_list">
                                        <li><a href="#">
                                            <asp:Literal ID="ltDesc" runat="server" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                                <div class="facts">
                                    <br />
                                    <%--  <table class="table table-hover">
                                        <thead>
                                            <th>Review</th>
                                            <th>Rating</th>
                                            <th>Date</th>
                                            <th>ID</th>
                                        </thead>
                                        <tbody>


                                        </tbody>
                                    </table>--%>
                                    <ul class="tab_list">
                                        <asp:ListView ID="lvReview" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <div class="col-lg-6">
                                                        <asp:Literal runat="server" Visible="false" ID="ltProductID" Text='<%#Eval("ProductID") %>' />
                                                        <p>
                                                            <h4>
                                                                Review:
                                                                <%#Eval("Review") %>
                                                            </h4>
                                                        </p>
                                                        <p>
                                                            <i class="fa fa-clock-o"></i>
                                                            <abbr class="timeago pull-left">
                                                                Date Created:
                                                                <%#Eval("DateReviewed","{0: MMMM dd, yyyy}") %></abbr><br />
                                                        </p>
                                                        <br />
                                                        <br />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <p>
                                                            <h3>
                                                                Rating:
                                                                <%#Eval("Rating") %>
                                                                <br />
                                                                [UserID:
                                                                <%#Eval("UserID") %>]
                                                            </h3>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <tr>
                                                    <td colspan="10">
                                                        <h1 class="text-center">
                                                            No reviews found.</h1>
                                                    </td>
                                                </tr>
                                            </EmptyDataTemplate>
                                        </asp:ListView>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                                <div class="facts">
                                    <br />
                                    <%--<asp:ListView ID="lvProductID" runat="server" OnItemCommand="lvProductID_ItemCommand" >
                                        <ItemTemplate> --%>
                                    <ul class="tab_list">
                                        <div id="main_guestForm">
                                            <%--   <asp:Literal runat="server" Visible="false" ID="ltProductID" Text='<%#Eval("ProductID") %>' />--%>
                                            <div class="input-group" style="width: 100%">
                                                <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="txtReview"
                                                    placeholder="Add a review..." required />
                                                <br />
                                                <center>
                                                    <span class="input-group">
                                                        <asp:DropDownList ID="ddlRating" class="dropdown" Height="43px" runat="server" required>
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:LinkButton ID="btnAddReview" runat="server" class="btn btn-primary3" Text="Add Review"
                                                            OnClick="btnAddReview_Click" />
                                                    </span>
                                                </center>
                                                <a href="Home.aspx">
                                                    <div id="errorReview" class="alert alert-danger text-center" visible="false" runat="server">
                                                        You must login first to do this action.
                                                    </div>
                                                </a>
                                            </div>
                                            <%-- <br />
                                            <h3 class="text-center">You must
                                <a id="main_btnLogin" href="javascript:__doPostBack(&#39;ctl00$main$btnLogin&#39;,&#39;&#39;)">log in</a>
                                                first before submitting a review.</h3>--%>
                                        </div>
                                    </ul>
                                </div>
                                <%-- </ItemTemplate>
                                                 </asp:ListView>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h3 class="m_1">
                    Related Products</h3>
                <div class="product">
                    <asp:ListView ID="lvRelated" runat="server">
                        <ItemTemplate>
                            <a href='ProductDetails.aspx?ID=<%# Eval("ProductID") %>' style="text-decoration: none;">
                                <div class="well form-group">
                                    <div class="product_img">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" />
                                    </div>
                                    <div class="product_desc">
                                        <h4>
                                            <%# Eval("Name") %>
                                        </h4>
                                        <p class="single_price">
                                            $<%# Eval("Price", "{0: #,###.00}") %>
                                        </p>
                                        <p>
                                            <a href='AddToCart.aspx?ID=<%# Eval("ProductID") %>&qty=1' class="btn btn-primary btn-normal btn-inline">
                                                <i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
