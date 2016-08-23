<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Reviews_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    View Reviews

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<div class="col-lg-12">
<section class="">
<div class="block-web panel panel_bg_gray panel_header_bg_red">
<div class="panel-heading"><i class="fa fa-users"></i>
<span class="semi-bold"> Reviews</span> </div>
              <div class="panel-body">
              <div class="col-lg-12">
              <div class="table-responsive">
            <table class="table table-condensed">
                <thead>
                    <th>#</th>
                    <th>Date Reviewed</th>
                    <th>Name</th>
                    <th>Product Name</th>
                    <th>Rating</th>
                    <th>Review</th>
                    <th>Status</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvReview" runat="server"  OnItemCommand="lvReview_ItemCommand"  >
                        <ItemTemplate>
                            <tr>
                                <asp:Literal ID="ltReviewID" runat="server" Text='<%# Eval("ReviewID") %>' />
                                <td><%# Eval("ReviewID") %></td>
                                <td><%# Eval("DateReviewed", "{0: MMMM dd,yyyy}") %></td>
                                <td><%#Eval("LastName") %>,<%#Eval("FirstName") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Rating") %></td>
                                <td><%# Eval("Review") %></td>
                                <td><%# Eval("Status") %></td>
                                <td>
                                     <asp:LinkButton ID="btnDeliver" runat="server" class="btn" CommandName="deliveritem"
                                        Visible='<%# Eval("Status").ToString() == "Pending" ? true : false %>'
                                        OnClientClick='return confirm("Approve Review?");'>
                                        <i class="fa fa-thumbs-up"></i>
                                    </asp:LinkButton>

                                      <asp:LinkButton ID="btnReject" runat="server" class="btn" CommandName="rejectitem"
                                        Visible='<%# Eval("Status").ToString() == "Pending" ? true : false %>'
                                        OnClientClick='return confirm("Reject Review?");'>
                                        <i class="fa fa-thumbs-down"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr colspan="7">
                                <h2 class="text-center">No records found.</h2>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
            </div>
            </div>
            </div>
            </div>
            </section>
            
        </div>

</asp:Content>

