<%@ page title="Cust info" language="VB" masterpagefile="~/M/Home.master" autoeventwireup="false" inherits="M_CustInfo, App_Web_custinfo.aspx.4fd81c8b" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table align="center" width="90%">
        <tr><td align="center">
            <asp:DropDownList ID="cmbSearchType" runat="server">
                <asp:ListItem Selected="True">MobileNo</asp:ListItem>
                <asp:ListItem>CustomerID</asp:ListItem>
                <asp:ListItem>LoyaltyNo</asp:ListItem>
            </asp:DropDownList>  
                </td>
        </tr>    
        <tr>
            <td align="center">
                <asp:TextBox ID="txtSearchString" runat="server"></asp:TextBox>
                <asp:Button ID="btnShow" runat="server" Text="Go" />  
            </td>
        </tr>    
        <tr>
            <td align="center"><b>
            <asp:Label ID="lblCustInfo" runat="server" Text="Customer Information"></asp:Label></b>
                </td>
            </tr>
        <tr>
               <td align="center">
                    <asp:GridView ID="GV" runat="server" CellPadding="3" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:TemplateField HeaderText="Go">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkGO" runat="server" Font-Underline="True" ForeColor="#3333CC">Go</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
    </table>

</asp:Content>

