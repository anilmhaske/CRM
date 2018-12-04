<%@ page language="VB" masterpagefile="~/M/Home.master" autoeventwireup="false" inherits="M_FT, App_Web_ft.aspx.4fd81c8b" title="FT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="90%">
        <tr>
            <td colspan="2" align="center" >
                <b><asp:Label ID="lblFT" runat="server" Text="FT" ForeColor="Green" ></asp:Label></b> &nbsp;
                <asp:Label ID="lblProductName" runat="server" Text="*" ForeColor="green" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" >
                <asp:HyperLink style="color:Blue;" NavigateUrl="FT.aspx?Mode=1" ID="lnkAdd" runat="server" Font-Underline="True">Add</asp:HyperLink>
            </td>
            <td align="left" >
                <asp:HyperLink style="color:Blue;" NavigateUrl="FT.aspx?Mode=2" ID="lnkView" runat="server" Font-Underline="True" >View</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="right">VoucherNo</td>
            <td align="left">
            <asp:DropDownList ID="drdVoucherNo" align="left" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">ProductID</td>
            <td align="left">
                <asp:TextBox ID="txtProductID" align="center" runat="server" Width="70px" ></asp:TextBox>
            <asp:Button ID="btnGo" align="center" runat="server" Text="GO"  />
            </td>
        </tr>
        <tr>
            <td align="right">BatchNo</td>
            <td align="left">
                <asp:DropDownList ID="drdBatchNo" align="left" runat="server" AutoPostBack="True" ></asp:DropDownList>
                <b>
              <asp:Label ID="lblB" align="center" runat="server" Text="B" ForeColor="Blue"></asp:Label></b>
            </td>
        </tr>
        <tr>
            <td align="right">Quantity</td>
            <td align="left">
                <asp:TextBox ID="txtQuantity" align="center" runat="server" Width="70px" ></asp:TextBox>
              <b>
              <asp:Label ID="lblS" align="center" runat="server" Text="S" ForeColor ="Blue"></asp:Label></b>
            </td>
        </tr>
        <tr>
            <td align="right">Rate</td>
            <td align="left">
              <asp:TextBox ID="txtRate" align="center" runat="server" Width="70px"></asp:TextBox>
              <b>
              <asp:Label ID="lblR" align="center" runat="server" Text="R" ForeColor="Blue"></asp:Label></b>
            </td>
        </tr>
        <tr>
            <td align="right">Discount%</td>
            <td align="left">
            <asp:TextBox ID="txtDiscountPer" align="center" runat="server" Width="70px"  ></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right">Bonus%</td>
            <td align="left">
            
            <asp:TextBox ID="txtBonusPer" align="center" runat="server" Width="70px" ></asp:TextBox>
            
            </td>
        </tr>
        <tr>
            <td align="right">Narration</td>
            <td align="left">
            
            <asp:TextBox ID="txtNarration" align="center" runat="server" Width="70px" ></asp:TextBox>
            
            </td>
        </tr>
          <tr>
            <td colspan="2" align="center" >
                <asp:Label ID="lblNote" runat="server" Text="Message" ForeColor="Red" ></asp:Label>
            </td>
          </tr>
      
        <tr>
            <td align="right">&nbsp;</td>
            <td align="left">
            
            <asp:Button ID="btnSave" runat="server" Text="Save" /> 
            
            </td>
        </tr>
      </table> 
</asp:Content>

