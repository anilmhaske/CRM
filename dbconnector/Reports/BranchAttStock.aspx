<%@ page title="Branchwise Stock Position" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="BranchAttStock, App_Web_branchattstock.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1 ">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GV" LoadingPanelID="LoadingPanel1" />
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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Skin="Office2007" />
            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Style="width: 100%">
                <br />
                <table align="center" width="95%">
                    <tr align="left">
                        <td style="background-color: #99CCFF; height: 25px; width: 30%">
                            <b>Attribute Branch Stock [ LIVE ]</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLob" runat="server" Text="Lob"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="rcbLob" runat="server" Width="200" AutoPostBack="true"></telerik:RadComboBox>
                                    </td>
                                    <td>Attribute
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="rcbAttribute" runat="server" Width="200" AutoPostBack="true" AllowCustomText="true" Filter="Contains"></telerik:RadComboBox>
                                    </td>
                                    <td>Attribute Value
                                    </td>
                                    <td>
                                        <telerik:RadComboBox ID="rcbAttrValue" runat="server" Width="200" AllowCustomText="true" Filter="Contains"></telerik:RadComboBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Width="70" Text="Show" Style="height: 26px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnExport" runat="server" Width="70" Text="Export" Style="height: 26px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            <br />
                            <table align="center" width="100%" style="text-align: left">
                                <tr>
                                    <td>
                                        <%--<asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                    <RowStyle ForeColor="#000066" />
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>--%>
                                        <telerik:RadGrid ID="GV" runat="server" Skin="Office2007"
                                            CellPadding="3">
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                            <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                            <ItemStyle ForeColor="#000066" />
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>
            </telerik:RadAjaxPanel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

