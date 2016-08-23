<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="men">
   	<div class="container">
        <div class="col-lg-9">
            <table class="table table-hover">
                <thead>
                    <th></th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                    <th></th>
                </thead>
                <tbody class="row clearfix">
                    <asp:ListView ID="lvCart" runat="server" onitemcommand="lvCart_ItemCommand">
                        <ItemTemplate>
                            <tr >
                                <td>
                                    <asp:Literal ID="ltRefNo" runat="server" Text='<%# Eval("RefNo") %>' Visible="false" />
                                    <img src='img/products/<%# Eval("Image") %>' width="200" class="img-responsive" alt='<%# Eval("Name") %>' />

                                </td>
                                <td>
                                    <asp:Literal ID="ltProductID" runat="server" Text='<%# Eval("ProductID") %>' Visible="false" />
                                    <h3><%# Eval("Name") %></h3>
                                </td>
                                <td>
                                    P<%# Eval("Price", "{0: #,###.00}") %></td>
                                <td>
                                    <asp:TextBox ID="txtQty" runat="server" class="form-control" type="number" min="1" max="99" Text='<%# Eval("Quantity") %>' />
                                </td>
                                <td>
                                    P<%# Eval("Amount", "{0: #,###.00}") %>
                                </td>
                                <td class="row clearfix">
                                    <asp:LinkButton ID="btnUpdate" runat="server" class="btn btn-success btn-lg btn-inline" CommandName="updateqty">
                                        <i class="fa fa-refresh"></i>Refresh
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" class="btn btn-danger btn-lg btn-inline" CommandName="deleteitem">
                                        <i class="fa fa-trash-o"></i>Delete
                                    </asp:LinkButton>
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="6">
                                    <h3 class="text-center">No items found.</h3>
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
     <div class="clearfix"> </div>
	</div>
    </div>
</asp:Content>

