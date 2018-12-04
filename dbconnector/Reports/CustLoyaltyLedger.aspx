<%@ page title="Customer Loyalty Point" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="CustLoyaltyLedger, App_Web_custloyaltyledger.aspx.dfa151d5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGridCustLedger">
                <UpdatedControls><telerik:AjaxUpdatedControl ControlID="RadGridCustLedger" /></UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    
    <table align="center" width="95%">
    <tr style="height:25px;" align="center"  >
        <td>
            <table align="center" width="90%"  style="text-align:left">
                <tr>
                    <td style="background-color:#99CCFF; height:25px;" >
                        <b>Customer Loyalty Point Ledger</b>
                    </td>
                </tr>
            </table> 
        </td>
    </tr>
    <tr style="height:25px;" align="center"  >
        <td>
            <table>
            <tr>
            <td>Select Customer</td>
            <td>            
                <telerik:RadComboBox ID="ddlCutomer" runat="server" 
                    Font-Names="Verdana" Font-Size="Small"  Width="309px" 
                    style="font-size: small" EnableAutomaticLoadOnDemand="True"  
                    OnClientItemsRequested="OnClientItemsRequested" 
                    OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista" 
                    OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true" 
                    EnableLoadOnDemand="True">
                    <ExpandAnimation Type="none" />
                    <CollapseAnimation Type="none" />
                    <WebServiceSettings Path="../Service/ComboFill.asmx"  Method="FillCustomerName" />
                </telerik:RadComboBox>
                <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock1">
                    <script type="text/javascript">
                        var startTime;
                        var sendRequest = true;
                        var calculate = false;
                        function OnClientItemsRequesting(sender, args) {
                            var input = $find('<%= ddlCutomer.ClientId %>');
                            args.get_context()["Item"]=input.get_value();
                            startTime = new Date();
                        }

                        function OnClientItemsRequested(sender, args) {
                        }
                        function OnClientDropDownClosed(sender, args) {
                            sender.clearItems();
                            if (args.get_domEvent().stopPropagation)
                                args.get_domEvent().stopPropagation();
                        }
                    </script>
                </telerik:RadScriptBlock>
            </td>
            <td><asp:Button ID="btnSubmit" runat="server" Text="Show Point Ledger" /></td>
            </tr>
            </table>       
        </td>
    </tr>
    <tr align="center"  >
        <td>
            <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table align="center" width="90%"  style="border:solid 1px green; text-align:left">
                        
                    <tr>
                        <td colspan="4" style="background-color:#99CCFF; height:25px;" >
                            Customer Information
                        </td>
                    </tr>
                        <tr>
                            <td style="width:15%">
                                Name</td>
                            <td>
                                <asp:Label ID="lblCustName" runat="server" Font-Names="verdana" 
                                    Font-Size="12px" Text=""></asp:Label>
                            </td>
                            <td style="width:15%">
                                Loyalty Card No</td>
                            <td>
                                <asp:Label ID="lblLCNo" runat="server" Font-Names="verdana" Font-Size="12px" 
                                    Text=""></asp:Label>
                            </td>
                        </tr>
                    <tr>
                        <td >Cust CodeNo</td>
                        <td><asp:Label ID="lblCustID" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                        <td >Current Points</td>
                        <td><asp:Label ID="lblCalcPoint" Font-Size="14px" Font-Bold="true" Font-Names="verdana" Text="" runat="server"  BackColor="Yellow"></asp:Label></td>
                    </tr>

                    <tr>
                        <td rowspan="2">Address</td>
                        <td rowspan="2"><asp:Label ID="lblAddress" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                        <td>Valid From-To</td>
                        <td><asp:Label ID="lblValidFromTo" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td >LCGroupName</td>
                        <td><asp:Label ID="lblLCGroupName" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td >Mobile No</td>
                        <td><asp:Label ID="lblMobileNo" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                        <td >Last Transfer Point</td>
                        <td><asp:Label ID="lblAccumulationPoint" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td >Birth Date</td>
                        <td><asp:Label ID="lblBirthDate" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                        <td >Blocked/Transferable</td>
                        <td><asp:Label ID="lblBlockTransferable" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                    </tr>
                     <tr>
                        <td >Wed Aniversary</td>
                        <td><asp:Label ID="lblWedAniversary" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                        <td >LastTransferDate</td>
                        <td><asp:Label ID="lblRequestDate" Font-Size="12px" Font-Names="verdana" Text="" runat="server" ></asp:Label></td>
                    </tr>
                    
                </table>
                </ContentTemplate> 
            </asp:UpdatePanel> 
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" width="90%">
            <tr>
            <td>
            <telerik:RadGrid ID="RadGridCustLedger" runat="server" Skin="Office2007" 
            AutoGenerateColumns="False"  GridLines="None" AllowPaging="false">
            
         <ClientSettings AllowExpandCollapse="True"></ClientSettings>
        <MasterTableView DataKeyNames="CustID,BranchID,ActionType"  HierarchyLoadMode="Client" Width="100%" >
        <Columns>
            <telerik:GridBoundColumn DataField="ActionType" HeaderText="ActionType" ReadOnly="True" UniqueName="ActionType" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="BranchID" HeaderText="BranchID" ReadOnly="True" UniqueName="BranchID" Visible="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Description" HeaderText="Description" ReadOnly="True"   UniqueName="Description"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CreditPoint" ItemStyle-HorizontalAlign="Right" HeaderText="CreditPoint" ReadOnly="True" UniqueName="CreditPoint" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DebitPoint" ItemStyle-HorizontalAlign="Right" HeaderText="DebitPoint" ReadOnly="True"  UniqueName="DebitPoint"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LastCreditPoint" ItemStyle-HorizontalAlign="Right"  HeaderText="Old CreditPoint" ReadOnly="True" UniqueName="LastCreditPoint" Visible="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LastDebitPoint" ItemStyle-HorizontalAlign="Right" HeaderText="Old DebitPoint" ReadOnly="True"  UniqueName="LastDebitPoint" Visible="false"></telerik:GridBoundColumn>
        </Columns>
        
        <DetailTables>
        <telerik:GridTableView Name="KeyCode" Width="100%">
           <Columns>
            <telerik:GridBoundColumn DataField="VoucherNo" HeaderText="VoucherNo" ReadOnly="True" UniqueName="VoucherNo" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Date" HeaderText="Date" ReadOnly="True" UniqueName="Date" DataFormatString="{0:dd-MMM-yyyy}" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NetAmount" HeaderText="NetAmount" ReadOnly="True" UniqueName="NetAmount" DataFormatString="{0:##}"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CreditPoint" HeaderText="CreditPoint" ReadOnly="True" UniqueName="CreditPoint"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DebitPoint" HeaderText="DebitPoint" ReadOnly="True" UniqueName="DebitPoint"></telerik:GridBoundColumn>
           </Columns>
        </telerik:GridTableView>
        </DetailTables>
        </MasterTableView>
        </telerik:RadGrid>
            </td>
            </tr>
            </table>
              <br />
        </td> 
    </tr>
</table>
</asp:Content>

