<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Users.aspx.cs" Inherits="Admin_Reports_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Users Master List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
       <div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold">Orders</span> </div>
              <div class="panel-body">
              <div class="table-responsive">
            <table class="table table-condensed">
                    <thead>
                        <th>
                            #
                        </th>
                        <th>
                            User Type
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            Name
                        </th>
                        <th>
                            Address
                        </th>
                        <th>
                            Status
                        </th>
                        <th>
                            Date Added
                        </th>
                        <th>
                            Date Modified
                        </th>
                        <th>
                        </th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvProducts" runat="server" OnPagePropertiesChanging="lvProducts_PagePropertiesChanging"
                            OnDataBound="lvProducts_DataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("UserID") %>
                                    </td>
                                    <td>
                                        <%# Eval("UserType") %>
                                    </td>
                                    <td>
                                        <%# Eval("Email") %>
                                    </td>
                                    <td>
                                        <%# Eval("LastName") %>,
                                        <%# Eval("FirstName") %>
                                    </td>
                                    <td>
                                        <%# Eval("Street") %>,
                                        <%# Eval("Municipality") %>,
                                        <%# Eval("City") %>
                                    </td>
                                    <td>
                                        <%# Eval("Phone") %>,
                                        <%# Eval("Mobile") %>
                                    </td>
                                    <td>
                                        <%# Eval("Status") %>
                                    </td>
                                    <td>
                                        <%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %>
                                    </td>
                                    <td>
                                        <%# Eval("DateModified") %>
                                    </td>
                                    <td>
                                        <a href='Edit.aspx?ID=<%# Eval("UserID") %>'><i class="fa fa-edit"></i></a><a href='Delete.aspx?ID=<%# Eval("UserID") %>'
                                            onclick='return confirm("Are you sure?");'><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="10">
                                        <h2 class="text-center">
                                            No Records Found.</h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
                <center>
                    <asp:DataPager ID="dpProducts" runat="server" PagedControlID="lvProducts" PageSize="15">
                        <Fields>
                            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn-default"
                                CurrentPageLabelCssClass="btn-primary" NextPreviousButtonCssClass="btn-default" />
                        </Fields>
                    </asp:DataPager>
                </center>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
