<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="Admin_Products_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add a Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container clear_both padding_fix">
        <div class="row">
            <div class="col-md-12">
                <div class="block-web panel panel_bg_gray panel_header_bg_red">
                    <div class="header">
                        <h3 class="content-header">
                            Add a Product</h3>
                    </div>
                    <div class="porlets-content">
                        <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Name
                                </label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" MaxLength="50" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Category
                                </label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlCategories" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Code
                                </label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCode" runat="server" class="form-control" MaxLength="10" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Description
                                </label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine"
                                        MaxLength="300"  Columns="10" Rows="8" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Image
                                </label>
                                <div class="col-lg-6">
                                    <asp:FileUpload ID="fuImage" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Price
                                </label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtPrice" runat="server" class="form-control" type="number" min="0.01"
                                        max="500000.00" step="0.01" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Is Featured?
                                </label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlFeatured" runat="server" class="form-control">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>no</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3">
                                Critical Level
                            </label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtCriticalLevel" runat="server" class="form-control" type="number"
                                    min="1" MaxLength="100" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-3">
                                Maximum
                            </label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtMax" runat="server" class="form-control" type="number" min="1"
                                    MaxLength="100" required />
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
</asp:Content>
