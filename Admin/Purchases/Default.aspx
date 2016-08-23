<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Purchases_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    View Purchase Orders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
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
                    <th>Supplier Name</th>                    
                    <th>Image</th>
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
                                <td>
                                    <img id="Img1" runat="server" src='<%# string.Concat("../../images/", Eval("Image")) %>' class="img-responsive" width="100" />
                                </td>
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
