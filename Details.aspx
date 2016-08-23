<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="men">
        <div class="container">
            <div class="col-lg-9">
                <table class="table table-hover">
                    <thead>
                        <th>
                            Order Items
                        </th>
                        <th>
                            Payment Summary
                        </th>
                        <th>
                            Billing
                        </th>
                        <th>
                            Delivery Address
                        </th>
                        <th>
                        </th>
                    </thead>
                    <tbody class="row clearfix">
                        <asp:ListView ID="lvOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <img src='img/products/<%# Eval("Image") %>' width="200" class="img-responsive" alt='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Literal ID="ltProductID" runat="server" Text='<%# Eval("ProductID") %>' Visible="false" />
                                        <h3>
                                            <%# Eval("Name") %></h3>
                                    </td>
                                    <td>
                                        P<%# Eval("Price", "{0: #,###.00}") %>
                                    </td>
                                    <td>
                                        <%# Eval("Street") %>,
                                        <%# Eval("Municipality") %>,
                                        <%# Eval("City") %>
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
            <div class="col-lg-3">
                <div class="well">
                    <h5>
                        Gross Amount:
                    </h5>
                    <span style='color: Gray;'>
                        <asp:Literal ID="ltGross" runat="server" /></span><br />
                    <br />
                    <h5>
                        VAT (12%):
                    </h5>
                    <span style='color: Red;'>
                        <asp:Literal ID="ltVAT" runat="server" /></span><br />
                    <br />
                    <h3>
                        Total Amount:
                    </h3>
                    <span style='color: Green;'><u>P<asp:Literal ID="ltTotal" runat="server" /></u></span><br />
                    <br />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
