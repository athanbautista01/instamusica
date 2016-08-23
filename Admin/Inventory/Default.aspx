<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Inventory_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
View Inventories
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
                        <th>Product Name</th>
                        <th>Availabe</th>
                        <th>Critical Level</th>
                        <th>Maximum</th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvInventory" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Name") %> (<%# Eval("Code") %>)</td>
                                    <td><%# Eval("Available") %></td>
                                    <td><%# Eval("CriticalLevel") %></td>
                                    <td><%# Eval("Maximum") %></td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="10">
                                        <h1 class="text-center">No inventories found.</h1>
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

