<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddCat.aspx.cs" Inherits="Admin_Products_AddCat" %>

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
                                    Category
                                </label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCat" runat="server" class="form-control" MaxLength="50" required />
                                </div>
                            </div>
                            </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-7">
                                <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-success pull-right" OnClick="btnAdd_Click">
                        <i class="fa fa-plus"></i> Add Category
                                </asp:LinkButton>
                            </div>
                        </div>
                        <br /><br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

