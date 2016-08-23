<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Products_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
Add a Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold"> Users</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>#</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Is Featured</th>
                    <th>Date Added</th>
                    <th>Date Modified</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvProducts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ProductID") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Category") %></td>
                                <td><%# Eval("Description") %></td>
                                <td>
                                    <img id="Img1" runat="server" src='<%# string.Concat("~/img/products/", Eval("Image")) %>' class="img-responsive" width="100" />
                                </td>
                                <td><%# Eval("Price", "{0: #,###.00}") %></td>
                                <td><%# Eval("IsFeatured") %></td>
                                <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}")%></td>
                                <td class="row clearfix">
                                    <a href='Details.aspx?ID=<%# Eval("ProductID") %>' type="button" class="btn btn-success btn-icon"><i class="fa fa-search"></i></a> 
                                    <a href='Delete.aspx?ID=<%# Eval("ProductID") %>' onclick='return confirm("Delete record?")' type="button" class="btn btn-danger btn-icon">
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="10">
                                    <h2 class="text-center">No records found.</h2>
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

