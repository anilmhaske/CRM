<%@ page language="VB" autoeventwireup="false" inherits="M_ProductViewer, App_Web_productviewer.aspx.4fd81c8b" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProductViewer</title>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <br />
    <table align="center" width="95%" style="border:thin solid Black;">
    <tr>
    <td>
    
    
    <table align="center" width="90%">
    <tr>
    <td align="left">
    <asp:Image ID="Retailware" runat="server" ImageUrl="~/Images/retailware.png" /><br />
    </td>
    <td align="right" colspan="6"> 
                Welcome,&nbsp;
                <b><asp:Label ID="lblUserName" runat="server" Text="Guest" style="color:Red" /></b>&nbsp;|
                <asp:HyperLink ID="lnkLogIn" NavigateUrl="~/M/logout.aspx" runat="server" >Log Out</asp:HyperLink>&nbsp;
    </td> 
    </tr>
    </table>
    
    <table align="center" width="90%">
    <tr style="background-color:#99CCFF; height:25px;" align="center">
    <td align="left" colspan="6">
    <b>Product Viewer</b>
    </td>
    </tr>
    
    <tr>
    <td width="12%"><b>Lob ID : </b>
    </td>
    <td width="18%">
    <telerik:RadComboBox ID="cmbLobID" runat="server" AutoPostBack="true" Width="130px"></telerik:RadComboBox>
    </td>
    <td width="7%">
    <b>Date : </b>
    </td>
    <td width="20%">
        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
    </td>
    <td width="9%">
    <b>ProductNumber : </b>
    </td>
    <td>
        <b><asp:Label ID="lblProductNumber" runat="server" Text="" style="color:DarkGreen;"></asp:Label></b>
    </td>
    </tr>
    
    <tr>
    <td width="12%"><b>Product : </b>
    </td>
    <td width="18%">
        <telerik:RadTextBox ID="txtProductID" runat="server"></telerik:RadTextBox>
    </td>
    <td colspan="6">
    <b><asp:Label ID="lblProductName" runat="server" Text="" style="color:DarkGreen;"></asp:Label></b>
    </td>
    </tr>
    
    <tr>
    <td width="12%">
        <asp:Button ID="btnShow" runat="server" Text="Show" />
    </td>
    <td width="12%" colspan="6">
        <asp:Label ID="lblErrorMsg" runat="server" Text="" style="color:Red;"></asp:Label>
    </td>
    </tr>
    <tr>
    <td colspan="6">&nbsp;
    </td>
    </tr>
    
    <tr style="background-color:#99CCFF; height:25px;" align="center">
    <td align="left" colspan="6">
    <b>Product List</b>
    </td>
    </tr>

    </table>

    <table align="center" width="90%">
<tr>
<td>
    <telerik:RadGrid ID="GV" runat="server">
    <MasterTableView AutoGenerateColumns="false"  DataKeyNames="" ClientDataKeyNames="" >
    <PagerStyle Mode="NextPrevAndNumeric" />
    <Columns>
    <telerik:GridBoundColumn DataField="BatchNo" HeaderText="Batch No" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
    <telerik:GridBoundColumn DataField="Rate" HeaderText="Rate" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
    <telerik:GridBoundColumn DataField="CurrentStock" HeaderText="Current Stock" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
    <telerik:GridBoundColumn DataField="Actual_MRP" HeaderText="Actual MRP" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
    <telerik:GridBoundColumn DataField="LocationID" HeaderText="Location ID" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
    </Columns>
    </MasterTableView> 
    </telerik:RadGrid>
</td>
</tr>
<tr>
<td align="center" >
    <asp:Image ID="ImgProduct" runat="server" style="height:110px; width:120px;" />
</td>
</tr>
<tr>
    
    <td align="center" >
    <hr />
       <p>
            Copyright &copy; 2011 	Retailware Softech Pvt Ltd Pune - All Rights Reserved.&nbsp &nbsp
       </p>
    </td>
    </tr>
</table>

</td>
    </tr>
    </table>
    
    </form>
</body>
</html>
