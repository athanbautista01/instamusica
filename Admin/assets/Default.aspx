<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Deliveries_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    View Deliveries
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-truck"></i>
<span class="semi-bold"> Deliveries</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
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
                   <asp:ListView ID="lvDeliveries" runat="server" OnItemCommand="lvDeliveries_ItemCommand" >
                        <ItemTemplate>
                            <tr>
                                <td><asp:Literal ID="ltOrderNo" runat="server" Text='<%# Eval("OrderNo") %>' /></td>
                                <td><%# Eval("DateOrdered", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("Deadline", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateDelivered", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("TotalQuantity") %></td>
                                <td><%# Eval("Status") %></td>
                                <td>
                                    <asp:LinkButton ID="btnDeliver" runat="server" class="btn" CommandName="deliveritem"
                                        Visible='<%# Eval("Status").ToString() == "Pending" ? true : false %>'
                                        OnClientClick='return confirm("Deliver items?");'>
                                        <i class="fa fa-truck"></i>
                                    </asp:LinkButton>
                                </td>
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
            </div>
            </div>
            </section>
            
        </div>

</asp:Content>

