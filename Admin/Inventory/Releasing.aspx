<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Releasing.aspx.cs" Inherits="Admin_Inventory_Releasing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Release Records
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
                        <th>Order Number</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>DateReleased</th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvReleasing" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ReleasingNo") %></td>
                                    <td><%# Eval("OrderNo") %></td>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("DateReleased") %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="10">
                                        <h1 class="text-center">No releasing items found.</h1>
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