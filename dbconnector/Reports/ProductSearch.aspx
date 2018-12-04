<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_ProductSearch, App_Web_productsearch.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .stylSearch {
            background-image: url('../Images/Large.png');
            background-position: center;
        }

        .stylShow {
            background-image: url('../Images/medium.png');
            background-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <%--<telerik:AjaxSetting AjaxControlID="btnShow">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="radGridMain" LoadingPanelID="LoadingPanel1" />                    
                </UpdatedControls>
            </telerik:AjaxSetting>   --%>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Office2007" />
    <div>
        <table align="center" width="96%">
            <tr style="height: 25px; background-color: #C6DAF1;" align="left">
                <td>
                    <b>Product Search Report</b>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblProduct" Visible="true" Text="Product Search"></asp:Label>
                                <asp:TextBox runat="server" ID="txtProductID" Visible="true"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnSelectBranch" CssClass="stylSearch" Text="Select Branch" Visible="true" />
                                <asp:Button runat="server" ID="btnShow" Text="Show" CssClass="stylShow" Visible="true" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadWindow ID="radwndBranch" Visible="true" Title="Select Branch" runat="server" Width="310px" Height="375px" Skin="Simple" Behaviors="Move,Close,Reload" VisibleStatusbar="false" Top="220px" Left="416px">
                                    <ContentTemplate>
                                        <center>
                                            <asp:UpdatePanel ID="upPnlBranch" runat="server">
                                                <ContentTemplate>
                                                    <table>
                                                        <tr>
                                                            <td valign="top">
                                                                <asp:CheckBox ID="chkSelectBranch" runat="server" Text="Select All" AutoPostBack="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <telerik:RadListView ID="radlstViewBranch" Visible="true" Height="300px" Width="150px" runat="server">
                                                                    <LayoutTemplate>
                                                                        <table border="1" cellspacing="0">
                                                                            <tr style="background-color: #D9DFDF;">
                                                                                <th id="Th1" runat="server">ID</th>
                                                                                <th id="Th2" runat="server">Branch Name</th>
                                                                                <th id="Th3" runat="server">ShortName</th>
                                                                            </tr>
                                                                            <tr runat="server" id="itemPlaceholder" />
                                                                        </table>
                                                                    </LayoutTemplate>
                                                                    <ItemTemplate>
                                                                        <tr id="Tr2" runat="server">
                                                                            <td>
                                                                                <asp:Label ID="ID" runat="Server" Text='<%#Eval("BRanchID") %>' />
                                                                            </td>
                                                                            <td valign="top">
                                                                                <asp:CheckBox ID="BranchName" runat="Server" Text='<%#Eval("BranchName") %>' />
                                                                            </td>
                                                                            <td valign="top">
                                                                                <asp:Label ID="Shortname" runat="Server" Text='<%#Eval("Shortname") %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </telerik:RadListView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Button ID="btnok" runat="server" Text="OK" />
                                                                <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </center>
                                    </ContentTemplate>
                                </telerik:RadWindow>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>                    
                    <telerik:RadGrid ID="radGridMain" ExportSettings-ExportOnlyData="true" GridLines="Both" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="false" MasterTableView-CommandItemSettings-ShowExportToCsvButton="true" MasterTableView-CommandItemSettings-ShowExportToExcelButton="true" MasterTableView-CommandItemSettings-ShowExportToPdfButton="true" MasterTableView-CommandItemSettings-ShowExportToWordButton="true" MasterTableView-CommandItemSettings-ShowRefreshButton="false" MasterTableView-CommandItemDisplay="Top" runat="server" OnItemDataBound="radGridMain_ItemDataBound" Skin="Office2007" Width="60%" Visible="false">
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="Live">
                            <Columns>
                                <telerik:GridBoundColumn DataField="BranchID" HeaderText="BranchID" UniqueName="BranchID" ItemStyle-Width="0px" Visible="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BranchName" HeaderText="BranchName" UniqueName="BranchName" ItemStyle-Width="300px" HeaderStyle-Width="300px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="TemplateColumn" ItemStyle-HorizontalAlign="Center" >
                                    <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" AlternateText="progress" BorderWidth="0px" runat="server"></asp:Image>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Stock" HeaderText="Stock" UniqueName="Stock" DataFormatString="{0:0}" ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <Resizing AllowResizeToFit="true" AllowColumnResize="true" ResizeGridOnColumnResize="true" />
                        </ClientSettings>
                    </telerik:RadGrid>
                    <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

