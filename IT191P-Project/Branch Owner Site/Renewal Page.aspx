<%@ Page Title="" Language="C#" MasterPageFile="~/Branch Owner Site/BranchOwner.Master" AutoEventWireup="true" CodeBehind="Renewal Page.aspx.cs" Inherits="IT191P_Project.Branch_Owner_Site.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Request for Renewal</h1>
    <br />
    <h3 class="page-header">Renewal of Franchise License</h3>
    <label>Renew License to which branch?</label>
    <asp:DropDownList ID="ddlBranches" runat="server" DataSourceID="AssignDataSource" DataTextField="LOCATION" DataValueField="ID" AutoPostBack="True"  AppendDataBoundItems="True" OnSelectedIndexChanged="ddlBranches_SelectedIndexChanged">
        <asp:ListItem>Select Branch</asp:ListItem>
    </asp:DropDownList>

    &nbsp;<asp:Label ID="lblExpiry" runat="server"></asp:Label>
&nbsp;<asp:SqlDataSource ID="AssignDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT * FROM [BRANCH] WHERE ([BR_OWNERID] = @BR_OWNERID)">
        <SelectParameters>
            <asp:SessionParameter Name="BR_OWNERID" SessionField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Years need to be added: "></asp:Label>
&nbsp;<asp:TextBox ID="txtYrs" runat="server" type="number" Width="77px"></asp:TextBox>
    <br />
    <br />
    <br />

    <br />
    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" Text="Submit Request" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />
    
</asp:Content>

