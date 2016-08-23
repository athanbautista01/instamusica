<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Details.aspx.cs" Inherits="Admin_Products_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    View Product #<asp:Literal ID="ltID" runat="server" />
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
                                    Name</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" MaxLength="50" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Category</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlCategories" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Code</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCode" runat="server" class="form-control" MaxLength="10" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Description</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="Multiline"
                                        MaxLength="300" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Image</label>
                                <div class="col-lg-6">
                                    <asp:Image ID="imgProduct" runat="server" class="img-responsive" Width="200" /><br />
                                    <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Price</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtPrice" runat="server" class="form-control" type="number" min="0.01"
                                        max="500000.00" step="0.01" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Is Featured?</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlFeatured" runat="server" class="form-control">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Critical Level</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCritical" runat="server" class="form-control" type="number" min="1"
                                        max="100" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Maximum</label>
                                <div class="col-lg-6    ">
                                    <asp:TextBox ID="txtMax" runat="server" class="form-control" type="number" min="1"
                                        MaxLength="1000" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-7">
                                    <span class="pull-right">
                                        <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" PostBackUrl="~/Admin/Products/Default.aspx"
                                            formnovalidate />
                                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
