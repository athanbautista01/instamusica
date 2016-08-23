<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="men">
        <div class="container">
            <div class="col-lg-9">
                <table class="table table-hover">
                    <thead>
                        <th>
                        </th>
                        <th>
                            Product
                        </th>
                        <th>
                            Price
                        </th>
                        <th>
                            Quantity
                        </th>
                        <th>
                            Amount
                        </th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvCart" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal ID="ltRefNo" runat="server" Text='<%# Eval("RefNo") %>' Visible="false" />
                                        <img src='img/products/<%# Eval("Image") %>' class="img-responsive" width="100" />
                                    </td>
                                    <td>
                                        <h3>
                                            <%# Eval("Name") %>
                                            (<%# Eval("Code") %>)</h3>
                                        <small>Category:
                                            <%# Eval("Category") %></small>
                                    </td>
                                    <td>
                                        Php<%# Eval("Price", "{0: #,###.00}") %>
                                    </td>
                                    <td>
                                        <%# Eval("Quantity") %>
                                    </td>
                                    <td>
                                        P<%# Eval("Amount", "{0: #,###.00}") %>
                                    </td>
                                    <td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="5">
                                        <h2 class="text-center">
                                            You shopping cart is empty.</h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-3">
                <div class="well">
                <h5>Gross Amount: </h5><span style='color:Gray;'><asp:Literal ID="ltGross" runat="server" /></span><br /><br />
                <h5 >VAT (12%): </h5><span style='color:Red;'><asp:Literal ID="ltVAT" runat="server" /></span><br /><br />
                <h3>Total Amount: </h3><span style='color:Green;'><u>P<asp:Literal ID="ltTotal" runat="server" /></u></span><br /><br />
            </div>
            </div>
            <hr />
            <div class="col-lg-6">
            <div class="wish-list">
                <h2>
                    Billing and Delivery Address</h2></div>
                    <br />
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        First Name</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtFN" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Last Name</label>
                    <div class="col-lg-8    ">
                        <asp:TextBox ID="txtLN" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Street</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtStreet" runat="server" class="form-control" MaxLength="50" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Municipality</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" MaxLength="100"
                            required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        City</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtCity" runat="server" class="form-control" MaxLength="50" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Phone</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="12" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Mobile</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="12" />
                    </div>
                </div>

            </div>
            <div class="col-lg-6">
            <div class="wish-list">
                <h2>
                    Payment Summary</h2></div>
                    <br />

                <div class="form-group">
                    <label class="control-label col-lg-4">
                        Method</label>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="ddlMethod" runat="server" class="form-control">
                            <asp:ListItem>Cash Deposit</asp:ListItem>
                            <asp:ListItem>Check Deposit</asp:ListItem>
                            <asp:ListItem>Cash on Delivery</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <label style="font-size:smaller; color:Gray;">
                            <asp:CheckBox ID="cboTerms" runat="server" required />&nbsp; I have agreed to the
                            Terms and Conditions of this website.
                        </label>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnSubmit" runat="server" OnClientClick='return confirm("Place an order?");'
                            class="btn btn-success btn-lg" OnClick="btnSubmit_Click">
                        <i class="fa fa-money"></i> Submit Order
                        </asp:LinkButton>
                        <a href="Cart.aspx" class="btn btn-info btn-lg">Back to Cart </a>
                    </div>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
