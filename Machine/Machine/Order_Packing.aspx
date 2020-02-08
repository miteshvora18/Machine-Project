<%@ Page Language="C#" MasterPageFile="~/Packing.Master" AutoEventWireup="true" CodeBehind="Order_Packing.aspx.cs" Inherits="Machine.Order_Packing" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView Width="100%" ID="gvPacking" AutoGenerateColumns="false" OnRowCommand="gvPacking_RowCommand" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Order Id" DataField="oid" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Quantity" DataField="mquantity" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Machine Name" DataField="mname" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Price" DataField="price" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Order Date" DataField="ostartdate" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center"/>
                <asp:TemplateField HeaderText="Change status to" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate> 
                        <asp:Button ID="btnCompleted" Width="140px" CssClass="btnNormal" runat="server" Text="Packing completed" CommandName="Seen" CommandArgument='<%#Eval("oid") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>