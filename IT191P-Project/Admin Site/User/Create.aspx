<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Create Users</h1>
    <br />
    <h3 class="page-header">Personal Information</h3>
    <label>Last Name</label>
    <asp:TextBox type="text" ID="txtLast" CssClass="form-control" runat="server"></asp:TextBox>

    <label>First Name</label>
    <asp:TextBox type="text" ID="txtFirst" CssClass="form-control" runat="server"></asp:TextBox>

    <label>Middle Name</label>
    <asp:TextBox type="text" ID="txtMiddle" CssClass="form-control" runat="server"></asp:TextBox>

    <label>E-mail</label>
    <asp:TextBox type="text" ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>

    <label>Sex</label>
    <asp:RadioButtonList ID="rblSex" runat="server">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>

    <label>Mobile Number</label>
    <asp:TextBox type="text" ID="txtMobileNo" CssClass="form-control" runat="server"></asp:TextBox>

    <label>User Type</label>
    <br />
    <asp:DropDownList ID="ddlRole" runat="server">
        <asp:ListItem>Branch Owner</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
    </asp:DropDownList>
    <br />
    <label>Upload Picture</label>
    <asp:FileUpload ID="picUpload" runat="server" />


    <br />
    <br />
    <h3 class="page-header">Login Information</h3>
    <label>Username</label>
    <asp:TextBox type="text" ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>

    <label>Password</label>
    <asp:TextBox type="password" ID="txtPass" CssClass="form-control" runat="server"></asp:TextBox>

    <label>Re-Enter Password</label>
    <asp:TextBox type="password" ID="txtRePass" CssClass="form-control" runat="server"></asp:TextBox>

    <br />
    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" Text="Add User" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />
    
</asp:Content>
