<%@ Page Title="" Language="C#" MasterPageFile="~/Business Site/Business.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="IT191P_Project.Business_Site.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    Services
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="banner" runat="server">
    <header class="business-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="tagline">Services</h1>
                </div>
            </div>
        </div>
    </header>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <h1 class="page-header">Services Offered</h1>
    <ul>
        <li>Money Transfer</li>
        <li>Package Delivery</li>
    </ul>
</asp:Content>
