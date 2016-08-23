<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    DASHBOARD
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container clear_both padding_fix">
        <!--\\\\\\\ container  start \\\\\\-->
        <div class="row">
            <div class="col-sm-4">
                <div class="information green_info">
                    <div class="information_inner">
                        <div class="info green_symbols">
                            <i class="fa fa-users icon"></i>
                        </div>
                        <h4>
                            Total Users</h4>
                        <h1 class="bolded">
                            <asp:Literal runat="server" ID="ltTotalUsers" /></h1>
                        <%--<div class="infoprogress_green">
                  <div class="greenprogress"></div>
                </div>--%>
                        <div class="infoprogress_green">
                            <div id="pUsers" runat="server" class="greenprogress" role="progressbar" aria-valuenow="45"
                                aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="information blue_info">
                    <div class="information_inner">
                        <div class="info blue_symbols">
                            <i class="fa fa fa-bullhorn icon"></i>
                        </div>
                        <h4>
                            Total Orders</h4>
                        <h1 class="bolded">
                            <asp:Literal runat="server" ID="ltTotalOrders" /></h1>
                        <div class="infoprogress_blue">
                            <div id="pOrders" runat="server" class="blueprogress" role="progressbar" aria-valuenow="45"
                                aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="information gray_info">
                    <div class="information_inner">
                        <div class="info gray_symbols">
                            <i class="fa fa-money icon"></i>
                        </div>
                        <h4>
                            Total Products
                        </h4>
                        <h1 class="bolded">
                            <asp:Literal runat="server" ID="ltTotalProducts" /></h1>
                        <div class="infoprogress_gray">
                            <div id="pProducts" runat="server" class="grayprogress" role="progressbar" aria-valuenow="45"
                                aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="information red_info">
                    <div class="information_inner">
                        <div class="info red_symbols">
                            <i class="fa fa-comments icon"></i>
                        </div>
                        <h4>
                            Total Feedbacks</h4>
                        <h1 class="bolded">
                            <asp:Literal runat="server" ID="ltTotalFeedback" /></h1>
                        <div class="infoprogress_red">
                            <div id="pFeedback" runat="server" class="redprogress" role="progressbar" aria-valuenow="45"
                                aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                            </div>
                        </div>
                    </div>
                </div>
                <section class="panel default blue_title h2">
          <div class="panel-heading">
           <h6 class="semi-bold">List of Feedback</h6> 
          </div>
          <div class="panel-body">
         
    <table class="table table-striped">
      <thead>
                    <th>#</th>
                    <th>Feedback</th>
                    <th>Response</th>
                    <th>Date</th>
                </thead>
                <tbody>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="upProducts" runat="server">
        <ContentTemplate>
                    <asp:ListView ID="lvFeedback" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                        ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("FeebackID") %></td>
                                <td><%# Eval("Feedback") %></td>
                                <td><%# Eval("Response") %></td>
                                <td><%# Eval("DateCreated", "{0: MMMM dd, yyyy}") %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="10">
                                    <h2 class="text-center">No records found.</h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvFeedback" PageSize="2">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" ButtonCssClass="btn btn-default btn-normal btn-inline"
                                        RenderNonBreakingSpacesBetweenControls="true" RenderDisabledButtonsAsLabels="false" />
                                    <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-success btn-normal btn-inline active"
                                        RenderNonBreakingSpacesBetweenControls="true" NumericButtonCssClass="btn btn-default btn-normal btn-inline"
                                        NextPreviousButtonCssClass="btn btn-default btn-normal btn-inline" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                        ShowPreviousPageButton="false" ButtonCssClass="btn btn-default btn-normal btn-inline"
                                        RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                </Fields>
                            </asp:DataPager>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                        </GroupTemplate>
                    </asp:ListView>
                        </ContentTemplate>
    </asp:UpdatePanel>
                </tbody>
    </table>
  
          </div>
          </section>
            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>
                            Categories</h4>
                    </div>
                    <div class="panel-body">
                        <div id="hero-donut" class="graph">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ">
                <div class="block-web green-bg-color">
                    <h3 class="content-header ">
                        Most Important Task</h3>
                    <div class="porlets-content">
                        <ul class="list-group task-list no-margin collapse in">
                            <li class="list-group-item green-light-bg-color">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" checked="" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                New frontend layout <span class="pull-right"><a class="task-del" href="#"><i class="fa fa-times">
                                </i></a></span></li>
                            <li class="list-group-item">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                Windows Phone App <span class="pull-right"><a class="task-del" href="#"><i class="fa fa-times">
                                </i></a></span></li>
                            <li class="list-group-item">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                Mobile Development <span class="pull-right"><a class="task-del" href="#"><i class="fa fa-times">
                                </i></a></span></li>
                            <li class="list-group-item">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                SEO Optimisation <span class="label label-warning m-left-xs">1:30PM</span> <span
                                    class="pull-right"><a class="task-del" href="#"><i class="fa fa-times"></i></a>
                                </span></li>
                            <li class="list-group-item">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                Windows Phone App <span class="pull-right"><a class="task-del" href="#"><i class="fa fa-times">
                                </i></a></span></li>
                            <li class="list-group-item">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="task-finish">
                                    <span class="custom-checkbox"></span>
                                </label>
                                Bug Fixes <span class="label label-danger m-left-xs">4:40PM</span> <span class="pull-right">
                                    <a class="task-del" href="#"><i class="fa fa-times"></i></a></span></li>
                            <form class="form-inline margin-top-10" role="form">
                            <input type="text" class="form-control" placeholder="Enter tasks here...">
                            <button class="btn btn-default btn-warning pull-right" type="submit">
                                <i class="fa fa-plus"></i>Add Task</button>
                            </form>
                        </ul>
                        <!-- /list-group -->
                    </div>
                    <!--/porlets-content-->
                </div>
                <!--/block-web-->
            </div>
        </div>
    </div>
    <div class="row">
        <!--/col-md-4-->
        <div class="col-md-4 ">
            <div class="block-web">
                <h3 class="content-header">
                    Note</h3>
                <div class="block widget-notes">
                    <div contenteditable="true" class="paper">
                        Send e-mail to supplier<br>
                        <s>Conference at 4 pm.</s><br>
                        <s>Order a pizza</s><br>
                        <s>Buy flowers</s><br>
                        Buy some coffee.<br>
                        Dinner at Plaza.<br>
                        Take Alex for walk.<br>
                        Buy some coffee.<br>
                    </div>
                </div>
                <!--/widget-notes-->
            </div>
            <!--/block-web-->
        </div>
        <!--/col-md-4 -->
        <div class="col-md-8 ">
            <div class="kalendar">
            </div>
            <div class="list-group">
                <a class="list-group-item" href="#"><span class="badge bg-danger">7:50</span> Consectetuer
                </a><a class="list-group-item" href="#"><span class="badge bg-success">10:30</span>
                    Lorem ipsum dolor sit amet </a><a class="list-group-item" href="#"><span class="badge bg-light">
                        11:40</span> Consectetuer adipiscing </a>
            </div>
            <!--/calendar end-->
        </div>
        <!--/col-md-4 end-->
    </div>
    <!--/row-->
    <div class="row">
        <div class="col-md-6">
            <div class="multi-stat-box">
                <div class="header">
                    <div class="left">
                        <h2>
                            Pageviews</h2>
                        <a><i class="fa fa-chevron-down"></i></a>
                    </div>
                    <div class="right">
                        <h2>
                            NOV 14 - DEC 15</h2>
                        <div class="percent">
                            <i class="fa fa-angle-double-down"></i>34%</div>
                    </div>
                </div>
                <div class="content">
                    <div class="left">
                        <ul>
                            <li><span class="date">Overall</span> <span class="value">1,104</span> </li>
                            <li class="active"><span class="date">This week</span> <span class="value">486</span>
                            </li>
                            <li><span class="date">Yesterday</span> <span class="value">364</span> </li>
                            <li><span class="date">Today</span> <span class="value">254</span> </li>
                        </ul>
                    </div>
                    <div class="right">
                        <div class="sparkline" data-type="line" data-resize="true" data-height="130" data-width="90%"
                            data-line-width="1" data-line-color="#ddd" data-spot-color="#ccc" data-fill-color=""
                            data-highlight-line-color="#ddd" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455,150,530,140]">
                        </div>
                        <div class="ticket-lebel">
                            SUN</div>
                        <div class="ticket-lebel">
                            MON</div>
                        <div class="ticket-lebel">
                            TUE</div>
                        <div class="ticket-lebel">
                            WED</div>
                        <div class="ticket-lebel">
                            THR</div>
                        <div class="ticket-lebel">
                            FRI</div>
                        <div class="ticket-lebel">
                            SAT</div>
                        <div class="ticket-lebel">
                            SUN</div>
                    </div>
                </div>
            </div>
            <br />
            <div class="panel">
                <div class="panel-body">
                    <div class="chart">
                        <div class="heading">
                            <span>June</span> <strong>15 Days | 57%</strong>
                        </div>
                        <div id="barchart">
                        </div>
                    </div>
                </div>
                <div class="chart-tittle">
                    <span class="title text-muted">Total Earning</span> <span class="value-pie text-muted">
                        $, 87,34,577</span>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>
                        Jaguar 'E' Type vehicles in the UK</h4>
                </div>
                <div class="panel-body">
                    <div id="hero-graph" class="graph">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--/row end-->
    <!--row start-->
    
    <!--row end-->
    </div>
</asp:Content>
