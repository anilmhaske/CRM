<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Dynamic_Reports_ReportViewer, App_Web_reportviewer.aspx.e0bb34ec" debug="true" enableeventvalidation="false" viewstateencryptionmode="Never" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <style type="text/css" runat="server">
       .lblStyle {
       font-family:Verdana;
       font-size:medium;
       text-wrap:normal;
       color:orangered ;
       }
   </style>
     <script type="text/javascript">
        
       <%-- function RefreshAssociateHospGrid() {
            var masterTable = window.$find("<%= GridviewReport.ClientID%>").get_masterTableView();
            masterTable.rebind();
        }--%>
        function getRadWindow1() {
            return $find("<%=rwndFilter.ClientID%>");
        }
        //function clientClose(Timings) {
        //    GetRadWindow().BrowserWindow.RefreshAssociateHospGrid();
        //    GetRadWindow().close();
        //}
        function closeDialog() {
            getRadWindow1().close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxLoadingPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxLoadingPanel1" LoadingPanelID="LoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
       <%-- <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnok">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GridviewReport" LoadingPanelID="LoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>--%>
        <%--<AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnShow">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GridviewReport" LoadingPanelID="LoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>--%>
     <%--   <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="chkMergeRow">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GridviewReport" LoadingPanelID="LoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>--%>
    </telerik:RadAjaxManager>

    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        <StyleSheets>
            <telerik:StyleSheetReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Skins.WebBlue.Calendar.WebBlue.css" />
            <telerik:StyleSheetReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Skins.WebBlue.Input.WebBlue.css" />
            <telerik:StyleSheetReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Skins.WebBlue.radwindow.WebBlue.css" />
        </StyleSheets>
    </telerik:RadStyleSheetManager>

    <table width="100%">
        <tr style="background-color: #99CCFF; height: 25px;" align="center">
            <td align="left">
                <asp:Label ID="lblReportName" runat="server" Font-Bold="true" Font-Names="Verdana"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnkBtnBack" runat="server" Font-Size="Small" ForeColor="BlueViolet">Back</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAllFilters" runat="server" Visible="false" Font-Names="Verdana"></asp:Label>
                <asp:Label runat="server" ID="lblAllSelectedFilters" Visible="false"></asp:Label>
                <asp:Label ID="lblBreadCrum" runat="server" Visible="false" Font-Names="Verdana"></asp:Label>
            </td>
        </tr>
    </table>

    <telerik:RadAjaxLoadingPanel ID="LoadingPanel" runat="server" Skin="Office2007" />
    <telerik:RadAjaxPanel ID="RadAjaxLoadingPanel1" runat="server">
        <table border="1" style="border-collapse: collapse">
            <tr>
                <td>
                    <asp:Button ID="imgbtnFilter" runat="server" Height="28px" BorderStyle="Ridge" BackColor="#AAD4F5" Text="Filter" align="right" Width="52px" Visible="false" Font-Names="Verdana" />
                </td>

                <td align="left">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btnShow" runat="server" BackColor="#AAD2F5" BorderStyle="Ridge" Text="Show" Height="28px" align="right" Font-Names="Verdana" Enabled="true" />
                            </td>
                            <td>
                                <telerik:RadMenu ID="mnuExport1" runat="server" Font-Names="Verdana" Style="top: 0px; left: 0px;" BackColor="#AAD4F5" Skin="Office2007">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" Text="Export">
                                            <Items>
                                                <telerik:RadMenuItem Value="mnuItemExcel" runat="server" Text="XLS" ImageUrl="~/Images/EXCEL.jpeg" />

                                                <telerik:RadMenuItem Value="mnuItemCSV" runat="server" Text="CSV" ImageUrl="~/Images/CSV.png" />
                                                <telerik:RadMenuItem Value="mnuItemXLSX" Visible="false" runat="server" Text="XLSX" ImageUrl="~/Images/xlsx.png" />
                                            </Items>
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenu>
                                &nbsp;
                                <asp:LinkButton ID="lnkClearFilter" runat="server" Visible="false"  Text="Clear Filter" Font-Names="Verdana"></asp:LinkButton>
                                <asp:CheckBox runat="server" ID="chkMergeRow" Visible="true" AutoPostBack="true" Text="Merge Row" />
                            </td>
                            <td>
                               <%-- <asp:Button ID="btnClearFilter" runat="server" BackColor="#AAD2F5" BorderStyle="Ridge" Text="Clear Filter" Height="28px" align="right" Font-Names="Verdana" Enabled="true" />--%>
                                <%--<asp:LinkButton ID="lnkClearFilter" runat="server" Text="Clear Filter" Font-Names="Verdana" ></asp:LinkButton>--%>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table width="100%">
                    <asp:Panel ID="pnlReportDetail" runat="server" Visible="false">
                        <telerik:RadGrid ID="rdGVDetail" runat="server" AllowPaging="true" GridLines="None" AutoGenerateColumns="true" Skin="Office2007" Visible="false">
                            <MasterTableView>
                            </MasterTableView>
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                    </asp:Panel>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="mnuExport1" />

            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadWindow ID="rwndFilter" Visible="false" Title="Select Filter" VisibleStatusbar="false" runat="server" Width="710px" Height="390px" Behaviors="Close" Top="140px" Left="8px" Font-Names="Verdana" Skin="Simple">
                    <ContentTemplate>
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                            <asp:UpdatePanel ID="udpnlFilter" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <telerik:RadGrid ID="RadGridFilter" runat="server" GridLines="None" Skin="Office2007" AutoGenerateColumns="False" Height="210" ClientSettings-Selecting-AllowRowSelect="true" ClientSettings-Scrolling-AllowScroll="true">
                                                    <MasterTableView AutoGenerateColumns="False" AllowAutomaticInserts="true">
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Field" HeaderText="Field" Visible="true"></telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Condition" HeaderText="Condition"></telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Value" HeaderText="Value"></telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="QueryString" HeaderText="Query String" Visible="false"></telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="ReportId" Visible="false" HeaderText="ReportId"></telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="ColumnId" Visible="false" HeaderText="ColumnId"></telerik:GridBoundColumn>
                                                        </Columns>
                                                        <RowIndicatorColumn>
                                                            <HeaderStyle Width="20px"></HeaderStyle>
                                                        </RowIndicatorColumn>
                                                    </MasterTableView>
                                                    <ClientSettings AllowDragToGroup="True">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <SelectedItemStyle BackColor="Fuchsia" BorderColor="Purple" BorderStyle="Dashed" BorderWidth="1px" />
                                                    <FilterMenu EnableTheming="True">
                                                        <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                                    </FilterMenu>
                                                </telerik:RadGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="Right">
                                                <asp:Button ID="btnok" runat="server" Text="OK" Font-Names="Verdana" />
                                                <asp:Button ID="btnRemove" runat="server" Text="Remove" Font-Names="Verdana" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlFilter" runat="server" Visible="true" BorderStyle="Ridge" BorderColor="#99ccff" Height="60" Width="675" HorizontalAlign="Left" SkinID="office2007">
                                                    <table>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlFilterField" runat="server" Visible="true" AutoPostBack="true" Width="210"></asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlFilterCondition" runat="server" Visible="true" AutoPostBack="true" Width="210"></asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlFilterValue" runat="server" AutoPostBack="true" Width="210"></asp:DropDownList>
                                                                <asp:TextBox ID="txtFilterValue" runat="server" Width="210" Visible="false" Text="0"></asp:TextBox>

                                                                <telerik:RadDatePicker ID="rdDateTimeFrom" runat="server" Width="210" Visible="false" DateInput-DisplayDateFormat="dd-MMM-yyyy" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlFilterValue2" runat="server" Visible="false"></asp:DropDownList>
                                                                <asp:TextBox ID="txtFilterValue2" runat="server" Width="210" Visible="false" Text="0"></asp:TextBox>

                                                                <telerik:RadDatePicker ID="rdDateTimeTo" runat="server" Width="210" Visible="false" DateInput-DisplayDateFormat="dd-MMM-yyyy" DateInput-DateFormat="dd-MMM-yyyy"></telerik:RadDatePicker>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="Right">
                                                <asp:Button ID="btnAddToList" runat="server" Text="Add To List" Font-Names="Verdana" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </telerik:RadAjaxPanel>
                    </ContentTemplate>
                </telerik:RadWindow>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <%-- <table>
                <tr>
                    <td>  --%>
        <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>                         --%>
        <asp:Panel runat="server" ID="pnlGridviewReport">
            <telerik:RadGrid ID="GridviewReport" runat="server" MasterTableView-PagerStyle-PagerTextFormat="" AllowPaging="true" Visible="false" Skin="Office2007" >
                <MasterTableView>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                    </EditFormSettings>
                    <NoRecordsTemplate>
                        No records found
                    </NoRecordsTemplate>
                </MasterTableView>
                <ExportSettings OpenInNewWindow="true" Pdf-AllowAdd="true"></ExportSettings>
                <ClientSettings ClientEvents-OnRowClick=""></ClientSettings>
                <FilterMenu EnableImageSprites="False"></FilterMenu>
            </telerik:RadGrid>
        </asp:Panel>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        <%--    <telerik:RadGrid ID="rdGVDetail" runat="server" AllowPaging="true" GridLines="None"  AutoGenerateColumns="true" Skin="Office2007" Visible="false">
                                        <MasterTableView>
                                        </MasterTableView>
                                        <FilterMenu EnableImageSprites="False">
                                        </FilterMenu>
                                    </telerik:RadGrid>--%>
        

        <br />
        <asp:Label ID="lblCommentedText" runat="server" ForeColor="Orchid" CssClass="lblStyle"></asp:Label>
    </telerik:RadAjaxPanel>
</asp:Content>

