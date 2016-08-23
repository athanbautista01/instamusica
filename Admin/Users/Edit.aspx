<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Edit.aspx.cs" Inherits="Admin_Users_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Edit a User Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container clear_both padding_fix">
        <div class="row">
            <div class="col-md-12">
                <div class="block-web panel panel_bg_gray panel_header_bg_red">
                    <div class="header">
                        <div class="actions">
                            <a class="minimize" href="#"><i class="fa fa-chevron-down"></i></a><a class="close-down"
                                href="#"><i class="fa fa-times"></i></a>
                        </div>
                        <h3 class="content-header">
                            Add a User</h3>
                    </div>
                    <div class="porlets-content">
                        <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Status</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                                        <asp:ListItem>Active</asp:ListItem>
                                        <asp:ListItem>Inactive</asp:ListItem>
                                        <asp:ListItem>Block</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    User Type</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlTypes" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Email Address</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Password</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control"
                                        required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    First Name</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Last Name</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtLastName" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Street</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtStreet" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Municipality</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    City</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Phone</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Mobile</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-7">
                                    <div class="row clearfix pull-right">
                                        <a href="Default.aspx" class="btn btn-default">Back to View </a>
                                        <asp:LinkButton ID="btnEdit" runat="server" class="btn btn-success" OnClick="btnEdit_Click">
<i class="fa fa-plus"></i> Edit
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
