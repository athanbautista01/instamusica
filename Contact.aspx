<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="upProducts" runat="server">
        <ContentTemplate>
            <div class="men">
                <div class="container">
                    <div class="grid_1">
                        <h1>
                            Contact Info</h1>
                        <p>
                            Thank you for visiting our website!
                        </p>
                        <br />
                        <p>
                            InstaMusica makes all reasonable efforts to ensure that the information published
                            on its website is as accurate and up-to-date as possible. Any person requiring confirmation
                            of any information on this website about the instrument,brands, supplier, and etc.
                            must contact us by filling up the feedback form bellow.</p>
                        <br />
                        <p>
                            If you believe any of the information held on our website is incorrect please fill
                            up the feedback form to inform us.</p>
                    </div>
                    <div class="grid_4">
                        <div class="grid_4 preffix_1">
                            <ul class="iphone">
                                <i class="phone"></i>
                                <li class="phone_desc">Phone : 418-83-39 </li>
                                <div class="clearfix">
                                </div>
                            </ul>
                            <ul class="iphone">
                                <i class="flag"></i>
                                <li class="phone_desc">Website : <a href="https://www.facebook.com/groups/1510870462468803/1526366170919232/?notif_t=group_comment">
                                    www.InstaMusica.com</a></li>
                                <div class="clearfix">
                                </div>
                            </ul>
                        </div>
                        <div class="grid_3">
                            <ul class="iphone">
                                <i class="msg"></i>
                                <li class="phone_desc">Email : <a href="#">InstaMusica@yahoo.com</a> </li>
                                <div class="clearfix">
                                </div>
                            </ul>
                            <ul class="iphone">
                                <i class="home"></i>
                                <li class="phone_desc">Address : 2544 Taft Ave, Malate, Manila, 1004 Metro Manila</li>
                                <div class="clearfix">
                                </div>
                            </ul>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="contact_form">
                        <div class="col-lg-12">
                            <div class="wish-list">
                                <h1 class="text-center">
                                    <span class="color">Feedback</span></h1>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Feedback</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtFeedback" TextMode="multiline" Columns="60" Rows="7" runat="server"
                                        class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Response</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtResponse" TextMode="multiline" Columns="60" Rows="7" runat="server"
                                        class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-7">
                                    <asp:LinkButton ID="btnFeedback" runat="server" class="btn btn-primary btn-normal btn-inline pull-right"
                                        OnClick="btnFeedback_Click1">
                                        <i class="fa fa-comment"></i> Send Message
                                    </asp:LinkButton>
                                    <%--<div id="popupdiv" title="Basic modal dialog" style="display: none">
                                <div class="alert alert-danger" visible="false">
                                    You must login first to maximize your transaction.
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true"><a class="btn btn-primary btn-normal btn-inline text-center"
                                        data-toggle="modal" data-target="#myModal"><i class="fa fa-sign-in"></i> Click here
                                        to Login!</a></span></button>
                            </div>
                            <asp:LinkButton ID="btnShowModal" runat="server" class="btn btn-primary btn-normal btn-inline pull-right"
                                OnClick="btnShowModal_Click">
                                        <i class="fa fa-comment"></i> Send Message
                            </asp:LinkButton>--%>
                                </div>
                            </div>
                            <div class="col-lg-offset-3 col-lg-6">
                                <a data-toggle="modal" data-target="#myModal">
                                    <div id="errorMessage" class="alert alert-danger text-center" visible="false" runat="server">
                                        You must login first to do this action.
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978">
                </iframe>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
