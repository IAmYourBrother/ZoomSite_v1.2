<%@ Page Title="" Language="C#" MasterPageFile="~/Customer Site/CustomerSite.Master" AutoEventWireup="true" CodeBehind="SendMoney.aspx.cs" Inherits="IT191P_Project.Customer_Site.SendMoney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
            <h1 class="page-header">Send Money</h1>
            <br />
            <h3 class="page-header">&nbsp;Money Transfer Details</h3>
            <label>Transaction ID</label>
            <asp:Label ID="lblTransID" runat="server"></asp:Label>
               <br />
            <br />
    

            <asp:SqlDataSource ID="dsAddress" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [addr], [id] FROM [customerAddress] WHERE ([custID] = @custID)">
                   <SelectParameters>
                       <asp:SessionParameter Name="custID" SessionField="ID" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>


        <asp:DropDownList ID="ddlAddress" runat="server" DataSourceID="dsAddress" DataTextField="addr" DataValueField="id" Width="637px" AppendDataBoundItems="True" AutoPostBack="True">
               <asp:ListItem>Select Source Address</asp:ListItem>
               </asp:DropDownList>


               Destination:<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City/Town :<asp:DropDownList ID="ddlCity" runat="server" DataSourceID="dsCity" DataTextField="Citytown" DataValueField="Code" Width="166px" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AppendDataBoundItems="True" >
        <asp:ListItem>Select City/Town</asp:ListItem>       
        </asp:DropDownList>
               <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT * FROM [CITYTOWN]"></asp:SqlDataSource>
               <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Branch:<asp:DropDownList ID="ddlBranch" runat="server" AppendDataBoundItems="True" DataSourceID="dsBranch" DataTextField="LOCATION" DataValueField="BranchID">
        <asp:ListItem>Select Branch</asp:ListItem>        
        </asp:DropDownList>
               <asp:SqlDataSource ID="dsBranch" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [BranchID], [LOCATION] FROM [BRANCH]">
               </asp:SqlDataSource>
               <br />
               <br />
               Amount:<br />
        &nbsp;&nbsp;
               <asp:TextBox ID="txtAmount" runat="server" Width="320px" type="number" OnTextChanged="txtAmount_TextChanged"></asp:TextBox>
               <br />
               <br />
               Name of receiver:<br />
               <asp:TextBox ID="txtName" runat="server" Width="320px"></asp:TextBox>
               <br />
               <br />
               <br />
               <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
               <br />
               Additional Charge: <asp:TextBox ID="txtTotal" runat="server" Enabled="False" OnTextChanged="txtTotal_TextChanged"></asp:TextBox>
               <br />
               <br />

            <asp:Button ID="btnSaveTrans" CssClass="btn btn-success btn-block" Text="Save Transaction" runat="server" OnClick="btnAdd_Click" />
            <br />
            <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />

</asp:Content>
