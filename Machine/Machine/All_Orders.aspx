<%@ Page Language="C#" MasterPageFile="~/EmpMarketing.Master" AutoEventWireup="true" CodeBehind="All_Orders.aspx.cs" Inherits="Machine.All_Orders" %>

<asp:Content ID="content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <asp:GridView Width="100%" ID="gvAdmin" AutoGenerateColumns="false" OnRowCommand="gvAdmin_RowCommand" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Order Id" DataField="oid" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Quantity" DataField="mquantity" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Machine Name" DataField="mname" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Price" DataField="price" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Order Date" DataField="ostartdate" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center"/>
                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate> 
                        <asp:Button ID="btnEdit" Width="140px" runat="server" Text="Approve/Disapprove" CssClass="btnNormal" CommandName="Seen" CommandArgument='<%#Eval("oid") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
</asp:Content>