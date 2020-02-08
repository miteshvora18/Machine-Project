<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EmpMarketing.Master" CodeBehind="EditAllOrders.aspx.cs" Inherits="Machine.EditAllOrders" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Order Id:<asp:Label ID="lblOid" runat="server" Text=""></asp:Label><br />
    <asp:DropDownList ID="ddlStatus" runat="server">
        <asp:ListItem Selected="True" Value="Approve"></asp:ListItem>
        <asp:ListItem Value="Disapprove"></asp:ListItem>
    </asp:DropDownList><br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" CssClass="btnNormal" style="margin-top:10px;" />
    
</asp:Content>