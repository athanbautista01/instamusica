<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Admin_Products_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add a Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="col-lg-12">
        <section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold">Products Categories</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>Category ID</th>
                    <th>Category</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvCat" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("CatID") %></td>
                                <td><%# Eval("Category") %></td>

                                <td class="row clearfix">
                                    <a href='AddCat.aspx' type="button" class="btn btn-success btn-icon"><i class="fa fa-plus"></i></a>
                                </td>
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

