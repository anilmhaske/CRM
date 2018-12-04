<%@ page title="Dashboard" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="DashBoard, App_Web_dashboard.aspx.a57ad085" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGridMerge">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGridMerge" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            
            <telerik:AjaxSetting AjaxControlID="RadGridLob">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGridLob" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGridScheme">
                <UpdatedControls><telerik:AjaxUpdatedControl ControlID="RadGridScheme" /></UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <table width="100%">
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td><strong>Data Merge Status</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpdate" Runat="server" AutoPostBack="True" Culture="English (United States)" FocusedDate="2010-04-29" MaxDate="2500-12-31" MinDate="1921-01-01" SelectedDate="2010-07-21" Skin="Vista">
                                <DateInput ID="DateInput1" runat="server" AutoPostBack="True" DateFormat="dd-MMM-yy" SelectedDate="2010-04-29">
                                </DateInput>
                                <Calendar ID="Calendar1" runat="server" Skin="Vista" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                                </Calendar>
                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Check Live" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                            <telerik:RadGrid ID="RadGridMerge" runat="server" GridLines="None" Skin="Office2007"
                                AutoGenerateColumns="False">
                                <HeaderContextMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </HeaderContextMenu>
                                <MasterTableView AutoGenerateColumns="False">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="BranchID" HeaderText="Branch ID" SortExpression="BranchID" UniqueName="BranchID"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CodeNo" HeaderText="CodeNo" SortExpression="CodeNo" UniqueName="CodeNo"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BranchName" HeaderText="Branch Name" SortExpression="BranchName" UniqueName="BranchName"></telerik:GridBoundColumn>
                                        <telerik:GridDateTimeColumn HeaderText="Stock MergeDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  DataField="StockMergeDate" DataFormatString="{0:dd-MMM-yyyy}" ReadOnly="True" UniqueName="StockMergeDate"> </telerik:GridDateTimeColumn>
                                        <telerik:GridDateTimeColumn HeaderText="Transaction MergeDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="TransMergeDate" DataFormatString="{0:dd-MMM-yyyy}" ReadOnly="True" UniqueName="TransMergeDate"> </telerik:GridDateTimeColumn>
                                        <telerik:GridDateTimeColumn HeaderText="StockFile VersionNo" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center" DataField="StockFileVersionNo" ReadOnly="True" UniqueName="StockFileVersionNo"> </telerik:GridDateTimeColumn>
                                        <telerik:GridDateTimeColumn HeaderText="TransFile VersionNo" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center" DataField="TransFileVersionNo" ReadOnly="True" UniqueName="TransFileVersionNo"> </telerik:GridDateTimeColumn>
                                        <telerik:GridDateTimeColumn HeaderText="HO TransCount" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center" DataField="HOTransCount" ReadOnly="True" UniqueName="HOTransCount"> </telerik:GridDateTimeColumn>
                                        <telerik:GridDateTimeColumn HeaderText="Branch TransCount" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center" DataField="LiveTransCount" ReadOnly="True" UniqueName="LiveTransCount"> </telerik:GridDateTimeColumn>
                                    </Columns>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                </MasterTableView>
                                <ClientSettings AllowDragToGroup="True">
                                </ClientSettings>
                                <FilterMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </FilterMenu>
                            </telerik:RadGrid>
                        </td>
        </tr>
        <tr>
            <td><strong>Active LOB</strong></td>
            <td><strong>Statistics</strong></td>
        </tr>
        <tr>
            <td valign="top" >
                <telerik:RadGrid ID="RadGridLob" runat="server" GridLines="None" Skin="Office2007"
                                AutoGenerateColumns="False">
                                <HeaderContextMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </HeaderContextMenu>
                                <MasterTableView AutoGenerateColumns="False">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="LobID" HeaderText="LobID" SortExpression="LobID"
                                            UniqueName="LobID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LobName" HeaderText="LobName" SortExpression="LobName"
                                            UniqueName="LobName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Active" HeaderText="Active" SortExpression="Active"
                                            UniqueName="Active">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SKUs" HeaderText="SKU(s)" SortExpression="SKUs"
                                            UniqueName="SKUs">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                </MasterTableView>
                                <ClientSettings AllowDragToGroup="True">
                                </ClientSettings>
                                <FilterMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </FilterMenu>
                            </telerik:RadGrid>
            </td>
            <td valign="top" >
                <telerik:RadGrid ID="RadGridCT" runat="server" GridLines="None" Skin="Office2007"
                                AutoGenerateColumns="False">
                                <HeaderContextMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </HeaderContextMenu>
                                <MasterTableView AutoGenerateColumns="False">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="ID" HeaderText="Sr" SortExpression="ID" UniqueName="ID"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Description" HeaderText="Description" SortExpression="Description" UniqueName="Description"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Total" HeaderText="Total" SortExpression="Total" UniqueName="Total"></telerik:GridBoundColumn>
                                    </Columns>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                </MasterTableView>
                                <ClientSettings AllowDragToGroup="True">
                                </ClientSettings>
                                <FilterMenu EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </FilterMenu>
                            </telerik:RadGrid>
            </td>
        </tr>
        <tr>
            <td colspan="2"><strong>Top Active Schemes</strong></td>
        </tr>
        <tr>
            <td colspan="2">
                         <telerik:RadGrid ID="RadGridScheme" runat="server" Skin="Office2007" AutoGenerateColumns="False"  GridLines="None" AllowPaging="false" PageSize="10" AllowSorting="True">
                 <ClientSettings AllowExpandCollapse="True"></ClientSettings>
                <MasterTableView DataKeyNames="SchemeID"  HierarchyLoadMode="Client" Width="100%" >
                
                    <DetailTables >
                        <telerik:GridTableView DataKeyNames="SchemeID" Name="RadGridSchemeB" Width="100%">
                        <Columns>
                            <telerik:GridBoundColumn  HeaderText="BranchName" HeaderButtonType="TextButton" Visible="True" DataField="BranchName" UniqueName="BranchName"> </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn  HeaderText="VoucherNo" HeaderButtonType="TextButton" ReadOnly="True" DataField="VoucherNo" UniqueName="VoucherNo"> </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn  HeaderText="VersionNo" HeaderButtonType="TextButton" ReadOnly="True" DataField="Version" UniqueName="Version"> </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn  HeaderText="BroadCast Date" DataField="BroadcastDate" DataFormatString="{0:dd-MMM-yyyy}" ReadOnly="True" UniqueName="BroadcastDate"></telerik:GridDateTimeColumn>
                        </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                            <telerik:GridBoundColumn  HeaderText="ID" HeaderButtonType="TextButton" Visible="true" DataField="SchemeID" UniqueName="SchemeID"> </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn  HeaderText="SchemeName" HeaderButtonType="TextButton" ReadOnly="True" DataField="SchemeName" UniqueName="SchemeName"> </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn  HeaderText="Valid From" DataField="ValidFrom" DataFormatString="{0:dd-MMM-yyyy}" ReadOnly="True" UniqueName="ValidFrom"></telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn  HeaderText="Valid To" DataField="ValidTo" DataFormatString="{0:dd-MMM-yyyy }" ReadOnly="True" UniqueName="ValidTo"></telerik:GridDateTimeColumn>
                            <telerik:GridBoundColumn  HeaderText="ForItem" HeaderButtonType="TextButton" ReadOnly="True" DataField="ForItem" UniqueName="ForItem"> </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn  HeaderText="ForBill" HeaderButtonType="TextButton" ReadOnly="True" DataField="ForBill" UniqueName="ForBill"> </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn  HeaderText="HyperRate" HeaderButtonType="TextButton" ReadOnly="True" DataField="HyperRate" UniqueName="HyperRate"> </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                </telerik:RadGrid>
                        </td>
        </tr>
    </table>
</asp:Content>
