<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Dashboard</h1>
    <div class="col-lg-12">
        <div class="col-lg-3">
            <br />
            <img id="imgProfile" class="img-thumbnail" title="Profile Pic" alt="Profile Pic"  src="/images/pot_default.jpg" height="250" width="250" runat="server"/>
            <br />
            <br />
            <asp:Button CssClass="btn btn-default btn-block" ID="btnSettings" runat="server" Text="Edit Profile" OnClick="btnSettings_Click" />
        </div>
        <div class="col-lg-9">
            <h3 runat="server">Personal Details</h3>
            <hr />
            <label id="lblGenderPrefix" runat="server">(Mr. / Mrs. / Ms)</label>
            <label id="lblLastName" runat="server">(Last Name of User) ,</label>
            <label id="lblFirstName" runat="server">(First Name of User)</label>
            <label id="lblMiddleName" runat="server">(Middle Name of User)</label>
            <br />
            Contact No: <label id="lblContact" runat="server">(09xxxxxxxxxxx)</label><br />
            Email Address: <label id="lblEmail" runat="server">johndoe@sample.com</label><br />
            Account Level: <label id="lblAccountType" runat="server">(Admin / Employee / Customer)</label>
            <br />
            <br />
        </div>
        
        
        
    </div>
    
</asp:Content>
