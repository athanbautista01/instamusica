<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Deliveries_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    My Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="men">
        <div class="container-fluid">
            <div class="wish-list">
                <h1 class="text-center">My Profile
		    
                </h1>
            </div>
            <br />
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">Email Address</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextEmail" runat="server" type="email" class="form-control"
                            required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Password</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextPassword" runat="server" type="password"
                            class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">First Name</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextFirstName" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Last Name</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextLastName" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Street</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextStreet" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>


            <div class="col-lg-6">

                <div class="form-group">
                    <label class="control-label col-lg-4">Municipality</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextMunicipality" runat="server" type="email"
                            class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">City</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextCity" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Phone</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextPhone" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Mobile</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="TextMobile" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:LinkButton ID="btnBack" runat="server" class="btn btn-primary6 pull-right" OnClick="btnBack_Click">
                        <i class="fa fa-plus"></i> Back
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEdit" runat="server" class="btn btn-primary3 pull-right" OnClick="btnEdit_Click">
                        <i class="fa fa-plus"></i> Edit
                        </asp:LinkButton>
                        <br />
                        
                    <div id="update" runat="server" class="alert alert-success col-lg-12" visible="false">
                        Profile has been Updated
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

