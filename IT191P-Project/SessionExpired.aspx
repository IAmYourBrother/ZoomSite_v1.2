<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionExpired.aspx.cs" Inherits="IT191P_Project.SessionExpired" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family:arial; color:red; text-align:center;">
    <form id="form1" runat="server">
    <div>
        <h1>Your Session Has Expired</h1>
        <a href="Business Site/Login.aspx">Click here to login credentials again...</a>
        <p> </p>
        <img src="images/buffer.gif" alt="buffering"/>

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"/>
            <script type="text/javascript">
                function timer()
                {
                    PageMethods.Redirect();
                }
                </script>
        
    </div>
    </form>
</body>
</html>
