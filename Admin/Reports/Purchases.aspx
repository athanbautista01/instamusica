<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Purchases.aspx.cs" Inherits="Admin_Reports_Purchases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Purchase Master List
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
                    <th>Contact Person</th>                    
                    <th>Product Name</th>
                    <th>Qty</th>                    
                    <th>Date Purchased</th>
                    <th>Date Received</th>          
                    <th>Status</th>
                    <th></th>                     
                </thead>
                <tbody>
                    <asp:ListView ID="lvProducts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PurchaseNo") %></td>
                                <td><%# Eval("ContactPerson") %></td>                                                                
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Quantity") %></td>                                
                                <td><%# Eval("DatePurchased", "{0: MMMM dd, yyyy}") %></td>
                                <td><%# Eval("DateReceived", "{0: MMMM dd, yyyy}")%></td>     
                                <td><%# Eval("Status") %></td>
                                <td>
                                    <a href='Delivered.aspx?ID=<%# Eval("PurchaseNo") %>'>
                                        <i class="fa fa-truck" style="color:#00FF00;"></i>
                                    </a>
                                </td>
                              <%--  <td>
                                    <a href='NotDelivered.aspx?ID=<%# Eval("PurchaseNo") %>'>
                                        <i class="fa fa-truck" style="color:red;"></i>
                                    </a>
                                </td>   --%>                                                        
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

