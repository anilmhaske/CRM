<%@ page language="VB" masterpagefile="~/M/Home.master" autoeventwireup="false" inherits="M_Outstanding, App_Web_purchaseo.aspx.4fd81c8b" title="OutStanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" width="90%">
<tr>
            <td align="center"><b>
                <asp:Label ID="lblInformation" runat="server" Text="OutStanding"></asp:Label></b>&nbsp;
                <asp:HyperLink style="color:Blue;" ID="lnkBack" runat="server" Font-Underline="True" >Back</asp:HyperLink>
            </td>
            </tr>
        <tr>
               <td align="center">
                    <asp:GridView ID="GV" runat="server" CellPadding="3" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
    </table>


</asp:Content>

