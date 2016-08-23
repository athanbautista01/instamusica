<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Admin_SupplierItem_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    View Supplier Item
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">

<div class="panel-heading"><i class="fa fa-plus"></i>
<span class="semi-bold"> Add Supplier Item</span> </div>
    <br />
                <div class="porlets-content">
              <div class="form-horizontal group-border-dashed" action="#" parsley-validate novalidate>

                            
                            
                             <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Supplier</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control" />
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="control-label col-lg-3">
                                    Product</label>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlProducts" runat="server" class="form-control" />
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
    <br />
<div class="panel-heading"><i class="fa fa-plus"></i>
<span class="semi-bold"> Supplier Item</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Code</th>
                    <th>Category</th>
                    <th>Company Name</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSuppliers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("RefNo") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Code") %></td>
                                <td><%# Eval("Category") %></td>
                                <td><%# Eval("CompanyName") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="10">
                                    <h1 class="text-center">No records found.</h1>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
            </div>
            </div>
            </div>
            </section>
            
        </div>



</asp:Content>

