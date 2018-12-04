<%@ page title="Web Settings" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="WebSetting, App_Web_websetting.aspx.6044e34" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="GVOptions">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="GVOptions" LoadingPanelID="LoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="GVLob" LoadingPanelID="LoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" />
    
    <table align="center" width="95%">
    <tr style="height:5px;background-color:#D2F0FF; " align="left"  >
        <td>
        </td>
    </tr>
    <tr align="center"  >
        <td align="left">
            <b>Options Setting</b>
        </td>
    </tr>
    <tr align="center"  >
        <td align="left">
            <telerik:RadGrid ID="GVOptions" runat="server" Skin="Web20" >
                <MasterTableView AutoGenerateColumns="false"   DataKeyNames="" ClientDataKeyNames="" EditMode ="InPlace" >
                <PagerStyle Mode="NextPrevAndNumeric" />
                <Columns>
                <telerik:GridBoundColumn DataField="Type" HeaderText="Type" Visible="true" ReadOnly="true" DataType="System.String"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Name" HeaderText="Name" Visible ="false" ReadOnly="true" DataType="System.String"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Remarks" HeaderText="Description" Visible ="true" ReadOnly="true" DataType="System.String"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Value" UniqueName="Value" HeaderText="Value" DataType="System.String"> </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Query" UniqueName="Query" HeaderText="Query" Visible="false" ReadOnly="true"  DataType="System.String"> </telerik:GridBoundColumn>
                <telerik:GridEditCommandColumn HeaderStyle-Width="30px" HeaderText="Action"> 
                <HeaderStyle Width="30px"></HeaderStyle>
                </telerik:GridEditCommandColumn>
            </Columns>
                <EditFormSettings>
                <EditColumn UniqueName="EditCommandColumn1"></EditColumn>
            </EditFormSettings>
            </MasterTableView>
            </telerik:RadGrid>
        </td>
    </tr>
    <tr align="center"  >
        <td align="left">
            <b>Lob Settings</b></td>
    </tr>
    <tr align="center"  >
        <td align="left">
            <telerik:RadGrid ID="GVLob" runat="server" Skin="Web20" >
                <MasterTableView AutoGenerateColumns="false"   DataKeyNames="" ClientDataKeyNames="" EditMode="InPlace">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <Columns>
                    <telerik:GridBoundColumn    DataField="LobId" HeaderText="LobId" Visible="true" DataType="System.String" ReadOnly="true" ></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn     DataField="LobName" HeaderText="LobName" Visible="true" DataType="System.String" ReadOnly="true" ></telerik:GridBoundColumn>
                   <telerik:GridDropDownColumn DataField="AttributeIDR" ListTextField ="Name" ListValueField="AttributeID" DataSourceID="AttributeDataSource" HeaderText="AttributeR" UniqueName="AttributeR"  />
                   <telerik:GridDropDownColumn DataField="AttributeIDX" ListTextField ="Name" ListValueField="AttributeID" DataSourceID="AttributeDataSource" HeaderText="AttributeX" UniqueName="AttributeX"  />
                   <telerik:GridDropDownColumn DataField="AttributeIDY" ListTextField ="Name" ListValueField="AttributeID" DataSourceID="AttributeDataSource" HeaderText="AttributeY" UniqueName="AttributeY"  />
                   
                    <telerik:GridEditCommandColumn HeaderStyle-Width="30px" HeaderText="Action">
                        <HeaderStyle Width="30px"></HeaderStyle>
                    </telerik:GridEditCommandColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn UniqueName="EditCommandColumn1"></EditColumn>
                </EditFormSettings>
                </MasterTableView> 
            </telerik:RadGrid>
        </td>
    </tr>
</table>

<asp:SqlDataSource runat="server" 
    ID="AttributeDataSource" 
    ProviderName="System.Data.SqlClient"
    DataSourceMode="DataReader"
    SelectCommand="SELECT A.Name,A.AttributeID FROM AttributeMaster A">
</asp:SqlDataSource>

</asp:Content>

