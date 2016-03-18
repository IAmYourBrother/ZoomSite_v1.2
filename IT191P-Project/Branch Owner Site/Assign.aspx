<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Branch Owner Site/BranchOwner.Master" CodeBehind="Assign.aspx.cs" Inherits="IT191P_Project.Branch_Owner_Site.Assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Assign and Create Branch Manager</h1>
    <br />
    <h3 class="page-header">Personal Information</h3>
    <label>Assign to which branch?</label>
    <asp:DropDownList ID="ddlAssign" runat="server" DataSourceID="AssignDataSource" DataTextField="LOCATION" DataValueField="LOCATION"></asp:DropDownList>

    <asp:SqlDataSource ID="AssignDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT BRANCH.LOCATION
FROM BRANCH
WHERE BRANCH.BR_OWNERID=@id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
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
    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" Text="Add Branch Manager" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />
    
</asp:Content>
