<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Machine._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="Default.css" rel="stylesheet" type="text/css" />
</head>
<body class="login_bg">
    <form id="form1" runat="server">
      <img src="Image/images.jpg" style="padding-top:50px;padding-left:450px;" />
        <div class="main_login">
        <div class="mcontent">
            <div class="box mr20">
				<h2>Contact us</h2>
				<p>Phone : 0250-3980200<br>
                Email : <a href="#">kumar@rapidpack.com</a></p>
			</div>
			<div class="box mr20">
				<h2>Visit us</h2>
				<p><strong>Rapidpack engineering</strong>,Plot No 18, Village walliv ,Survey no66,Near IPOL,
                    Vasai (E), Thane 401208 </p>
			</div>
			<div>
            <asp:Label ID="Label2" runat="server" Text="User ID" style="padding-right:14px;"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" CssClass="btn" />
            <asp:Button ID="Button2" runat="server" Text="Register" CssClass="btn" 
                style="margin-left:10px;" onclick="Button2_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
