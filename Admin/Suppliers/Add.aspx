<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Suppliers_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container clear_both padding_fix">
    <div class="row">
        <div class="col-md-12">
            <div class="block-web panel panel_bg_gray panel_header_bg_red">
                <div class="header">
                    
                    <h3 class="content-header">
                        Add a Supplier</h3>
                </div>
                <div class="porlets-content">
              <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>

                            
                            
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Company Name</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCN" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Contact Person</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCP" runat="server" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Address</label>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtAdd" runat="server" class="form-control" required />
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
                                    <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-success pull-right" OnClick="btnAdd_Click" >
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

