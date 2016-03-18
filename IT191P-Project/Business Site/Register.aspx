<%@ Page Title="" Language="C#" MasterPageFile="~/Business Site/Business.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="IT191P_Project.Business_Site.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    Register
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="banner" runat="server">
    <div class="container">
        <div class="row">
            <h1>Register An Account</h1>
            <p>Creating an account is free, using our services isn't.</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="col-lg-12">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Check the following errors in your input:" ForeColor="#FF6666" />
    </div>
    <!-- =====PERSONAL DETAILS===== -->
    <div class="col-lg-8">
        <h4 class="page-header">Personal Details</h4>
    
        <div class="col-lg-4">
            <label>Last Name</label>
            <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtLName" Display="Dynamic"><img src="/images/Error-128.png" title="Last Name is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexLName" runat="server" ErrorMessage="Last Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtLName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>
        </div>
        <div class="col-lg-4">
            <label>First Name</label>
            <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="First Name is required" ControlToValidate="txtFName" Display="Dynamic"><img src="/images/Error-128.png" title="First Name is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexFName" runat="server" ErrorMessage="First Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtFName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>
        </div>
        <div class="col-lg-4">
            <label>Middle Name</label>
            <asp:TextBox ID="txtMName" CssClass="form-control" runat="server" placeholder="Middle Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMName" runat="server" ErrorMessage="Middle Name is required" ControlToValidate="txtMName" Display="Dynamic"><img src="/images/Error-128.png" title="Middle Name is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexMName" runat="server" ErrorMessage="Middle Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtMName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>
        </div>
        <div class="col-lg-12">
        <br/ />
        </div>

        <div class="col-lg-4">
            <label> Contact Number: </label>
            <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" placeholder="09 xxx xxx xxx"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ErrorMessage="Mobile No. is required" ControlToValidate="txtContact" Display="Dynamic"><img src="/images/Error-128.png" title="Mobile Number is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexMobileNo" runat="server" ErrorMessage="Mobile No. must only contain numbers and must have 11 digits" ValidationExpression="[0-9]{11}" ControlToValidate="txtContact" Display="Dynamic"><img src="/images/Error-128.png" title="Only numbers are allowed and must meet the minimum of 11 digits" height="16" width="16"/></asp:RegularExpressionValidator>
        </div>
        <div class="col-lg-4">
            <label> Email Address: </label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="johndoe@sample.com"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" Display="Dynamic"><img src="/images/Error-128.png" title="Email is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexEmail" runat="server" ErrorMessage="Email field must be in correct format" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" Display="Dynamic"><img src="/images/Error-128.png" title="Email field must be in correct format" height="16" width="16"/></asp:RegularExpressionValidator>
        </div>
        <div class="col-lg-4">
            <label>Sex</label>
            <div class="radio">
                <label><input type="radio" class="radio" name="rdbtnSex" ID="rdbtnMale" runat="server" value="M" checked="true"/> Male &nbsp; &nbsp;</label>
                <label><input type="radio" class="radio" name="rdbtnSex" ID="rdbtnFemale" runat="server" value="F"/> Female</label>
            </div>
        </div>
    </div>
   
    

    <!-- =====USER DETAILS===== -->
    <div class="col-lg-4">
        <h4 class="page-header">User Details</h4>   
        <div class="col-lg-10">
            <label>Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" Display="Dynamic"><img src="/images/Error-128.png" title="Username is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="cvUserExist" runat="server" ErrorMessage="Username already exists" ControlToValidate="txtUsername" Display="Static"><img src="/images/Error-128.png" title="Username already exists"  height="16" width="16"/></asp:CustomValidator>
            <br />
            <label>Password</label>
            <asp:TextBox type="password" ID="txtPassword" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtUsername" Display="Dynamic"><img src="/images/Error-128.png" title="Password is required"  height="16" width="16"/></asp:RequiredFieldValidator>
            
            <br />
            <label>Re-Enter Password</label>
            <asp:TextBox type="password" ID="txtRePass" CssClass="form-control" runat="server" placeholder="Re-enter Password"></asp:TextBox><br />
            <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtRePass" ControlToValidate="txtPassword" Display="Dynamic"><img src="/images/Error-128.png" title="Passwords do not match"  height="16" width="16"/></asp:CompareValidator>
            <br />
        </div>
        <div class="col-lg-2">

        </div>

    </div>
    
     <!-- =====SUBMIT DETAILS===== -->
    <div class="col-lg-2">


   
    </div>
    <div class="col-lg-8">
        <asp:Button CssClass="btn btn-success btn-block" ID="btnRegister" Text="Register" runat="server" OnClick="btnRegister_Click" />
        <asp:Button CssClass="btn btn-danger btn-block" ID="btnClear" Text="Clear" runat="server" OnClick="btnClear_Click" />
    </div>
    <div class="col-lg-2">
        
    </div>
</asp:Content>
