<%@ Page Language="C#" MasterPageFile="~/Markiting.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Machine.Order" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        Select Quantity:
        <asp:DropDownList ID="ddlQuantity" runat="server">
            <asp:ListItem Selected="True" Value="1"></asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem Value="5"></asp:ListItem>
            <asp:ListItem Value="10"></asp:ListItem>
            <asp:ListItem Value="20"></asp:ListItem>
            <asp:ListItem Value="50"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:TextBox Visible="false" ID="txtPrice" runat="server" MaxLength="10"></asp:TextBox><%--
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
            Display="Dynamic" ControlToValidate="txtPrice">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Only numbers are allowed" ControlToValidate="txtPrice" 
            Display="Dynamic" ValidationExpression="^[0-9]{1,45}$"></asp:RegularExpressionValidator>--%>
    </div>
    <div>
        <asp:Button ID="btnSubmit" runat="server" Text="Order Now" CausesValidation="true"
            onclick="btnSubmit_Click" OnClientClick="return checkProduct();" CssClass="btn" style="margin-left:0px;margin-top:10px;" />
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="hdnSelected" runat="server" Value="" Visible="true" />
    </div>
    <div>
         <ul>
            <li>
                <asp:ImageButton ID="imgLaser" runat="server" CssClass="machineImg" ImageUrl="~/Image/laser.jpg" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label Text="Laser Equipment" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label6" Text="Rs.1300" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
            <li>
                <asp:ImageButton ID="imgMetal" runat="server" CssClass="machineImg" ImageUrl="~/Image/Metal.jpg" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label ID="Label1" Text="Metal machinery" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label7" Text="Rs.3500" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
            <li>
                <asp:ImageButton ID="imgPaper" runat="server" CssClass="machineImg" ImageUrl="~/Image/paper_converter.jpg" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label ID="Label2" Text="Paper Converting Machinery" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label8" Text="Rs.5800" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
        </ul>
    </div>
    <div>
        <ul>
            <li>
                <asp:ImageButton ID="imgPumps" runat="server" CssClass="machineImg" ImageUrl="~/Image/Pumps.png" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label ID="Label3" Text="Pumps" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label9" Text="Rs.1000" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
            <li>
                <asp:ImageButton ID="imgPrinting" runat="server" CssClass="machineImg" ImageUrl="~/Image/Printing.jpg" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label ID="Label4" Text="Printing Machinery" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label10" Text="Rs.7000" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
            <li>
                <asp:ImageButton ID="imgRefrigeration" runat="server" CssClass="machineImg" ImageUrl="~/Image/Refrigeration.jpg" OnClientClick="return false;" />
                <div style="text-align:center;">
                    <asp:Label ID="Label5" Text="Air-Conditioning and Refrigeration Machinery" CssClass="txtMachine" runat="server"></asp:Label>
                    <br /><asp:Label ID="Label11" Text="Rs.5000" CssClass="txtMachine" runat="server"></asp:Label>
                </div>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".machineImg").click(function() {
                $(".machineImg").parent().removeClass("machineClick");
                $(this).parent().addClass("machineClick");
                $("#ctl00_ContentPlaceHolder1_btnSubmit").addClass("true");
                $("#ctl00_ContentPlaceHolder1_hdnSelected").val($(this).attr("id"));
            });
        });
        function checkProduct() {
            if ($("#ctl00_ContentPlaceHolder1_btnSubmit").hasClass("true")) {
                if ($("#ctl00_ContentPlaceHolder1_txtPrice").val() !== "") {
                    return true;
                }
                else {
                    alert("Enter amount");
                    return false;
                }
            }
            else {
                alert("Select a product before placing order");
                return false;
            }
        }
    </script>
    
</asp:Content>