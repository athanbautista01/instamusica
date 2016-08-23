<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Pending.aspx.cs" Inherits="Admin_Orders_Pending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Orders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
<div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold"> Users</span> </div>
              <div class="panel-body">
              <div class="col-lg-12">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>#</th>
                    <th>Date Ordered</th>
                    <th>Deadline</th>
                    <th>Total Amount</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvOrders" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderNo") %></td>
                                <td><%# Eval("DateOrdered") %></td>
                                <td><%# Eval("Deadline") %></td>
                                <td><%# Eval("TotalAmount", "{0: #,###.00}") %></td>
                                <td><%# Eval("PaymentMethod") %></td>
                                <td><%# Eval("Status") %></td>
                                <td>
                                    <a href='Details.aspx?ID=<%# Eval("OrderNo") %>'>
                                        <i class="fa fa-search"></i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr colspan="7">
                                <h2 class="text-center">No records found.</h2>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
            </div>
            </div>
            </div>
            </div>
            </section>
            
        </div>
        
            
        

</asp:Content>



