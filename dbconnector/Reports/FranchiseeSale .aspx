<%@ page language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Franchisee, App_Web_franchiseesale .aspx.dfa151d5" title="Franchisee Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center" width="95%">
        <tr style="background-color:#99CCFF; height:25px;" align="center">
            <td align="left" colspan="6"><b>Franchisee Loss / Profit Sale</b></td>
        </tr>
        <tr><td colspan="6"></td></tr>
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
            <td><asp:Button ID="btnExport" runat="server" Text="Export" /></td>
        </tr>
        <tr><td colspan="6"></td></tr>
        <tr style="background-color:#99CCFF; height:5px;" align="center">
            <td colspan="6"></td>
        </tr>
        <tr><td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="6">
                <telerik:RadGrid ID="GV" runat="server" AllowPaging="true"  PageSize="10"  >
                    <MasterTableView AutoGenerateColumns="false" Width="100%">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="Srno." HeaderText="Srno." Visible="true"  UniqueName="Srno."  ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Date" HeaderText="Date" Visible="true"  UniqueName="Date" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-MMM-yyyy}" ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Product Desc." UniqueName="Product Desc." HeaderText="Product Desc."  Visible="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Product Code" UniqueName="Product Code" HeaderText="Product Code" Visible="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BatchNo" UniqueName="Batch No"  HeaderText="Batch No" Visible="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Rate"  UniqueName="Rate" HeaderText="Rate" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WH To Fr. Disc%" UniqueName="WH To Fr. Disc%"  HeaderText="WH To Fr. Disc%" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}" ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Fr. Pur Rate" UniqueName="Fr. Pur Rate"  HeaderText="Fr.Pur Rate" Visible="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Fr. to Cust Disc%"   UniqueName="Fr. to Cust Disc%"  HeaderText="Fr.To Cust Disc%" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Fr. To Cust Disc Amt"   UniqueName="Fr. To Cust Disc Amt"  HeaderText="Fr.To Cust Amt" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Qty" UniqueName="Qty" HeaderText="Qty" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Sold Amt" UniqueName="Sold Amt" HeaderText="Sold Amt" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Fr. Loss / Profit"  UniqueName="Fr. Loss / Profit"  HeaderText="Fr.Loss / Profit" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Category"  UniqueName="Category"  HeaderText="Category" Visible="true" HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SubCategory" UniqueName="SubCategory"  HeaderText="SubCategory" Visible="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Fr. Profit %"  UniqueName="Fr. Profit %" HeaderText="Fr. Profit %" Visible="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Profit Amt On Sale"  UniqueName="Profit Amt On Sale"  HeaderText="Profit Amt On Sale" Visible="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Total Fr. Profit"  UniqueName="Total Fr. Profit"  HeaderText="Total Fr. Profit" Visible="true"  HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:#0.00}"></telerik:GridBoundColumn>
                    
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
