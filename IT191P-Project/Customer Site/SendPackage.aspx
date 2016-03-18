<%@ Page Title="" Language="C#" MasterPageFile="~/Customer Site/CustomerSite.Master" AutoEventWireup="true" CodeBehind="SendPackage.aspx.cs" Inherits="IT191P_Project.Customer_Site.SendPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>   
            <h1 class="page-header">Send Package</h1>
             <br />
             <h3 class="page-header">Package Details</h3>
            <label>Transaction ID</label>
            <asp:Label ID="lblTransID" runat="server" Text="Label"></asp:Label>
               <br />
               <br />
               Package box:
               <asp:DropDownList ID="DropDownList3" runat="server" Height="21px" Width="144px" AppendDataBoundItems="True">
                   <asp:ListItem>Select Box Size</asp:ListItem>
                   <asp:ListItem>12x10x5 Inches</asp:ListItem>
                   <asp:ListItem>14x10.5x7 Inches</asp:ListItem>
                   <asp:ListItem>18x12x9 Inches</asp:ListItem>
                   <asp:ListItem>20x16x12 Inches</asp:ListItem>
               </asp:DropDownList>
               <br />
            <br />
            <label>Package Weight (kg.)</label>
            <asp:TextBox type="number" ID="txtWeight" CssClass="form-control" AutoPostBack="True" runat="server" OnTextChanged="txtWeight_TextChanged"></asp:TextBox>
    
               <br />
            <label>Source Address:&nbsp;&nbsp;
               <asp:DropDownList ID="ddlAddress" runat="server" DataSourceID="dsAddress" DataTextField="addr" DataValueField="id" OnSelectedIndexChanged="ddlAddress_SelectedIndexChanged" Width="637px" AppendDataBoundItems="True" AutoPostBack="True" Height="44px">
               <asp:ListItem>Select Source Address</asp:ListItem>
               </asp:DropDownList>
        &nbsp;
               <asp:LinkButton ID="lbNewAdd" runat="server" OnClick="lbNewAdd_Click">New Address</asp:LinkButton>
               </label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Complete Address:&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:TextBox ID="txtSrcAdr" runat="server" Width="417px"></asp:TextBox>
               <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City/Town:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:DropDownList ID="ddlSrcCity" runat="server" DataSourceID="dsCityTown" DataTextField="Citytown" DataValueField="Code" Width="138px" AppendDataBoundItems="True">
               <asp:ListItem>Select City/Town</asp:ListItem>
               </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
               <asp:LinkButton ID="lbAddAdr" runat="server" OnClick="lbAddAdr_Click">Add Address</asp:LinkButton>
        &nbsp;<asp:SqlDataSource ID="dsCityTown" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [Code], [Citytown] FROM [CITYTOWN]"></asp:SqlDataSource>
               <br />
               Destination Address: <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Complete Address:&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:TextBox ID="txtDesAdr" runat="server" Width="417px"></asp:TextBox>
               <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City/Town:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:DropDownList ID="ddlDesCity" runat="server" DataSourceID="dsCityTown" DataTextField="Citytown" DataValueField="Code" Width="138px" AppendDataBoundItems="True">
               <asp:ListItem>Select City/Town</asp:ListItem>
               </asp:DropDownList>
               <br />
               <br />
               <br />
            <label>Package Description:&nbsp;&nbsp;&nbsp;&nbsp; </label>
               <asp:SqlDataSource ID="dsAddress" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT [addr], [id] FROM [customerAddress] WHERE ([custID] = @custID)">
                   <SelectParameters>
                       <asp:SessionParameter Name="custID" SessionField="ID" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>
        &nbsp;<br />
            <asp:TextBox type="text" ID="txtDesc" CssClass="form-control" runat="server" Height="121px" TextMode="MultiLine" Width="349px"></asp:TextBox>
            <br />
            <label>Amount</label> 
            <asp:TextBox type="text" ID="txtAmount" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
            <br />

            <asp:Button ID="btnSaveTrans" CssClass="btn btn-success btn-block" Text="Save Transaction" runat="server" OnClick="btnAdd_Click" />
            <br />
            <asp:Button ID="btnClear" CssClass="btn btn-danger btn-block" Text="Clear" runat="server" OnClick="btnClear_Click" />
     </ContentTemplate>
        
    </asp:UpdatePanel>
       
    </asp:Content>
