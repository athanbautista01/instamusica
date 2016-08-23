<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="men">
        <div class="container">
            <div class="col-lg-12">
                <table class="table table-hover">
                    <thead>
                        <th>
                            Order No
                        </th>
                        <th>
                            Date Ordered
                        </th>
                        <th>
                        </th>
                    </thead>
                    <tbody class="row clearfix">
                        <asp:ListView ID="lvOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <h4>
                                            <%# Eval("OrderNo") %></h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <%# Eval("DateOrdered", "{0: MMMM dd, yyyy}") %>
                                        </h4>
                                    </td>
                                    <td class="row clearfix">
                                        
                                        <a href='Details.aspx?ID=<%# Eval("OrderNo") %>'><i class="fa fa-search"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="6">
                                        <h3 class="text-center">
                                            No items found.</h3>
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
