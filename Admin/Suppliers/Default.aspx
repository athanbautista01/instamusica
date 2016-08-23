<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Suppliers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    View Suppliers

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-plus"></i>
<span class="semi-bold"> Suppliers</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>#</th>
                    <th>Company Name</th>
                    <th>Contact Person</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Mobile</th>
                    <th>Status</th>
                    <th>Date Added</th>
                    <th>Date Modified</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSuppliers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SupplierID") %></td>
                                <td><%# Eval("CompanyName") %></td>
                                <td><%# Eval("ContactPerson") %></td>
                                <td><%# Eval("Address") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# Eval("Mobile") %></td>
                                <td><%# Eval("Status") %></td>
                                <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateModified") %></td>
                                <td>
                                    <a href='Edit.aspx?ID=<%# Eval("SupplierID") %>' type="button" class="btn btn-success btn-icon"> Edit
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href='Delete.aspx?ID=<%# Eval("SupplierID") %>' onclick='return confirm("Are you sure?");' type="button" class="btn btn-danger btn-icon"> Delete
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                </td>
                               
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

