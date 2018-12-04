<%@ page language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="ProductViewer, App_Web_productviewer.aspx.dfa151d5" title="Product Viewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">


.RadComboBox_Default
{
	vertical-align:bottom;
}

.RadComboBox_Default
{
	font:12px arial,verdana,sans-serif;
	color:#000;
	text-align: left;
            top: -36px;
            left: 113px;
            height: 23px;
        }


.RadComboBox_Default *
{
	margin:0;
	padding:0;
}

        .style2
        {
            width: 163px;
        }
        
.RadInput_Default
{
	font:12px arial,sans-serif;
}

.RadInput_Default
{
	vertical-align:middle;
}

.RadInput_Default
{
	font:12px arial,sans-serif;
}

.RadInput_Default
{
	vertical-align:middle;
}

   

        .style22
        {
        }
        .style25
        {
            height: 16px;
                font-size: x-small;
        }

        .style27
        {
        }

        .style30
        {
            width: 16%;
        }
        .style31
        {
            height: 16px;
        }
        .style33
        {
            width: 16%;
            height: 13px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxPanel1">
                <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" LoadingPanelID="LoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
     </telerik:RadAjaxManager>
     
     <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" />
     
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" style="width:100%">
    <table align="center" width="95%">
    <tr>
    <td>
        <table align="center" width="100%">
            <tr style="background-color:#99CCFF; height:25px;" align="center">
    <td align="left" colspan="3">
    <b>Product Viewer</b>
    </td>
    </tr>
            <tr>
                <td width="115px"><b>Product Search: </b></td>
                <td width="420px">
                    <telerik:RadComboBox ID="cmbProductName" runat="server" 
            Font-Names="Verdana" Font-Size="Small"  Width="400px" 
            style="font-size: small" EnableAutomaticLoadOnDemand="True"  
            OnClientItemsRequested="OnClientItemsRequested" 
            OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista" 
            OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true" 
            EnableLoadOnDemand="True">
            <ExpandAnimation Type="none" />
            <CollapseAnimation Type="none" />
            <WebServiceSettings Path="../Service/ComboFill.asmx"  Method="FillProductName" />
        </telerik:RadComboBox>
                    <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock4">
                <script type="text/javascript">
                        var startTime;
                        var sendRequest = true;
                        var calculate = false;
                        function OnClientItemsRequesting(sender, args) {
                            var input = $find('<%= cmbProductName.ClientId %>');
                            args.get_context()["Item"]=input.get_value();
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
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="Show" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblErrorMsg" runat="server" Text="" style="color:Red;"></asp:Label>
                </td>
        </tr>
    
    <tr style="background-color:#99CCFF; height:25px;" align="center">
    <td align="left" colspan="3">
    <b>Product List</b>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    
    <tr>
    <td>
    <table align="center" width="90%">
<tr>
<td>
    <telerik:RadGrid ID="GV" runat="server">
    <MasterTableView AutoGenerateColumns="false"  DataKeyNames="" ClientDataKeyNames="" Font-Size="Small">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <Columns>
        <telerik:GridBoundColumn DataField="ProductID" HeaderText="ProductID" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="BatchNo" HeaderText="Batch No" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="CurrentStock" HeaderText="Current Stock" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#}"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Rate" HeaderText="Sale Price" Visible="true" ReadOnly="true" DataType="System.Int64" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:00}" ></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Actual_MRP" HeaderText="M.R.P." Visible="true" ReadOnly="true" DataType="System.String"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:00}"></telerik:GridBoundColumn>
    </Columns>
    </MasterTableView> 
    </telerik:RadGrid>
</td>
</tr>
<tr>
<td align="center" >
    <asp:Image ID="ImgProduct" runat="server" style="height:150px; width:150px;" />
</td>
</tr>
</table>
    </td>
    </tr>
    </table>
    </telerik:RadAjaxPanel> 

</asp:Content>

