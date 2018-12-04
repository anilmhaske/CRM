<%@ page title="Branch Score" language="VB" masterpagefile="~/M/Home.master" autoeventwireup="false" inherits="M_BranchScore, App_Web_branchscore.aspx.4fd81c8b" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table align="center" width="90%">
        <tr>
            <td align="center">
                <b><asp:Label ID="lblBranchScore" runat="server" Text="Branch Statistic"></asp:Label></b>
            </td>
        </tr>
        <tr>
           <td align="center">
                <asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    AutoGenerateColumns="False">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="BranchID" HeaderText="BranchID" Visible="false" />
                        <asp:BoundField DataField="BranchName" HeaderText="Branch"  />
                        <asp:BoundField DataField="Live" HeaderText="Live" />
                        <asp:BoundField DataField="Sale" HeaderText="Sale" DataFormatString="{0:N0}"  />
                        <asp:BoundField DataField="SR" HeaderText="SR" DataFormatString="{0:N0}"  />
                        <asp:BoundField DataField="BuyBack" HeaderText="BuyBack" DataFormatString="{0:N0}"  />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="BillCount" HeaderText="BillCount" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="AvgBill" HeaderText="AvgBill"  DataFormatString="{0:N0}"  />
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


