<%@ page language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="PendingOrders, App_Web_pendingorders.aspx.dfa151d5" title="Pending Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />

<table align="center" width="95%">
<tr style="background-color:#99CCFF; height:25px;" align="center">
    <td align="left" colspan="5"><b>Pending Orders</b></td>
</tr>
<tr><td colspan="5"></td></tr>
<tr>
    <td width="80px">From Date : </td>
    <td width="160px">
        <telerik:RadDatePicker ID="dtFromDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>
    </td>
    <td width="65px">To Date : </td>
    <td width="160px">
        <telerik:RadDatePicker ID="dtToDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>
    </td>
    <td><asp:Button ID="btnShow" runat="server" Text="Show" /></td>
</tr>
<tr><td colspan="5"></td></tr>
<tr style="background-color:#99CCFF; height:5px;" align="center">
    <td colspan="5"></td>
</tr>
<tr><td colspan="5"></td>
</tr>
<tr>
    <td colspan="5">
    <telerik:RadGrid ID="GV" runat="server">
        <MasterTableView AutoGenerateColumns="false" ClientDataKeyNames="" DataKeyNames="VoucherNo,BranchID" Width="100%">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <DetailTables>
        <telerik:GridTableView DataKeyNames="VoucherNo,BranchID" Name="OrderKeyCode" Width="100%" AutoGenerateColumns="false">
         <Columns>
            <telerik:GridBoundColumn  DataField="BranchID" HeaderText="BranchID" Visible="false" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="VoucherNo" HeaderText="VoucherNo" Visible="False" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="SrNo" HeaderText="Sr No" HeaderButtonType="TextButton" ReadOnly="True"  UniqueName="SrNo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="ProductID" HeaderText="Product ID" HeaderButtonType="TextButton" ReadOnly="True"  UniqueName="ProductID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="ProductName" HeaderText="Product Name" HeaderButtonType="TextButton" ReadOnly="True" UniqueName="ProductName" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="Quantity" HeaderText="Quantity" HeaderButtonType="TextButton" ReadOnly="True"  UniqueName="Quantity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#}"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn  DataField="BilledQty" HeaderText="BilledQty" HeaderButtonType="TextButton" ReadOnly="True"  UniqueName="BilledQty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#}"></telerik:GridBoundColumn>
         </Columns> 
         </telerik:GridTableView> 
        </DetailTables>
        <ExpandCollapseColumn Visible="True"></ExpandCollapseColumn>
         <Columns>
            <telerik:GridBoundColumn DataField="BranchID" HeaderText="BranchID" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="BranchName" HeaderText="BranchName" Visible="true" ReadOnly="true" DataType="System.String" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="VoucherNo" HeaderText="VoucherNo" Visible="False" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CustID" HeaderText="CustID" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="OrderNo" HeaderText="OrderNo" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="OrderDate" HeaderText="OrderDate" Visible="true" ReadOnly="true" DataType="System.DateTime" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd-MMM-yyyy}"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DeliveryDate" HeaderText="DeliveryDate" Visible="true" ReadOnly="true" DataType="System.DateTime" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd-MMM-yyyy}"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DeliveryTime" HeaderText="DeliveryTime" Visible="true" ReadOnly="true" DataType="System.DateTime" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:hh-mm-ss tt}"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TotalItems" HeaderText="TotalItems" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#}"></telerik:GridBoundColumn>
         </Columns>
         </MasterTableView> 
         <ClientSettings AllowDragToGroup="True">
         </ClientSettings>
         <FilterMenu EnableTheming="True">
            <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
         </FilterMenu>
        </telerik:RadGrid>
    </td>
</tr>
</table>
</asp:Content>
