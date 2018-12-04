<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_CustomerLoyaltyInformation, App_Web_customerloyaltyinformation.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3 {
            width: 210px;
        }
    </style>
    <script type="text/javascript">
        function requestStart(sender, args) {
            if (args.get_eventTarget().indexOf("btnExport") >= 0)
                args.set_enableAjax(false);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="Server">
        <script type="text/javascript">
            var startTime;
            var sendRequest = true;
            var calculate = false;
            function OnClientItemsRequesting(sender, args) {
                                var input = $find('<%=cmbCustomer.ClientId%>');
                                args.get_context()["Item"] = input.get_value();

//                var input1 = $find('<%=cmbBranch.ClientId%>');
//                args.get_context()["Item"] = input1.get_value();

                //                var input1 = $find('<%=cmbBranch.ClientID%>');
                //                args.get_context()["BranchId"] = input1.get_value();
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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="requestStart">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="pnlGrid" LoadingPanelID="LoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel2" LoadingPanelID="LoadingPanel1" />
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
    <table style="width: 100%;">
        <tr>
            <td style="background-color: #99CCFF; height: 25px;">
                <%--<asp:Label ID="lblCustomerLoyaltyInformation" Text="Customer Loyalty Information"></asp:Label>--%>
                <b>Customer Loyalty Information  (Beta Version)</b>
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnlMain" BorderWidth="1" runat="server">
        <asp:UpdatePanel ID="pnlbranch" runat="server">
            <ContentTemplate>
                <table cellspacing="5">
                    <tr>
                        <td>
                            <asp:Label Font-Names="verdana"  ID="lblCustomer" runat="server" Text="Customer"></asp:Label>
                        </td>
                        <td colspan="3">
                           <%-- <telerik:RadComboBox Width="490px" ID="cmbCustomer" runat="server" Filter="Contains" 
                                CausesValidation="True">
                            </telerik:RadComboBox>--%>
                            <telerik:RadComboBox Width="490px" ID="cmbCustomer" Font-Names="verdana" Font-Size="Small" runat="server" EnableLoadOnDemand="True"
                                OnClientDropDownClosed="OnClientDropDownClosed" OnClientItemsRequested="OnClientItemsRequested"
                                OnClientItemsRequesting="OnClientItemsRequesting"  Filter="Contains" CausesValidation="True">
                                <ExpandAnimation Type="none" />
                                <CollapseAnimation Type="none" />
                                <WebServiceSettings Method="FillCustomerName" Path="../Service/ComboFill.asmx" />
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" Value="0" />
                                </Items>
                            </telerik:RadComboBox>
                        </td>
                        <td>
                            <asp:Label Font-Names="verdana"  ID="lblLoyaltyGroup" runat="server" Text="Loyalty Group"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadComboBox Font-Names="verdana"  ID="cmbLoyaltygrp"  Width="200px" runat="server">
                            </telerik:RadComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label Font-Names="verdana"  ID="lblCity" runat="server" Text="City"></asp:Label>
                        </td>
                        <td class="style3">
                            <telerik:RadComboBox Font-Names="verdana" Font-Size="Small"  ID="cmbCity" EnableLoadOnDemand="true" Filter="Contains" OnClientDropDownClosed="OnClientDropDownClosed" OnClientItemsRequested="OnClientItemsRequested"
                                OnClientItemsRequesting="OnClientItemsRequesting"  CausesValidation="true" Width="200px" runat="server">
                            <WebServiceSettings Method="FillCity" Path="../Service/ComboFill.asmx" />
                               <Items>
                                    <telerik:RadComboBoxItem Text="All" Value="0" />
                                </Items>
                            </telerik:RadComboBox>
                        </td>
                        <td>
                            <asp:Label Font-Names="verdana"  ID="lblMobileNo" runat="server" Text="Mobile No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox Font-Names="verdana"  ID="txtMobileno" Width="200px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label Font-Names="verdana"  ID="lblLcNo" runat="server" Text="Loyalty Card No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLcNo" Font-Names="verdana"  Width="195px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="CustomerGroup" Font-Names="verdana"  runat="server" Text="Customer Group"></asp:Label>
                        </td>
                        <td class="style3">
                            <telerik:RadComboBox ID="cmbCustomergrp" Font-Names="verdana"  Filter="Contains"  Width="200px" runat="server">
                            </telerik:RadComboBox>
                        </td>

                        <td>
                            <asp:Label ID="lblBranch" Font-Names="verdana"  Visible="false" runat="server" Text="Branch"></asp:Label>
                        </td>
                        <td class="style3">
                            <telerik:RadComboBox Font-Names="verdana"  Visible="false" AutoPostBack="true" ID="cmbBranch" Width="205px"
                                runat="server" EnableItemCaching="true" Filter="Contains" CausesValidation="True">
                            </telerik:RadComboBox>
                            <%--                            <telerik:RadComboBox Visible="false" AutoPostBack="true" ID="cmbBranch" Width="200px"
                                runat="server" EnableItemCaching="true" EnableLoadOnDemand="True" OnClientDropDownClosed="OnClientDropDownClosed"
                                OnClientItemsRequested="OnClientItemsRequested" OnClientItemsRequesting="OnClientItemsRequesting"
                                Filter="Contains" CausesValidation="True">
                            </telerik:RadComboBox>--%>
                        </td>
                        <td colspan="2">
                            <asp:RegularExpressionValidator ID="regexpMobile" ControlToValidate="txtMobileno"
                                runat="server" ErrorMessage="Please enter 10 digit mobile number !" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Style="width: 100%;">
        <asp:Panel ID="pnlGrid" runat="server" Width="100%">
            <table width="100%">
                <tr align="center">
                    <td align="left" style="width: 40%;">
                        <asp:Label ID="lblMsg" Font-Names="verdana" Text="Please double click on cell for more details"
                            runat="server" ForeColor="Brown" Visible="false"></asp:Label>
                    </td>
                    <td valign="top" align="left" style="width: 50%;">
                        &nbsp;
                        <asp:Button ID="btnShow" ToolTip="Show" runat="server" Text="Show" ValidationGroup="txtGroup" />
                        &nbsp;
                        <asp:Button ID="btnExport" ToolTip="Export" runat="server" Text="Export" Enabled="false" />
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView DataKeyNames="CustID" ShowFooter="true" Width="100%" runat="server" ID="gvCustomerLoyaltyInformation"
                            Visible="true" AllowPaging="true" PageSize="20"  OnRowDataBound="gvCustomerLoyaltyInformation_OnRowDataBound"
                            OnRowCommand="gvCustomerLoyaltyInformation_RowCommand" AutoGenerateColumns="false"
                            EmptyDataText="No Record Found! " PagerSettings-Mode="Numeric">
                            <Columns>
                                <asp:ButtonField CommandName="ColumnClick" Visible="false" />
                                <%--<asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Panel runat="server" ID="pnlSubGrid">
                                            <asp:GridView Width="100%" runat="server" PageSize="20" ID="gvCreditDetails" Visible="false"
                                                AllowPaging="true" AutoGenerateColumns="false" EmptyDataText="No Record Found! "
                                                PagerSettings-Mode="Numeric">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Customer Name" DataField="Displayname" />
                                                    <asp:BoundField HeaderText="Description" DataField="Description" ItemStyle-HorizontalAlign="Left"
                                                        HeaderStyle-HorizontalAlign="Left" />
                                                    <asp:BoundField HeaderText="Credit Point" DataField="CreditPoint" ItemStyle-HorizontalAlign="Right"
                                                        HeaderStyle-HorizontalAlign="Right" />
                                                    <asp:BoundField HeaderText="Debit Point" DataField="DebitPoint" ItemStyle-HorizontalAlign="Right"
                                                        HeaderStyle-HorizontalAlign="Right" />
                                                    <asp:BoundField HeaderText="Last Credit Point" DataField="LastCreditPoint" ItemStyle-HorizontalAlign="Right"
                                                        HeaderStyle-HorizontalAlign="Right" />
                                                    <asp:BoundField HeaderText="Last Debit Point" DataField="LastDebitPoint" ItemStyle-HorizontalAlign="Right"
                                                        HeaderStyle-HorizontalAlign="Right" />
                                                </Columns>
                                                <EmptyDataRowStyle BackColor="#99CCFF" Width="100%" ForeColor="Red" Font-Bold="true" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <HeaderStyle HorizontalAlign="Left" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                               <%-- <asp:BoundField HeaderText="Branch Name" DataField="branchname" Visible="false" HeaderStyle-HorizontalAlign="left" />--%>
                                <asp:BoundField HeaderText="Customer Name" DataField="Displayname" />
                                <asp:BoundField HeaderText="Credit Point" ItemStyle-Font-Underline="true"  DataField="CreditPoint" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="Debit Point" ItemStyle-Font-Underline="true"  DataField="DebitPoint" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="Last Credit Point" Visible="false" DataField="LastCreditPoint" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="Last Debit Point" Visible="false" DataField="LastDebitPoint" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-HorizontalAlign="Right" />
                            </Columns>
                            <EmptyDataRowStyle BackColor="#99CCFF" Width="100%" ForeColor="Red" Font-Bold="true" />
                            <FooterStyle BackColor="#99CCFF" Font-Bold="true" ForeColor="Black" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <HeaderStyle HorizontalAlign="Left" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" />
                        </asp:GridView>
                        <table>
                            <tr>
                                <td>
                                    Page Size :
                                    <asp:DropDownList ID="ddlList" AutoPostBack="true" runat="server">
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem Selected="True">20</asp:ListItem>
                                        <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                        <asp:ListItem Value="40" Text="40"></asp:ListItem>
                                        <asp:ListItem Value="50" Text="50">50</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlSubGrid" Height="376px"  Visible="false" runat="server">
            <table width="100%">
                <tr align="center">
                    <td align="left" style="width: 40%;">
                        <asp:Label Font-Names="verdana"  ID="lblMsgSubgrid" Text="Please double click on cell for more details"
                            runat="server" ForeColor="Brown"></asp:Label>
                    </td>
                    <td valign="middle" style="width: 20%">
                        <asp:Label Font-Names="verdana"  ID="lblTotal" Visible="false" Font-Bold="true" runat="server" ForeColor="Brown"></asp:Label>
                    </td>
                    <td valign="top" align="right" style="width: 40%;">
                        &nbsp;
                        <asp:Button ID="btnExportSubgrid" ToolTip="Export" runat="server" Text="Export" />
                        &nbsp;
                        <asp:Button ID="btnClose" Font-Names="Webdings" OnClick="btnClose_Clicked" Text="r"
                            ToolTip="Exit" runat="server" />
                    </td>
                </tr>
            </table>
            <%-- <asp:UpdatePanel ID="updPnlMain" runat="server">
                    <ContentTemplate>--%>
            <%--<div style="direction: rtl; visibility: visible;">
                                <asp:Button ID="btnClose" Font-Names="Webdings" OnClick="btnClose_Clicked" Text="r"
                                    Font-Bold="true" ForeColor="Black" ToolTip="Exit" runat="server" Visible="false" />
                            </div>--%>
            <asp:GridView Width="100%" runat="server" PageSize="6" DataKeyNames="CustID,BranchID,ActionType" ID="gvCustomerDetails"
                AllowPaging="true" AutoGenerateColumns="false" EmptyDataText="No Record Found! "
                OnRowDataBound="gvCustomerDetails_RowDataBound" OnRowCommand="gvCustomerDetails_RowCommand"
                PagerSettings-Mode="Numeric">
                <Columns>
                    <asp:ButtonField CommandName="ColumnClick" Visible="false" />
                    <asp:BoundField HeaderText="BranchID" DataField="BranchID" visible="false" />
                    <asp:BoundField HeaderText="Customer Name" DataField="Displayname" />
                    <asp:BoundField HeaderText="Description" DataField="Description" ItemStyle-HorizontalAlign="Left"
                        HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField HeaderText="Credit Point" ItemStyle-Font-Underline="true" DataField="CreditPoint" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="Debit Point" ItemStyle-Font-Underline="true"  DataField="DebitPoint" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="Last Credit Point" Visible="false" DataField="LastCreditPoint" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="Last Debit Point" DataField="LastDebitPoint" Visible="false" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <%--<asp:BoundField HeaderText="ActionType" DataField="ActionType" Visible="false"
                        HeaderStyle-HorizontalAlign="Right" />--%>
                    <%--<asp:TemplateField>
                                        <HeaderTemplate>                                           
                                            <asp:Button ID="btnClose" Font-Names="Webdings" OnClick="btnClose_Clicked" Text="r"
                                                Font-Bold="true" ForeColor="Black" ToolTip="Exit" runat="server" Visible="true" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>--%>
                </Columns>
                <EmptyDataRowStyle BackColor="#99CCFF" Width="100%" ForeColor="Red" Font-Bold="true" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <HeaderStyle HorizontalAlign="Left" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" />
            </asp:GridView>
            <br/>
            <asp:Panel ID="pnlLabels" Visible="false" runat="server">
            
                <table id="tblLabels" width="100%" style="border:1px;border-collapse:collapse;border-bottom:0px;">
                    <tr style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;">
                    <th style="Font:verdana;background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:20%;" align="left"><asp:Label Font-Bold="true"  runat="server" ID="Label1" Visible="true" Text="Branch Name"></asp:Label></th>
                    <th style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:20%;" align="left"><asp:Label runat="server" ID="lblVoucherNO" Visible="true" Text="Voucher NO"></asp:Label></th>
                    <th style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:8%;" align="left"><asp:Label runat="server" ID="lblDate" Visible="true" Text="Date"></asp:Label></th>
                    <th style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:20%;" align="right"><asp:Label runat="server" ID="lblNetAmount" Visible="true" Text="Net Amount"></asp:Label></th>
                    <th style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:15%;" align="right" ><asp:Label runat="server" ID="lblPointsGained" Visible="true" Text="Points Gained"></asp:Label></th>
                    <th style="background-color:#99C8F5;border:1px solid gray;border-collapse:collapse;width:15%;" align="right"><asp:Label runat="server" ID="lblPointsConsumed" Visible="true" Text="Points Consumed"></asp:Label></th>
                    </tr>
                </table>
            </asp:Panel>
            <asp:GridView Width="100%" ShowHeader="false" runat="server" ID="gvAllDetails" AllowPaging="true" PageSize="8"
                Visible="false" AutoGenerateColumns="false" EmptyDataText="No Record Found! "
                PagerSettings-Mode="Numeric">
                <%--AllowPaging="true" PageSize="20"--%>
                <Columns>
                    <asp:BoundField HeaderText="Branch Name" Visible="true" ItemStyle-Width="20%" DataField="branchname" />  
                    <asp:BoundField HeaderText="Voucher No" ItemStyle-Width="20%" DataField="VoucherNo" />
                    <asp:BoundField HeaderText="Date" ItemStyle-Width="8%" DataField="Date" />
                    <asp:BoundField HeaderText="Net Amount" DataField="NetAmount" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="Points Gained" ItemStyle-Width="15%" DataField="PointsGained" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="Points Consumed" ItemStyle-Width ="15%" DataField="PointsConsumed" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="PdVch" Visible="false" DataField="PdVch" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="PdAmt" Visible="false" DataField="PdAmt" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="PdPts" Visible="false" DataField="PdPts" ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right" />
                </Columns>
                <EmptyDataRowStyle BackColor="#99CCFF" Width="100%" ForeColor="Red" Font-Bold="true" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <%--<HeaderStyle HorizontalAlign="Left" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" />--%>
            </asp:GridView>
           
            <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
        </asp:Panel>
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Office2007" />
</asp:Content>
