<%@ page title="DashBoard" language="VB" masterpagefile="~/M/Home.master" autoeventwireup="false" inherits="M_DashBoard, App_Web_dashboard.aspx.4fd81c8b" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="90%">
<tr>
                <td align="center" style="color:Green;" >
                    <b><asp:Label ID="lblFirmNameDash" runat="server" Text="Firm Name"></asp:Label></b>
                </td>
            </tr>
<tr>
<td align="center" >


    <asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>


</td>

</tr>

</table> 

</asp:Content>

