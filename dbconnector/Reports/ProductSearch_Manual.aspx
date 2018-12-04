<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_ProductSearch_Manual, App_Web_productsearch_manual.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="rgvProductInfo" LoadingPanelID="LoadingPanel1" />
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
            </telerik:RadAjaxManager>--%>
    <table align="center" width="100%">
        <tr style="height: 25px;" align="center">
            <td style="background-color: #99CCFF; height: 25px;" colspan="3">
                <b>Product Search Manual</b>
            </td>
        </tr>
        <tr align="center">
            <td style="text-align: left; vertical-align: top; width: 10%">
                Product Code
            </td>
            <td style="text-align: left;">
                <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td style="text-align: left; vertical-align: top; width: 10%">
                Product Name
            </td>
            <td style="text-align: left; width: 30%">
                <telerik:RadComboBox ID="cmbProductName" runat="server" Font-Names="Verdana" Font-Size="Small"
                    Width="550px" Visible="true" Style="font-size: small" EnableAutomaticLoadOnDemand="True"
                    OnClientItemsRequested="OnClientItemsRequested" OnClientItemsRequesting="OnClientItemsRequesting"
                    Skin="Vista" OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true"
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
                <br />
            </td>
            <td style="text-align: left;">
                <asp:Button ID="BtnSubmit" runat="server" Text="Show" />
                &nbsp;<asp:Button ID="btnExport" runat="server" Text="Export" />
            </td>
        </tr>
        <tr align="left">
            <td colspan="3" style="text-align: left; vertical-align: top;">
                <%-- <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Office2007" />
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Style="width: 100%">--%>
                <telerik:RadGrid ID="rgvProductInfo" AutoGenerateColumns="False" ExportSettings-Excel-Format="ExcelML"
                    runat="server" Width="98%" GridLines="None" Height="400px">
                    <ExportSettings>
                        <Excel Format="ExcelML"></Excel>
                    </ExportSettings>
                    <ClientSettings>
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView Name="Product">
                        <Columns>
                            <%--<telerik:GridBoundColumn DataField="BranchID" UniqueName="BranchID" HeaderText="BranchID" ></telerik:GridBoundColumn>  
                        <telerik:GridBoundColumn DataField="BranchID" UniqueName="Name" HeaderText="Branch" ></telerik:GridBoundColumn>  
                        <telerik:GridBoundColumn DataField="Stock" UniqueName="Stock" HeaderText="Stock" ></telerik:GridBoundColumn>               --%>
                        </Columns>
                        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
                </telerik:RadGrid>
                <%--</telerik:RadAjaxPanel>--%>
            </td>
        </tr>
    </table>
    <%--</ContentTemplate>
</asp:UpdatePanel> --%>
</asp:Content>
