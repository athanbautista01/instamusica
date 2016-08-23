<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Deliveries.aspx.cs" Inherits="Admin_Reports_Deliveries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Deliveries Master List 
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
                    <th>OrderNo</th>
                    <th>Deadline</th>
                    <th>Date Delivered</th>
                    <th>Status</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvDeliveries" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("DeliveryNo") %></td>
                                <td><%# Eval("OrderNo") %></td>
                                <td><%# Eval("Deadline") %></td>
                                <td><%# Eval("DateDelivered") %></td>
                                <td><%# Eval("Status") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <td colspan="7">
                                <h2 class="text-center">No records found.</h2>
                            </td>
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

