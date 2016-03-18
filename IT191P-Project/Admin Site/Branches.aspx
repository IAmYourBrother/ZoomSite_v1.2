<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Current Branches</h1>

    <div class="col-lg-2">
        <asp:DropDownList CssClass="form-control" ID="ddlSearchType" runat="server">
             <asp:ListItem>ID</asp:ListItem>
             <asp:ListItem>Location</asp:ListItem>
             <asp:ListItem>Branch Manager</asp:ListItem>
             <asp:ListItem>Branch Owner</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group input-group col-lg-10">
        <asp:TextBox type="text" ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
        <span class="input-group-btn">
            <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
        </span>
    </div>

    <div>
        <asp:GridView ID="gvBranches" runat="server" DataSourceID="BranchDataSource" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                <asp:BoundField DataField="Manager" HeaderText="Manager" ReadOnly="True" SortExpression="Manager" />
                <asp:BoundField DataField="Branch Owner" HeaderText="Branch Owner" ReadOnly="True" SortExpression="Branch Owner" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="BranchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT BRANCH.ID, BRANCH.LOCATION, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner]
FROM BRANCH
INNER JOIN [USER]
ON BRANCH.BR_OWNERID=[USER].ID 
INNER JOIN [USER] AS USER_1
ON BRANCH.BR_MANAGERID = USER_1.ID"></asp:SqlDataSource>
    </div>

    
</asp:Content>
