<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Users_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
View Users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
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
                    <th>User Type</th>
                    <th>Email Address</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th>Date Added</th>
                    <th>Date Modified</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvUsers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("UserID") %></td>
                                <td><%# Eval("UserType") %></td>
                                <td><%# Eval("Email") %></td>
                                <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                <td><%# Eval("Street") %>, <%# Eval("Municipality") %>, <%# Eval("City") %></td>
                                <td><%# Eval("Phone") %>, <%# Eval("Mobile") %></td>
                                <td><%# Eval("Status") %></td>
                                <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateModified") %></td>
                                <td>
                                    <a href='Edit.aspx?ID=<%# Eval("UserID") %>' type="button" class="btn btn-success btn-icon"> Edit
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href='Delete.aspx?ID=<%# Eval("UserID") %>' onclick='return confirm("Are you sure?");' type="button" class="btn btn-danger btn-icon"> Delete
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
