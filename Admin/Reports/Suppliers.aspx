<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs" Inherits="Admin_Reports_Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Suppliers Master List
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
                    <th>Company Name</th>
                    <th>Contact Person</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th>Date Added</th>
                    <th>Date Modified</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSupplier" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SupplierID") %></td>
                                <td><%# Eval("CompanyName") %></td>
                                <td><%# Eval("ContactPerson") %></td>
                                <td><%# Eval("Address") %></td>
                                 <td><%# Eval("Phone") %>, <%# Eval("Mobile") %></td>
                                <td><%# Eval("Status") %></td>
                                <td><%# Eval("DateAdded") %></td>
                                <td><%# Eval("DateModified") %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="7">
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

