<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="ApprovedPaid.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Franchising</h1>

    <h3 class="page-header">Approved Request for Franchise</h3>
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
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                <asp:BoundField DataField="years" HeaderText="years" SortExpression="years" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsRequests" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT ReqStatFranch.id, [USER].LNAME+','+[USER].FNAME+' '+[USER].LNAME as Name, ReqStatFranch.location, ReqStatFranch.years
FROM ReqStatFranch 
INNER JOIN [USER]
ON ReqStatFranch.userid=[USER].ID
where ReqStatFranch.stat=1;"></asp:SqlDataSource>

        Walang notif after confirm or deny<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
    </p>
    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block" Text="Confirm Payment" runat="server" OnClick="btnAdd_Click" />
    <br />
    <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Deny Requests" runat="server" OnClick="btnClear_Click" />

</asp:Content>

