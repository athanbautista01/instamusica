<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Deliveries.aspx.cs" Inherits="Deliveries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="men">
        <div class="container">
            <div class="col-lg-12">
                <table class="table table-hover">
                <thead>
                    <th>#</th>
                    <th>Date Ordered</th>
                    <th>Deadline</th>
                    <th>Date Delivered</th>
                    <th># of Items</th>
                    <th>Delivery Status</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvDeliveries" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><asp:Literal ID="ltOrderNo" runat="server" Text='<%# Eval("OrderNo") %>' /></td>
                                <td><%# Eval("DateOrdered", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("Deadline", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateDelivered", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("TotalQuantity") %></td>
                                <td><%# Eval("Status") %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="7">
                                    <h2 class="text-center">No records found.</h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
            </div>
            
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>

