<%@ Page Title="" Language="C#" MasterPageFile="~/Business Site/Business.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IT191P_Project.Business_Site.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="banner" runat="server">
    <div class="container">
        <div class="row">
            <h1>Login Your Credentials</h1>
            <p>Input the authorized credentials to access the dashboard.</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="col-lg-12">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF6666" />
    </div>
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <label>Username</label>
        <asp:TextBox ID="txtUsername" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" Display="Dynamic"><img src="/images/Error-128.png" title="Username is required"  height="16" width="16"/></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvUserExist" runat="server" ErrorMessage="Username or Password is incorrect" ControlToValidate="txtUsername" Display="Static"><img src="/images/Error-128.png" title="Username already exists"  height="16" width="16"/></asp:CustomValidator>
        <br />
        <label>Password</label>
        <asp:TextBox ID="txtPassword" type="password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Display="Dynamic"><img src="/images/Error-128.png" title="Password is required"  height="16" width="16"/></asp:RequiredFieldValidator>
        <br />
        <asp:Button CssClass="btn btn-success btn-block" runat="server" Text="Login"  ID="btnLogin" OnClick="btnLogin_Click"/>
        <br />
        <asp:Button CssClass="btn btn-danger btn-block" runat="server" Text="Clear"  ID="btnClear" OnClick="btnClear_Click"/>
    </div>
    <div class="col-lg-4"></div>
</asp:Content>
