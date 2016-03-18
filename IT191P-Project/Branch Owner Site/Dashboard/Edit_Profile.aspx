<%@ Page Title="" Language="C#" MasterPageFile="~/Branch Owner Site/BranchOwner.Master" AutoEventWireup="true" CodeBehind="Edit_Profile.aspx.cs" Inherits="IT191P_Project.Branch_Owner_Site.Edit_Profile" %>
<%@ MasterType  virtualPath="~/Branch Owner Site/BranchOwner.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="col-lg-12">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Check the following errors in your input:" ForeColor="#FF6666" />
    </div>
    <!-- =====PERSONAL DETAILS===== -->
    <div class="col-lg-4">
        <h4 class="page-header">Personal Details</h4>
    
        <label>Last Name</label>
            <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexLName" runat="server" ErrorMessage="Last Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtLName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>
        
        <br />
           
        <label>First Name</label>
            <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexFName" runat="server" ErrorMessage="First Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtFName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>

        <br />

        <label>Middle Name</label>
            <asp:TextBox ID="txtMName" CssClass="form-control" runat="server" placeholder="Middle Name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexMName" runat="server" ErrorMessage="Middle Name must only contain letters" ValidationExpression="[a-zA-Z ]+" ControlToValidate="txtMName" Display="Dynamic"><img src="/images/Error-128.png" title="Only letters are allowed" height="16" width="16"/></asp:RegularExpressionValidator>

        <br />


        <label> Contact Number: </label>
            <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" placeholder="09 xxx xxx xxx"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexMobileNo" runat="server" ErrorMessage="Mobile No. must only contain numbers and must have 11 digits" ValidationExpression="[0-9]{11}" ControlToValidate="txtContact" Display="Dynamic"><img src="/images/Error-128.png" title="Only numbers are allowed and must meet the minimum of 11 digits" height="16" width="16"/></asp:RegularExpressionValidator>

        <br />

        <label> Email Address: </label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="johndoe@sample.com"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexEmail" runat="server" ErrorMessage="Email field must be in correct format" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" Display="Dynamic"><img src="/images/Error-128.png" title="Email field must be in correct format" height="16" width="16"/></asp:RegularExpressionValidator>

        <br />

        <label>Sex</label>
            <div class="radio">
                <label><input type="radio" class="radio" name="rdbtnSex" ID="rdbtnMale" runat="server" value="M" checked="true"/> Male &nbsp; &nbsp;</label>
                <label><input type="radio" class="radio" name="rdbtnSex" ID="rdbtnFemale" runat="server" value="F"/> Female</label>
            </div>
    </div>
   
    

    <!-- =====USER DETAILS===== -->
    <div class="col-lg-4">
        <h4 class="page-header">User Details</h4>   
        <label>Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
            <asp:CustomValidator ID="cvUserExist" runat="server" ErrorMessage="Username already exists" ControlToValidate="txtUsername" Display="Static"><img src="/images/Error-128.png" title="Username already exists"  height="16" width="16"/></asp:CustomValidator>
            <br />
            <label>Password</label>
            <asp:TextBox type="password" ID="txtPassword" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
            
            <br />
            <label>Re-Enter Password</label>
            <asp:TextBox type="password" ID="txtRePass" CssClass="form-control" runat="server" placeholder="Re-enter Password"></asp:TextBox><br />
            <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtRePass" ControlToValidate="txtPassword" Display="Dynamic"><img src="/images/Error-128.png" title="Passwords do not match"  height="16" width="16"/></asp:CompareValidator>
            <br />
    </div>
    


    <!-- =====PROFILE PIC===== -->
    <div class="col-lg-4">
        <h4 class="page-header">Profile Picture</h4>  
        <img title="Profile pic" alt="Profile Pic" class="img-thumbnail" src="#" id="imgProfile" runat="server" style="visibility:hidden;" height="250" width="250"/> 
        <asp:FileUpload ID="fluploadPic" runat="server" />
        <br />
        
        <asp:Button CssClass="btn btn-default btn-block" ID="btnUpload" runat="server" Text="Upload" CausesValidation="False" OnClick="btnUpload_Click" />
        <br />
        
    </div>
    <!-- =====SUBMIT DETAILS===== -->
    <div class="col-lg-12">
        <hr />
    </div>
    <div class="col-lg-2">


   
    </div>
    <div class="col-lg-8">
        <asp:Button CssClass="btn btn-success btn-block" ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click"/>
        <asp:Button CssClass="btn btn-danger btn-block" ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
    </div>
    <div class="col-lg-2">
        
    </div>
</asp:Content>
