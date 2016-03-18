<%@ Page Title="" Language="C#" MasterPageFile="~/Customer Site/CustomerSite.Master" AutoEventWireup="true" CodeBehind="TrackMoney.aspx.cs" Inherits="IT191P_Project.Customer_Site.TrackMoney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
     <h1 class="page-header">Check Package Transactions</h1>
    <div class="col-lg-2">
            <asp:DropDownList CssClass="form-control" ID="ddlSearchType" runat="server" placeholder="Search by:">
                 <asp:ListItem Value="1">ID</asp:ListItem>
                 <asp:ListItem Value="2">Source Branch</asp:ListItem>
                 <asp:ListItem Value="3">Destination Branch</asp:ListItem>
                 <asp:ListItem Value="4">Status</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="form-group input-group col-lg-10">
                <asp:TextBox type="text" ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
            </div>
    <div class="col-lg-12">
        <asp:GridView ID="gvCheckMoney" runat="server" AutoGenerateColumns="False" DataSourceID="CheckMoneySqlDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="TRANSACTION_ID" HeaderText="TRANSACTION_ID" SortExpression="TRANSACTION_ID" />
                <asp:BoundField DataField="TRACKING_NO" HeaderText="TRACKING_NO" SortExpression="TRACKING_NO" />
                <asp:BoundField DataField="SOURCE_BRANCH_ID" HeaderText="SOURCE_BRANCH_ID" SortExpression="SOURCE_BRANCH_ID" />
                <asp:BoundField DataField="DESTINATION_BRANCH_ID" HeaderText="DESTINATION_BRANCH_ID" SortExpression="DESTINATION_BRANCH_ID" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:BoundField DataField="PAYMENT" HeaderText="PAYMENT" SortExpression="PAYMENT" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CheckMoneySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
            SelectCommand="SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, PAYMENT FROM [TRANSACTION] WHERE CUSTOMER_ID = @id AND TYPE = 'Money'">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
