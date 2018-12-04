<%@ page language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="AttributeMaster, App_Web_attributemaster.aspx.6044e34" title="Lobwise Attribute Values" enableeventvalidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource runat="server" 
    ID="VatDataSource"
    DataSourceMode="DataReader"
    SelectCommand="Select VatPer Vper,VatID From VatMaster">
</asp:SqlDataSource>

<asp:SqlDataSource runat="server" 
    ID="LabelDataSource" 
    ProviderName="System.Data.SqlClient"
    DataSourceMode="DataReader"
    SelectCommand="Select Name,LabelID From LabelFormatMaster">
</asp:SqlDataSource>

    <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="gvAttribute">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="gvAttribute" LoadingPanelID="LoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" />
    
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%">
    
<table align="center" width="90%">
<tr style="background-color:#99CCFF; height:25px;" align="center">
<td align="center" colspan="2">
<b>Lobwise Attribute Values</b>
</td>
</tr>

<tr>
<td>
<table align="center" width="90%">
<tr>
<td width="70px">LOB : 
</td>
<td width="150px">
    <telerik:RadComboBox ID="cmbLob" runat="server" AutoPostBack="true"></telerik:RadComboBox>
</td>
</tr>
<tr>
<td width="70px">
Attribute : 
</td>
<td width="150px">
    <telerik:RadComboBox ID="cmbAttribute" runat="server" AutoPostBack="true"></telerik:RadComboBox>
</td>
</tr>
</table>
</td>
<td>
<table>
<tr>
<td width="120px">
Nested Attribute : 
</td> 
<td width="175px">
    <telerik:RadComboBox ID="cmbNestedAttribute" runat="server" AutoPostBack="true"></telerik:RadComboBox>
</td>
<td width="50px">Status : 
       <%--<asp:RadioButton ID="rbtEnabledOnly" runat="server" Text="Enabled Only" 
        GroupName="G" AutoPostBack="true" Checked="True" />--%>
</td>
<td width="175px">
    <telerik:RadComboBox ID="cmbStatus" runat="server" AutoPostBack="true">
    <Items>
    <telerik:RadComboBoxItem runat="server" Text="Enabled" Value="EnabledOnly" Selected ="true" />
    <telerik:RadComboBoxItem runat="server" Text="Disabled" Value="DisabledOnly" />
    <telerik:RadComboBoxItem runat="server" Text="All" Value="All(Enabled & Disabled)" />
    </Items>
    </telerik:RadComboBox>

    <%--<asp:RadioButton ID="rbtAll" runat="server" Text="All(Enabled & Disabled)" 
        GroupName="G" AutoPostBack="true" />--%>
</td>

</tr>
<tr>
<td width="120px">
Select Value : 
</td>
<td width="175px"">
        <telerik:RadComboBox ID="cmbSelectValue" runat="server" AutoPostBack="true"></telerik:RadComboBox>
</td>
<td colspan="4">
    
    <%--<asp:RadioButton ID="rbtDisabledOnly" runat="server" Text="Disabled Only" 
        GroupName="G" AutoPostBack="true" />--%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table align="center" width="90%">
<tr>
    <td align="center">
   <telerik:RadGrid ID="gvAttribute" runat="server"  Skin="Web20"  AllowPaging="true">
       <PagerStyle Mode="NextPrevAndNumeric"/>
        <MasterTableView DataKeyNames="" ClientDataKeyNames="" EditMode="InPlace"  AutoGenerateColumns="false" CommandItemDisplay="Top" >
        <HeaderStyle HorizontalAlign="Center" />
        <Columns>
        <telerik:GridEditCommandColumn HeaderStyle-Width="30px" HeaderText="Action" EditText="Modify" > 
              <HeaderStyle Width="30px"></HeaderStyle>
        </telerik:GridEditCommandColumn>
                        
        <telerik:GridBoundColumn UniqueName="ValueID" DataField="ValueID" HeaderText="ValueID" DataType="System.Int64" ></telerik:GridBoundColumn>
        <telerik:GridBoundColumn UniqueName="Name" DataField="Name" HeaderText="Name" DataType="System.String"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn UniqueName="ShortName" DataField="ShortName" HeaderText="ShortName" DataType="System.String"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn UniqueName="RegionalName" DataField="RegionalName" HeaderText="RegionalName" DataType="System.String"></telerik:GridBoundColumn>
        <telerik:GridCheckBoxColumn UniqueName="MiscFlag" DataField="MiscFlag" HeaderText="MiscFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridCheckBoxColumn UniqueName="IMEIFlag" DataField="IMEIFlag" HeaderText="IMEIFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridCheckBoxColumn UniqueName="BulkFlag" DataField="BulkFlag" HeaderText="BulkFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridDropDownColumn UniqueName="LabelId" ListTextField="LabelId" ListValueField="LabelId" DataSourceID="LabelDataSource" HeaderText="LabelID" DataField="LabelId"></telerik:GridDropDownColumn>
        <telerik:GridDropDownColumn UniqueName="VatPer" ListTextField="Vper" ListValueField="Vper" DataSourceID="VatDataSource" HeaderText="VatPer" DataField="VatPer"></telerik:GridDropDownColumn>
        <telerik:GridCheckBoxColumn UniqueName="TagaFlag" DataField="TagaFlag" HeaderText="TagaFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridCheckBoxColumn UniqueName="BudgetFlag" DataField="BudgetFlag" HeaderText="BudgetFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridCheckBoxColumn UniqueName="AreaFlag" DataField="AreaFlag" HeaderText="AreaFlag" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        <telerik:GridCheckBoxColumn UniqueName="Disabled" DataField="Disabled" HeaderText="Disabled" Visible="true" DataType="System.Boolean"></telerik:GridCheckBoxColumn>
        
        </Columns>
        <EditFormSettings>
            <EditColumn UniqueName="EditCommandColumn1"></EditColumn>
        </EditFormSettings>
        </MasterTableView>
   </telerik:RadGrid>
</td>
</tr>
</table>
</telerik:RadAjaxPanel>
</asp:Content>
