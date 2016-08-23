<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Purchases_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add a Purchase
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container clear_both padding_fix">
        <div class="row">
            <div class="col-md-12">
                <div class="block-web panel panel_bg_gray panel_header_bg_red">
                    <div class="header">
                        <h3 class="content-header">Add a Product</h3>
                    </div>
                    <div class="porlets-content">
                        <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Category
                                </label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="true" class="form-control" required  OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Product
                                </label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlProducts" runat="server" class="form-control" required />
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
                                <label class="control-label col-lg-3">Quantity</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtQty" runat="server" class="form-control" type="number"  required />
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

