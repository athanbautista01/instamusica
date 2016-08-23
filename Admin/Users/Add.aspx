<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="Admin_Users_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add a User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
<div class="container clear_both padding_fix">
    <div class="row">
        <div class="col-md-12">
            <div class="block-web panel panel_bg_gray panel_header_bg_red">
                <div class="header">
                    
                    <h3 class="content-header">
                        Add a User</h3>
                </div>
                <div class="porlets-content">
              <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>

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
                                    <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-success pull-right" OnClick="btnAdd_Click">
<i class="fa fa-plus"></i> Add
                                    </asp:LinkButton>
                                </div>
                            </div>
                        
              </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
