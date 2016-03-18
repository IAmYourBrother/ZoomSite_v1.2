<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Update Branch</h1>
    Search:&nbsp;
    <asp:TextBox ID="txtSearchBranch" placeholder="Search ID..." runat="server" OnTextChanged="txtSearchBranch_TextChanged"></asp:TextBox>
    <asp:GridView ID="gvBranch" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="BranchDataSource" OnRowDeleted="gvBranch_RowDeleted" OnRowUpdated="gvBranch_RowUpdated">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
            <asp:TemplateField HeaderText="BR_MANAGERID" SortExpression="BR_MANAGERID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlManagerID" runat="server" DataSourceID="ManagerDataSource" DataTextField="BR_MANAGERID" DataValueField="BR_MANAGERID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ManagerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [BR_MANAGERID] FROM [BRANCH]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BR_MANAGERID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Manager" HeaderText="Manager" ReadOnly="True" SortExpression="Manager" />
            <asp:TemplateField HeaderText="BR_OWNERID" SortExpression="BR_OWNERID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOwnerID" runat="server" DataSourceID="OwnerDataSource" DataTextField="BR_OWNERID" DataValueField="BR_OWNERID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="OwnerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [BR_OWNERID] FROM [BRANCH]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("BR_OWNERID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Branch Owner" HeaderText="Branch Owner" ReadOnly="True" SortExpression="Branch Owner" />
            <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" OnClientClick="return confirm('Are you really really sure to update this item?');"></asp:Button> &nbsp;
                                <asp:Button ID="LinkButton2" runat="server" CausesValidation="False" 
                                     CommandName="Cancel" Text="Cancel"></asp:Button>
                                </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="LinkButton3" runat="server" CausesValidation="False" 
                                     CommandName="Edit" Text="Edit" ></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="LinkButton4" runat="server" CausesValidation="False" 
                                     CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you really really sure to delete this item?');"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No Data Found!
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="BranchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
        SelectCommand="SELECT BRANCH.ID, BRANCH.LOCATION, BRANCH.BR_MANAGERID, USER_1.LNAME + ', ' + USER_1.FNAME + 
            ' ' + USER_1.MNAME AS Manager, BRANCH.BR_OWNERID, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS 
            [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON 
            BRANCH.BR_MANAGERID = USER_1.ID" 
        UpdateCommand="UPDATE BRANCH SET LOCATION=@LOCATION, BR_MANAGERID=@BR_MANAGERID, BR_OWNERID=@BR_OWNERID 
            WHERE ID=@ID" 
        DeleteCommand="DELETE FROM BRANCH WHERE ID = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LOCATION" />
            <asp:Parameter Name="BR_MANAGERID" />
            <asp:Parameter Name="BR_OWNERID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
