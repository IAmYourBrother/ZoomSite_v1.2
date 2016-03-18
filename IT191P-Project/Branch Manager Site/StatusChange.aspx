<%@ Page Title="" Language="C#" MasterPageFile="~/Branch Manager Site/BranchManager.Master" AutoEventWireup="true" CodeBehind="StatusChange.aspx.cs" Inherits="IT191P_Project.Branch_Manager_Site.StatusChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Check Package Transactions</h1>
    <div class="col-lg-12">
        <asp:GridView ID="gvStatus" runat="server" AutoGenerateColumns="False" 
            DataSourceID="StatusChangeSqlDataSource" OnRowCommand="gvStatus_RowCommand" DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="TRANSACTION_ID" HeaderText="TRANSACTION_ID" SortExpression="TRANSACTION_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" ReadOnly="True" />
                <asp:BoundField DataField="SOURCE_BRANCH_ID" HeaderText="SOURCE_BRANCH_ID" SortExpression="SOURCE_BRANCH_ID" />
                <asp:BoundField DataField="DESTINATION_BRANCH_ID" HeaderText="DESTINATION_BRANCH_ID" SortExpression="DESTINATION_BRANCH_ID" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnOnHand" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="StatusOnHand" runat="server" Text="On Hand" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnDelivered" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="StatusDelivered" runat="server" Text="Delivered" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns></asp:GridView>
        <asp:SqlDataSource ID="StatusChangeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [TRANSACTION].[ID], [TRANSACTION].[TRANSACTION_ID], [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS NAME, [TRANSACTION].[SOURCE_BRANCH_ID], [TRANSACTION].[DESTINATION_BRANCH_ID], [TRANSACTION].[STATUS], [TRANSACTION].[TYPE] 
FROM [TRANSACTION]
INNER JOIN [USER]
ON [TRANSACTION].CUSTOMER_ID = [USER].ID 
ORDER BY ID"></asp:SqlDataSource>
    </div>
    <div class="col-lg-12">
    </div>
</asp:Content>
