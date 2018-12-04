<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_BranchWiseProductAndSaleDetails, App_Web_branchwiseproductandsaledetails.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rgvFranchiseeReport" LoadingPanelID="LoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxPanel2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel2" LoadingPanelID="LoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Office2007" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Style="width: 100%">
        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <br />
                <table align="center" width="95%" style="border: 1px solid blue" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 25px; background-color: #D2F0FF;" align="left">
                        <td colspan="9">
                            <b>Central Product View</b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 13%">Product Code  </td>                        
                        <td style="width: 10%">
                            <asp:TextBox ID="txtItemCode" runat="server" Width="70"></asp:TextBox>
                        </td>
                        <td style="width: 13%">Product Name </td>                        
                        <td style="width: 27%">
                            <telerik:RadComboBox ID="cmbProductName" runat="server"
                                Font-Names="Verdana" Font-Size="Small" Width="250px" Visible="true"
                                Style="font-size: small" EnableAutomaticLoadOnDemand="True"
                                OnClientItemsRequested="OnClientItemsRequested"
                                OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista"
                                OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true"
                                EnableLoadOnDemand="True">
                                <ExpandAnimation Type="none" />
                                <CollapseAnimation Type="none" />
                                <WebServiceSettings Path="../Service/ComboFill.asmx" Method="FillProductName" />
                            </telerik:RadComboBox>
                            <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock1">
                                <script type="text/javascript">
                                    var startTime;
                                    var sendRequest = true;
                                    var calculate = false;
                                    function OnClientItemsRequesting(sender, args) {
                                        var input = $find('<%= cmbProductName.ClientId %>');
                                        args.get_context()["Item"] = input.get_value();
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
                        <td style="width: 6%">MRP
                        </td>
                        <td style="width: 9%">
                            <asp:TextBox ID="txtMRP" runat="server" Width="70"></asp:TextBox>
                        </td>
                        <td style="width: 8%">Sale Rate
                        </td>
                        <td style="width: 9%">
                            <asp:TextBox ID="txtSaleRate" runat="server" Width="70"></asp:TextBox>
                        </td>                       
                    </tr>
                    <tr>
                        <td colspan="2"  >
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 13%">
                            From Date                             
                        </td>
                        <td style="width: 10%">
                           <telerik:RadDatePicker ID="rdpFromDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>
                        </td>
                        <td style="width: 13%">
                            To Date 
                        </td>
                        <td >
                           <telerik:RadDatePicker ID="rdpToDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>                            
                        </td>                        
                        <td>
                            <asp:Button ID="btnShow" runat="server" Text="Show" Height="25" Width="70"   />
                        </td>
                    </tr>                   
                    <tr>
                        <td colspan="9">
                            <br />
                            <span style="color:red; " >*Date filter applicable for Month Wise Branch Wise Sale Quantity Report only. </span> 
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="center">
                                        <label title="Branch Wise Closing Stock" style="font-size: 12px; color: brown; font-weight: bold">Branch Wise Closing Stock</label>
                                        <br />
                                        <br />
                                    </td>
                                    <td align="center">
                                        <label title="Month wise Branch Wise Sale Quantity" style="font-size: 12px; color: brown; font-weight: bold">Month Wise Branch Wise Sale Quantity</label>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top" style="width: 50%;">
                                        <telerik:RadGrid ID="rgvBranchClosignStock" runat="server" Skin="Office2007" Width="80%" AutoGenerateColumns="false">
                                            <MasterTableView>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="ShortName" UniqueName="ShortName" HeaderText="Branch" HeaderStyle-Width="5%" ItemStyle-Width="5%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ClosingStock" UniqueName="Closing Stock" HeaderText="Closing Stock" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="5%" ItemStyle-Width="5%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Mrp" UniqueName="Mrp" HeaderText="MRP" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="RATE" UniqueName="RATE" HeaderText="Rate" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="ReorderLevel" UniqueName="ReorderLevel" HeaderText="Reorder Level" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="LastPurrate" UniqueName="LastPurrate" HeaderText="Last Purchase Rate" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Supplier" UniqueName="Supplier" HeaderText="Last Purch. From" HeaderStyle-Width="10" ItemStyle-Width="10"></telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                    <td align="center" valign="top" style="width: 50%">
                                        <telerik:RadGrid ID="rgvMonthwise" runat="server" Skin="Office2007" AutoGenerateColumns="true" Width="30%">
                                            <%-- <ClientSettings>
                                                <Resizing AllowResizeToFit="true" />
                                            </ClientSettings>--%>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <hr />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </telerik:RadAjaxPanel>

</asp:Content>

