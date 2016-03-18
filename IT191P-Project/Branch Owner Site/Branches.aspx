<%@ Page Title="" Language="C#" MasterPageFile="~/Branch Owner Site/BranchOwner.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="IT191P_Project.Branch_Owner_Site.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">My Branches</h1>

    <div class="col-lg-2">
        <asp:DropDownList CssClass="form-control" ID="ddlSearchType" runat="server">
             <asp:ListItem>ID</asp:ListItem>
             <asp:ListItem>Location</asp:ListItem>
             <asp:ListItem>Branch Manager</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group input-group col-lg-10">
        <asp:TextBox type="text" ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
        <span class="input-group-btn">
            <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
        </span>
    </div>

    <div>
        <asp:GridView ID="gvMyBranch" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="BranchOwnerDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                <asp:BoundField DataField="Manager" HeaderText="Manager" ReadOnly="True" SortExpression="Manager" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="BranchOwnerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
            SelectCommand="SELECT BRANCH.ID, BRANCH.LOCATION, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Manager] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_MANAGERID=[USER].ID WHERE BRANCH.BR_OWNERID=@id">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
