<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Order_status.aspx.cs" Inherits="Machine.Order_status" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        Select Status : 
        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlStatus_SelectedIndexChanged">
        </asp:DropDownList><br /><br />
        <asp:GridView Width="100%" ID="gvStatus" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Order Id" DataField="oid" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Quantity" DataField="mquantity" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Machine Name" DataField="mname" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Price" DataField="price" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Order Date" DataField="ostartdate" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center"/>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>