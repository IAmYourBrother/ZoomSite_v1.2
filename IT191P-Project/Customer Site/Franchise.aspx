<%@ Page Title="" Language="C#" MasterPageFile="~/Customer Site/CustomerSite.Master" AutoEventWireup="true" CodeBehind="Franchise.aspx.cs" Inherits="IT191P_Project.Customer_Site.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">'
     <h1 class="page-header">Apply for Franchise</h1>
    <br />
    <h3 class="page-header">Franchise Form</h3>
    &nbsp;Provincial Franchise: Php 380,000 per year<br />
&nbsp;Metro Manila Franchise: Php 450,000 per year<br />
    <br />
&nbsp; <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="Location: "></asp:Label>
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="Address: "></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtAddress" runat="server" Height="22px" Width="268px"></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp; City/Town:&nbsp;
    <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="dsCity" DataTextField="Citytown" DataValueField="Code" Height="72px" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" Width="187px" AutoPostBack="True" AppendDataBoundItems="True">
        <asp:ListItem>Select City/Town</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT * FROM [CITYTOWN]"></asp:SqlDataSource>
    <br />
&nbsp;Years of License:
    <asp:TextBox ID="txtYears" runat="server" Width="44px" OnTextChanged="txtYears_TextChanged" type="number" AutoPostBack="True"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtYears" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
    <br />
    <br />
    &nbsp;<asp:Label ID="Label3" runat="server" Text="Franchise Cost: Php"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblCost" runat="server">0.00</asp:Label>
    <br />
    &nbsp;<br />

    <asp:Button ID="btnSaveTrans" CssClass="btn btn-success btn-block" Text="Submit Application" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />
</asp:Content>
