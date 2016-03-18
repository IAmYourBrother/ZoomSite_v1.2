<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="RenewalRequest.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Renewal Requests</h1>

    <h3 class="page-header">&nbsp;</h3>
    &nbsp;<br />
    <p>
        <asp:GridView ID="gvRequests" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsRequests" Height="100px" Width="595px">
            <Columns>
                <asp:templatefield HeaderText="Select">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" CssClass="gridCB" runat="server"></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="BranchID" HeaderText="BranchID" SortExpression="BranchID" />
                <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />

                <asp:BoundField DataField="years" HeaderText="years" SortExpression="years" />

                <asp:BoundField DataField="Expiry" HeaderText="Expiry" SortExpression="Expiry" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsRequests" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="Select renewalRequests.id, BRANCH.BranchID, BRANCH.LOCATION,[USER].LNAME+', '+[USER].FNAME+' '+[USER].MNAME as Name, renewalRequests.years, Franchise.FR_END as Expiry
From renewalRequests 
Inner join [BRANCH]
on renewalRequests.brID=BRANCH.ID
Inner join [USER]
on Branch.BR_OWNERID=[USER].ID
Inner join [FRANCHISE]
on  Branch.id =Franchise.Branch_ID"></asp:SqlDataSource>

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        Walang notif after confirm or deny<br />
    </p>
    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" Text="Confirm Requests" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Deny Requests" runat="server" OnClick="btnClear_Click" />

</asp:Content>