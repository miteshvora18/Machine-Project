<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Machine.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link href="Default.css" rel="stylesheet" type="text/css" />
</head>
<body class="login_bg">
    <form id="form1" runat="server">
    <div class="main_login">
        <asp:Label ID="Label2" runat="server" Text="User ID" style="padding-right:65px;"></asp:Label>
        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="User id is required" ControlToValidate="txtUser" 
            Display="Dynamic">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Password" style="padding-right:51px;"></asp:Label> 
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtPass" Display="Dynamic" 
            ErrorMessage="Password is required">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label> 
        <asp:TextBox ID="txtConfPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txtPass" ControlToValidate="txtConfPass" Display="Dynamic" 
            ErrorMessage="Passwords do not match">Passwords do not match</asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Email" style="padding-right:81px;"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtEmail" Display="Dynamic" 
            ErrorMessage="Incorrect email format" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Incorrect email format</asp:RegularExpressionValidator>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn" 
            onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn" CausesValidation="false" 
            style="margin-left:10px;" onclick="Button2_Click" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
