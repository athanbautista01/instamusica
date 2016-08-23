<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Reports_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Products Master List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
       <div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold">Orders</span> </div>
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
                        <td>Date Added</td>
                        <td>Date Modified</td>
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
                                        <img id="Img1" runat="server" src='<%# string.Concat("~/img/products/", Eval("Image")) %>'
                                            class="img-responsive" width="100" />
                                    </td>
                                    <td><%# Eval("Price") %></td>
                                    <td><%# Eval("IsFeatured") %></td>



                                    <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                    <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                    
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="10">
                                        <h2 class="text-center">No Records Found.</h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>
    </div>
    
</asp:Content>

