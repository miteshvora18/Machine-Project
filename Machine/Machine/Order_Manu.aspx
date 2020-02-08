<%@ Page Language="C#" MasterPageFile="~/Manufacture.Master" AutoEventWireup="true" CodeBehind="Order_Manu.aspx.cs" Inherits="Machine.New_Order_Manu" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView Width="100%" ID="gvManufacturing" AutoGenerateColumns="false" OnRowCommand="gvManufacturing_RowCommand" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Order Id" DataField="oid" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Quantity" DataField="mquantity" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Machine Name" DataField="mname" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Price" DataField="price" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField HeaderText="Order Date" DataField="ostartdate" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center"/>
                <asp:TemplateField HeaderText="Change status to" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate> 
                        <asp:Button ID="btnCompleted" Width="160px" runat="server" CssClass="btnNormal" Text="Manufacturing completed" CommandName="Seen" CommandArgument='<%#Eval("oid") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>