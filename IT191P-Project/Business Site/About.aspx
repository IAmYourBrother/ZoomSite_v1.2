<%@ Page Title="" Language="C#" MasterPageFile="~/Business Site/Business.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="IT191P_Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title_bar" runat="server">
    About
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" runat="server">
    <div class="container">
        <div class="row">
            <h1>About Us</h1>
            <p>Know more about our team.</p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div>
        <p>This website serves as a project as partial completion towards our IT191P class.</p>
        <p>The group comprises of 6 members:</p>
        <ul style="font-weight:bold;">
            <li>Claudio, Paulo</li>
            <li>Delos Reyes, Joseph</li>
            <li>Driz, Triztan</li>
            <li>Matunog, Geo</li>
            <li>Salonga, Eman</li>
        </ul>
        <p>Our instructor for this course and project is <b>Ng, Philip John</b></p>
    </div>
</asp:Content>