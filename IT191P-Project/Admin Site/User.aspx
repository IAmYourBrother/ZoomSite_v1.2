<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Current Users</h1>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="col-lg-2">
            <asp:DropDownList CssClass="form-control" ID="ddlSearchType" runat="server" placeholder="Search by:">
                 <asp:ListItem Value="1">ID</asp:ListItem>
                 <asp:ListItem Value="2">Last Name</asp:ListItem>
                 <asp:ListItem Value="3">User Type</asp:ListItem>
                 <asp:ListItem Value="4">Sex</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="form-group input-group col-lg-10">
                <asp:TextBox type="text" ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                <span class="input-group-btn">
                    <button id="btnSearch" class="btn btn-default" type="button" ><i class="fa fa-search"></i></button>
                </span>
            </div>

            <div class="col-lg-12">
                <asp:GridView CssClass="table table-bordered table-hover table-striped" ID="gvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceUser" PageSize="20">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="LNAME" HeaderText="LNAME" SortExpression="LNAME" />
                        <asp:BoundField DataField="FNAME" HeaderText="FNAME" SortExpression="FNAME" />
                        <asp:BoundField DataField="MNAME" HeaderText="MNAME" SortExpression="MNAME" />
                        <asp:BoundField DataField="EMAIL_ADD" HeaderText="EMAIL_ADD" SortExpression="EMAIL_ADD" />
                        <asp:BoundField DataField="MOBILE_NO" HeaderText="MOBILE_NO" SortExpression="MOBILE_NO" />
                        <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
                        <asp:BoundField DataField="USERTYPE" HeaderText="USERTYPE" SortExpression="USERTYPE" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
                    SelectCommand="SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER]"></asp:SqlDataSource>

            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
    

    
</asp:Content>
