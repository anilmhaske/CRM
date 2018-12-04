<%@ page title="Transaction Summary" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="TransSummary, App_Web_transsummary.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table align="center" width="95%">
        <tr style="height:20px;background-color:#D2F0FF; " align="left"  >
            <td>
                <b>Transaction Summary</b>
            </td>
        </tr>
        <tr align="center"  >
            <td align="left">
            <table>
            <tr>
                <td valign="top" >
                    Select Branch :
                    <asp:DropDownList ID="cmbBranch" runat="server"></asp:DropDownList>
                </td>
                <td valign="top" >
                    For-Date :
                    <telerik:RadDatePicker ID="rdpdate" Runat="server" AutoPostBack="True" 
                        Culture="English (United States)" SelectedDate="2010-07-21" Skin="Vista" 
                        FocusedDate="2010-04-29" MaxDate="2500-12-31" MinDate="1921-01-01" >
                        <DateInput ID="DateInput1" AutoPostBack="True" DateFormat="dd-MMM-yy" SelectedDate="2010-04-29" runat="server">
                        </DateInput>
                        <Calendar ID="Calendar1" Skin="Vista" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x"  runat="server">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </td>
                 <td valign="top" >
                    <asp:Button ID="btnSubmit" runat="server" Text="Show" />
                </td>
            </tr>
        </table>     
        </td>
        </tr>
        <tr align="center"  >
        <td>
            <telerik:RadGrid ID="GV" runat="server" Skin="Office2007" 
                AutoGenerateColumns="False"  GridLines="None">
                <ClientSettings AllowExpandCollapse="True"></ClientSettings>
                <MasterTableView AutoGenerateColumns="True" DataKeyNames="TransType"  HierarchyLoadMode="Client" Width="100%" >
                    <Columns>
                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="View Register">
                            <HeaderStyle Width="40px" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewRegister" OnClick="lnkViewRegister_Click"  runat="server">view</asp:LinkButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="View Products">
                            <HeaderStyle Width="40px" />
                            <ItemTemplate>
                                <asp:LinkButton  ID="lnkViewItem" OnClick="lnkViewItem_Click" runat="server" >view</asp:LinkButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </td>
    </tr>
        <tr style="height:20px;background-color:#D2F0FF; " align="left"  >
            <td>
                <b><asp:Label runat="server" ID="lblInformation" Text=""></asp:Label></b>
            </td>
        </tr>
        <tr>
            <td>
            <telerik:RadGrid ID="GVDetail" runat="server" Skin="Office2007" GridLines="None" AllowPaging="True" PageSize="10">
                <MasterTableView Width="100%" >
                </MasterTableView>
            </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel> 
    
</asp:Content>

