<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Site/Admin.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="IT191P_Project.Admin_Site.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h1 class="page-header">Update Users</h1>
            <div></div>
            <div>
                For Branch Manager <br />
                Search:&nbsp;
                <asp:TextBox ID="txtSearchBranchManager" placeholder="Search ID..." runat="server" OnTextChanged="txtSearchBranchManager_TextChanged"></asp:TextBox>
                <asp:GridView ID="gvBranchManager" runat="server" DataKeyNames="ID" DataSourceID="BranchManagerDataSource" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Data Found!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="BranchManagerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Branch Manager'"></asp:SqlDataSource>
            </div>
            <div>
                <asp:DetailsView ID="dvBranchManager" runat="server" Height="50px" Width="125px" DataKeyNames="ID" AutoGenerateRows="False" DataSourceID="BranchManagerdvDataSource" OnItemDeleted="dvBranchManager_ItemDeleted" OnItemUpdated="dvBranchManager_ItemUpdated" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                        No data found!
                    </EmptyDataTemplate>
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="LNAME" HeaderText="LNAME" SortExpression="LNAME" />
                        <asp:BoundField DataField="FNAME" HeaderText="FNAME" SortExpression="FNAME" />
                        <asp:BoundField DataField="MNAME" HeaderText="MNAME" SortExpression="MNAME" />
                        <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
                        <asp:BoundField DataField="MOBILE_NO" HeaderText="MOBILE_NO" SortExpression="MOBILE_NO" />
                        <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USERTYPE" HeaderText="USERTYPE" SortExpression="USERTYPE" />
                        <asp:BoundField DataField="EMAIL_ADD" HeaderText="EMAIL_ADD" SortExpression="EMAIL_ADD" />
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
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="BranchManagerdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
                    SelectCommand="SELECT [ID], [LNAME], [FNAME], [MNAME], [SEX], [MOBILE_NO], [PASSWORD], [USERNAME], [USERTYPE], [EMAIL_ADD] FROM [USER] WHERE ([ID] = @ID)"
                    DeleteCommand="DELETE FROM [USER] WHERE ID = @ID" 
                    UpdateCommand="UPDATE [USER] SET LNAME=@LNAME, FNAME=@FNAME, MNAME=@MNAME, MOBILE_NO=@MOBILE_NO, PASSWORD=@PASSWORD, USERNAME=@USERNAME, USERTYPE=@USERTYPE, EMAIL_ADD=@EMAIL_ADD WHERE ID = @ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvBranchManager" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div>
                For Branch Owner<br />
                Search:&nbsp;
                <asp:TextBox ID="txtSearchBranchOwner" placeholder="Search ID..." runat="server" OnTextChanged="txtSearchBranchOwner_TextChanged"></asp:TextBox>
                <asp:GridView ID="gvBranchOwner" runat="server" DataKeyNames="ID" DataSourceID="BranchOwnerDataSource" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                        No Data Found!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="BranchOwnerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
                    SelectCommand="SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Branch Owner'">
                </asp:SqlDataSource>
            </div>
            <div>
                <asp:DetailsView ID="dvBranch" runat="server" Height="50px" Width="125px" DataKeyNames="ID" AutoGenerateRows="False" DataSourceID="BranchOwnerdvDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="LNAME" HeaderText="LNAME" SortExpression="LNAME" />
                        <asp:BoundField DataField="FNAME" HeaderText="FNAME" SortExpression="FNAME" />
                        <asp:BoundField DataField="MNAME" HeaderText="MNAME" SortExpression="MNAME" />
                        <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
                        <asp:BoundField DataField="MOBILE_NO" HeaderText="MOBILE_NO" SortExpression="MOBILE_NO" />
                        <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USERTYPE" HeaderText="USERTYPE" SortExpression="USERTYPE" />
                        <asp:BoundField DataField="EMAIL_ADD" HeaderText="EMAIL_ADD" SortExpression="EMAIL_ADD" />
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
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="BranchOwnerdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
                    SelectCommand="SELECT [ID], [LNAME], [FNAME], [MNAME], [SEX], [MOBILE_NO], [PASSWORD], [USERNAME], [USERTYPE], [EMAIL_ADD] FROM [USER] WHERE ([ID] = @ID)"
                    DeleteCommand="DELETE FROM [USER] WHERE ID = @ID" 
                    UpdateCommand="UPDATE [USER] SET LNAME=@LNAME, FNAME=@FNAME, MNAME=@MNAME, MOBILE_NO=@MOBILE_NO, PASSWORD=@PASSWORD, USERNAME=@USERNAME, USERTYPE=@USERTYPE, EMAIL_ADD=@EMAIL_ADD WHERE ID = @ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvBranchOwner" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div>
                For Customer<br />
                Search:&nbsp;
                <asp:TextBox ID="txtSearchCustomer" placeholder="Search ID..." runat="server" OnTextChanged="txtSearchCustomer_TextChanged"></asp:TextBox>
                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="CustomersDataSource" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Data Found!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="CustomersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" SelectCommand="SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Customer'"></asp:SqlDataSource>
            </div>
            <div>
                <asp:DetailsView ID="dvCustomers" runat="server" Height="50px" Width="125px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="CustomersdvDataSource" OnItemDeleted="dvCustomers_ItemDeleted" OnItemUpdated="dvCustomers_ItemUpdated">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                        No Data Found!
                    </EmptyDataTemplate>
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="LNAME" HeaderText="LNAME" SortExpression="LNAME" />
                        <asp:BoundField DataField="FNAME" HeaderText="FNAME" SortExpression="FNAME" />
                        <asp:BoundField DataField="MNAME" HeaderText="MNAME" SortExpression="MNAME" />
                        <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
                        <asp:BoundField DataField="MOBILE_NO" HeaderText="MOBILE_NO" SortExpression="MOBILE_NO" />
                        <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USERTYPE" HeaderText="USERTYPE" SortExpression="USERTYPE" />
                        <asp:BoundField DataField="EMAIL_ADD" HeaderText="EMAIL_ADD" SortExpression="EMAIL_ADD" />
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
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="CustomersdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ZoomDB %>" 
                    SelectCommand="SELECT [ID], [LNAME], [FNAME], [MNAME], [SEX], [MOBILE_NO], [PASSWORD], [USERNAME], [USERTYPE], [EMAIL_ADD] FROM [USER] WHERE ([ID] = @ID)"
                    DeleteCommand="DELETE FROM [USER] WHERE ID = @ID" 
                    UpdateCommand="UPDATE [USER] SET LNAME=@LNAME, FNAME=@FNAME, MNAME=@MNAME, MOBILE_NO=@MOBILE_NO, PASSWORD=@PASSWORD, USERNAME=@USERNAME, USERTYPE=@USERTYPE, EMAIL_ADD=@EMAIL_ADD WHERE ID = @ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCustomers" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
