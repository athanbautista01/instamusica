<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="H" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="container1">
            <div class="container">
                <div class="top_grid" id="arrow">
                    <div class="content_top">
                        <div class="col-md-8 col1">
                            <asp:ListView ID="lvDrum1" runat="server">
                                <ItemTemplate>
                                    <a href="ProductDetails.aspx?ID=63" class="b-link-stroke b-animate-go  thickbox">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" style='height: 645px;'
                                            alt="" />
                                        <div class="b-wrapper2">
                                            <h2 class="b-animate b-from-left    b-delay03 ">
                                                <%# Eval("Name") %></h2>
                                            <p class="b-animate b-from-right    b-delay03 ">
                                                P<%# Eval("Price", "{0: #,###.00}") %></p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="col-md-4">
                            <asp:ListView ID="lvLaunch1" runat="server">
                                <ItemTemplate>
                                    <a href="ProductDetails.aspx?ID=18" class="b-link-stroke b-animate-go  thickbox">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" alt="" />
                                        <div class="b-wrapper1">
                                            <h2 class="b-animate b-from-left    b-delay03 ">
                                                <%# Eval("Name") %></h2>
                                            <p class="single_price b-animate b-from-right    b-delay03 ">
                                                P<%# Eval("Price", "{0: #,###.00}") %></p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:ListView>
                            <div class="grid1">
                                <asp:ListView ID="lvTwinNeck" runat="server">
                                    <ItemTemplate>
                                        <a href="ProductDetails.aspx?ID=55" class="b-link-stroke b-animate-go  thickbox">
                                            <img src='img/products/<%# Eval("Image") %>' class="img-responsive" alt="" />
                                            <div class="b-wrapper1">
                                                <h2 class="b-animate b-from-left    b-delay03 ">
                                                    <%# Eval("Name") %></h2>
                                                <p class="single_price b-animate b-from-right    b-delay03 ">
                                                    P<%# Eval("Price", "{0: #,###.00}") %></p>
                                            </div>
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="content_middle">
                        <div class="col-md-4 col2">
                            <asp:ListView ID="lvKlotz" runat="server">
                                <ItemTemplate>
                                    <a href="ProductDetails.aspx?ID=1" class="b-link-stroke b-animate-go  thickbox">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" alt="" />
                                        <div class="b-wrapper1">
                                            <h2 class="b-animate b-from-left    b-delay03 ">
                                                <%# Eval("Name") %></h2>
                                            <p class="single_price b-animate b-from-right    b-delay03 ">
                                                P<%# Eval("Price", "{0: #,###.00}") %></p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="col-md-4 col2">
                            <asp:ListView ID="lvDisklavier" runat="server">
                                <ItemTemplate>
                                    <a href="ProductDetails.aspx?ID=42" class="b-link-stroke b-animate-go  thickbox">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" alt="" />
                                        <div class="b-wrapper1">
                                            <h2 class="b-animate b-from-left    b-delay03 ">
                                                <%# Eval("Name") %></h2>
                                            <p class="single_price b-animate b-from-right    b-delay03 ">
                                                P<%# Eval("Price", "{0: #,###.00}") %></p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="col-md-4">
                            <asp:ListView ID="lvSilentGuitar" runat="server">
                                <ItemTemplate>
                                    <a href="ProductDetails.aspx?ID=54" class="b-link-stroke b-animate-go  thickbox">
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" alt="" />
                                        <div class="b-wrapper1">
                                            <h2 class="b-animate b-from-left    b-delay03 ">
                                                <%# Eval("Name") %></h2>
                                            <p class="single_price b-animate b-from-right    b-delay03 ">
                                                P<%# Eval("Price", "{0: #,###.00}") %></p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content_middle_bottom">
            <div class="header-left" id="home">
                <section>
				<ul class="lb-album" >
                <%--<li>
						<a href="#image-1">
                        <img src="images/wallpaper_fender_stratocaster9.jpg" class="img-square " alt="image01"/>
							
							<span>Pointe</span>
						</a>
						<div class="lb-overlay" id="Div1">
							<a href="#page" class="lb-close">x Close</a>
							<img src="images/wallpaper_fender_stratocaster9.jpg" class="img-square " alt="image01"/>
							<div>
								<h3>pointe <span>/point/</span></h3>
								<p>Dance performed on the tips of the toes</p>
							</div>
						</div>
					</li>
					<li>
						<a href="#image-2">
                        <img src="images/premiumpiano_wp_b_1920_1080.jpg" class="img-square" alt="image02"/>
							
							<span>Port de bras</span>
						</a>
						<div class="lb-overlay" id="Div2">
							<img src="images/premiumpiano_wp_b_1920_1080.jpg" class="img-square" alt="image02"/>
							<div>							
								<h3>port de bras <span>/ˌpôr də ˈbrä/</span></h3>
								<p>An exercise designed to develop graceful movement and disposition of the arms</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-3">
							<img src="images/pearl-drums-for-sale-2560x1600.jpg" class="img-square" alt="image03 />
							<span>Plié</span>
						</a>
						<div class="lb-overlay" id="Div3">
							<img src="images/pearl-drums-for-sale-2560x1600.jpg" class="img-square" alt="image03 />
							<div>							
								<h3>pli·é <span>/plēˈā/</span></h3>
								<p>A movement in which a dancer bends the knees and straightens them again</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-4">
							<img src="images/ibanez-jem-10th-anniversary-black-75170.jpg" class="img-square" alt="image04"/>
							<span>Adagio</span>
						</a>
						<div class="lb-overlay" id="Div4">
							<img src="images/ibanez-jem-10th-anniversary-black-75170.jpg" class="img-square" alt="image04"/>
							<div>							
								<h3>a·da·gio <span>/əˈdäjō/</span></h3>
								<p>A movement or composition marked to be played adagio</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-5">
							<img src="images/DSC02555.jpg" class="img-square" alt="image05" />
							<span>Frappé</span>
						</a>
						<div class="lb-overlay" id="Div5">
							<img src="images/DSC02555.jpg" class="img-square" alt="image05" />
							<div>							
								<h3>frap·pé<span>/fraˈpā/</span></h3>
								<p>Involving a beating action of the toe of one foot against the ankle of the supporting leg</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-6">
							<img src="images/DSC_0036.JPG" class="img-square" alt="image06"/>
							<span>Glissade</span>
						</a>
						<div class="lb-overlay" id="Div6">
							<img src="images/DSC_0036.JPG" class="img-square" alt="image06"/>
							<div>							
								<h3>glis·sade <span>/gliˈsäd/</span></h3>
								<p>One leg is brushed outward from the body, which then takes the weight while the second leg is brushed in to meet it</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-7">
							<img src="images/21728-violin-1920x1200-music-wallpaper.jpg" class="img-square" alt="image07"/>
							<span>Jeté</span>
						</a>
						<div class="lb-overlay" id="Div7">
							<img src="images/21728-violin-1920x1200-music-wallpaper.jpg" class="img-square" alt="image07"/>
							<div>							
								<h3>je·té <span>/zhə-ˈtā/</span></h3>
								<p>A springing jump made from one foot to the other in any direction</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-8">
							<img src="images/koz3.jpg" class="img-square img-responsive" alt="image08" />
							<span>Piqué</span>
						</a>
						<div class="lb-overlay" id="Div8">
							<img src="images/koz3.jpg" class="img-square img-responsive" alt="image08" />
							<div>							
								<h3>pi·qué <span>/pēˈkā/</span></h3>
								<p>Strongly pointed toe of the lifted and extended leg sharply lowers to hit the floor then immediately rebounds upward</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>--%>
					<li>
						<a href="#image-1">
							<img src="img/products/2535bff3-c7ea-44cb-985b-70a2593d56431.jpg"  class="img-square " alt="image01"/>
							<span>Pointe</span>
						</a>
						<div class="lb-overlay" id="image-1">
							<a href="#page" class="lb-close">x Close</a>
							<img src="img/products/2535bff3-c7ea-44cb-985b-70a2593d56431.jpg"  class="img" alt="image01"/>
							<div>
								<h3>pointe <span>/point/</span></h3>
								<p>Dance performed on the tips of the toes</p>
							</div>
						</div>
					</li>
					<li>
						<a href="#image-2">
							<img src="img/products/0a0098d5-aba2-402b-8328-97fa89cc13b51.jpg"  class="img-square" alt="image02"/>
							<span>Port de bras</span>
						</a>
						<div class="lb-overlay" id="image-2">
							<img src="img/products/0a0098d5-aba2-402b-8328-97fa89cc13b51.jpg"  class="img" alt="image02"/>
							<div>							
								<h3>port de bras <span>/ˌpôr də ˈbrä/</span></h3>
								<p>An exercise designed to develop graceful movement and disposition of the arms</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-3">
							<img src="img/products/0b51a12a-1246-4d45-8685-82e3f65e6cdb1.jpg"  class="img-square" alt="image03"/>
							<span>Plié</span>
						</a>
						<div class="lb-overlay" id="image-3">
							<img src="img/products/0b51a12a-1246-4d45-8685-82e3f65e6cdb1.jpg"  class="img" alt="image03"/>
							<div>							
								<h3>pli·é <span>/plēˈā/</span></h3>
								<p>A movement in which a dancer bends the knees and straightens them again</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-4">
							<img src="img/products/5fa2089c-e57b-41de-89f7-6f04ddb7eed61.jpg"  class="img-square" alt="image04"/>
							<span>Adagio</span>
						</a>
						<div class="lb-overlay" id="image-4">
							<img src="img/products/5fa2089c-e57b-41de-89f7-6f04ddb7eed61.jpg"  class="img" alt="image04"/>
							<div>							
								<h3>a·da·gio <span>/əˈdäjō/</span></h3>
								<p>A movement or composition marked to be played adagio</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-5">
							<img src="img/products/e36f15cf-6292-4603-90f6-7407a6696a391.jpg"  class="img-square" alt="image05"/>
							<span>Frappé</span>
						</a>
						<div class="lb-overlay" id="image-5">
							<img src="img/products/e36f15cf-6292-4603-90f6-7407a6696a391.jpg"  class="img" alt="image05"/>
							<div>							
								<h3>frap·pé<span>/fraˈpā/</span></h3>
								<p>Involving a beating action of the toe of one foot against the ankle of the supporting leg</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-6">
							<img src="img/products/1c55ee00-569c-4baa-92f8-42804d2084ce1.jpg"  class="img-square" alt="image06"/>
							<span>Glissade</span>
						</a>
						<div class="lb-overlay" id="image-6">
							<img src="img/products/1c55ee00-569c-4baa-92f8-42804d2084ce1.jpg"  class="img" alt="image06"/>
							<div>							
								<h3>glis·sade <span>/gliˈsäd/</span></h3>
								<p>One leg is brushed outward from the body, which then takes the weight while the second leg is brushed in to meet it</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-7">
							<img src="img/products/6606052f-ca45-4ed5-8ebb-0bc238ae19a01.jpg"  class="img-square" alt="image07"/>
							<span>Jeté</span>
						</a>
						<div class="lb-overlay" id="image-7">
							<img src="img/products/6606052f-ca45-4ed5-8ebb-0bc238ae19a01.jpg"  class="img" alt="image07"/>
							<div>							
								<h3>je·té <span>/zhə-ˈtā/</span></h3>
								<p>A springing jump made from one foot to the other in any direction</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-8">
							<img src="img/products/c476ba18-f3b7-4120-b13d-9dbd5d11f9411.jpg"  class="img-square" alt="image08"/>
							<span>Piqué</span>
						</a>
						<div class="lb-overlay" id="image-8">
							<img src="img/products/c476ba18-f3b7-4120-b13d-9dbd5d11f9411.jpg"  class="img" alt="image08"/>
							<div>							
								<h3>pi·qué <span>/pēˈkā/</span></h3>
								<p>Strongly pointed toe of the lifted and extended leg sharply lowers to hit the floor then immediately rebounds upward</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<div class="clearfix"></div>
				</ul>
			</section>
            </div>
            <div class="field_content">
                <h1>
                    # Instamusica On Instagram</h1>
                <h2>
                    View Hashtag</h2>
            </div>
        </div>
    </div>
</asp:Content>
