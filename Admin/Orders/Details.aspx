<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Orders_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Order # <asp:Literal ID="ltOrderNo" runat="server" /> Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
        <div class="col-lg-9">
            <table class="table table-hover">
                <thead>
                    <th></th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvOrders" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Literal ID="ltRefNo" runat="server"
                                        Text='<%# Eval("RefNo") %>' Visible="false" />
                                    <img src='../../img/products/<%# Eval("Image") %>'
                                        class="img-responsive" width="100" />
                                </td>
                                <td>
                                    <h3><%# Eval("Name") %> (<%# Eval("Code") %>)</h3>
                                    <small>Category: <%# Eval("Category") %></small>
                                </td>
                                <td>
                                    Php<%# Eval("Price", "{0: #,###.00}") %></td>
                                <td>
                                    <%# Eval("Quantity") %>
                                </td>
                                <td>
                                    P<%# Eval("Amount", "{0: #,###.00}") %></td>
                                <td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </tbody>
            </table>
        </div>
        <div class="col-lg-3">
           <div class="well">
                <h3>
                    Gross Amount: <br />
                    P<asp:Literal ID="ltGross" runat="server" />
                </h3>
                <h3>
                    VAT (12%): <br />
                    P<asp:Literal ID="ltVAT" runat="server" />
                </h3>
                <h2>
                    Total Amount: <br />
                    P<asp:Literal ID="ltTotal" runat="server" />
                </h2>
           </div>
        </div>
        <hr />
        <div class="col-lg-6">
            <h2>Billing and Delivery Address</h2>
            <div class="form-group">
                <label class="control-label col-lg-4">First Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFN" runat="server"
                        class="form-control" disabled />
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-lg-4">Last Name</label>
                <div class="col-lg-8    ">
                    <asp:TextBox ID="txtLN" runat="server"
                        class="form-control" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Street</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtStreet" runat="server" class="form-control" MaxLength="50" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Municipality</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" MaxLength="100" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">City</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" MaxLength="50" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Phone</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="12" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="12" disabled />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <h2>Payment Summary</h2>
            <div class="form-group">
                <label class="control-label col-lg-4">Method</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlMethod" runat="server" class="form-control" disabled>
                        <asp:ListItem>Cash Deposit</asp:ListItem>
                        <asp:ListItem>Check Deposit</asp:ListItem>
                        <asp:ListItem>Cash on Delivery</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:LinkButton ID="btnApprove" runat="server" class="btn btn-success"
                        OnClientClick='return confirm("Approve order?");' OnClick="btnApprove_Click">
                        <i class="fa fa-thumbs-up"></i> Approve
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnReject" runat="server" class="btn btn-danger"
                        OnClientClick='return confirm("Reject order?");' OnClick="btnReject_Click">
                        <i class="fa fa-thumbs-down"></i> Reject
                    </asp:LinkButton>
                    <a href="Default.aspx" class="btn btn-info">
                        Back to Orders
                    </a>
                </div>
            </div>
        </div>
</asp:Content>
