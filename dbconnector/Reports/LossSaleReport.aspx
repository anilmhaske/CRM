<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_LossSaleReport, App_Web_losssalereport.aspx.dfa151d5" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">

        function onRequestStart(sender, args) {

            if (args.get_eventTarget().indexOf("ExportTo") >= 0)

                if (args.get_eventTarget().indexOf("Button1") >= 0)

                    args.set_enableAjax(false);

            if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||

                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||

                    args.get_eventTarget().indexOf("ExportToPdfButton") >= 0) {

                args.set_enableAjax(false);

            }

        }
    
    </script>
 <%--  <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
   <Scripts>
       <asp:ScriptReference Path="~/Scripts/Common/Core.js" />
       <asp:ScriptReference Path="~/Scripts/Splitter/RadSplitterScripts.js" />
       <asp:ScriptReference Path="~/Scripts/Splitter/RadSlidingZoneScripts.js" />
       <asp:ScriptReference Path="~/Scripts/Common/jQuery.js" />
       <asp:ScriptReference Path="~/Scripts/Common/jQueryPlugins.js" />
       <asp:ScriptReference Path="~/Scripts/Common/Navigation/NavigationScripts.js" />
       <asp:ScriptReference Path="~/Scripts/Common/PopUp/PopUpScripts.js"/>       
    </Scripts>
</telerik:RadScriptManager>--%>
    <style type="text/css">
        .auto-style1 {
            width: 3%;
        }
        .auto-style2 {
            width: 123px;
        }
        .auto-style3 {
            width: 345px;
        }
        .auto-style4 {
            width: 76px;
        }
        .auto-style5 {
            width: 179px;
        }
        .auto-style6 {
            width: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" >
            <tr>
            <td colspan="5" style="background-color: #99CCFF;  ">
                <b>Loss Sale Report</b>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" style="border: medium solid #C0C0C0">
                  
        <tr>
            <td class="auto-style4">
             
                  <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                </td>
           <td class="auto-style3">
               <telerik:RadComboBox ID="rcbBranch" runat="server" Filter="Contains" Width="309px" AutoPostBack="true"></telerik:RadComboBox> 
           </td>
           
            <td class="auto-style2">
                
                From
            </td>
            <td class="auto-style1">
                <telerik:RadDatePicker ID="rdtFrom" runat="server" DateInput-DateFormat="dd-MMM-yyyy"
                    AutoPostBack="true">
                </telerik:RadDatePicker>
              
               <%-- <telerik:RadDatePicker ID="rdpFrom" Runat="server" AutoPostBack="True" 
                        Culture="English (United States)" SelectedDate="2010-07-21" Skin="Vista" 
                        FocusedDate="2010-04-29" MaxDate="2500-12-31" MinDate="1921-01-01" >
                        <DateInput ID="DateInput1" AutoPostBack="True" DateFormat="dd-MMM-yyyy" SelectedDate="2010-04-29" runat="server">
                        </DateInput>
                        <Calendar ID="Calendar1" Skin="Vista" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x"  runat="server">
                        </Calendar>
                     
                    </telerik:RadDatePicker>--%>
            </td>
            <td class="auto-style6">
                To
            </td>
            <td class="auto-style5">
                <telerik:RadDatePicker ID="rdtTo" runat="server" DateInput-DateFormat="dd-MMM-yyyy" 
                    AutoPostBack="true">
                </telerik:RadDatePicker>
            
            </td>
            <td>
                <asp:Button ID="btnShow" runat="server" Text="Show" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                User
            </td>
             <td class="auto-style3">

            <telerik:RadComboBox ID="rcbUser" runat="server" Filter="Contains" Width="309px" AutoPostBack="true"></telerik:RadComboBox>
            </td>
            <td class="auto-style2">
                Product
            </td>
            <td colspan="4">

             <telerik:RadComboBox ID="rcbProduct" runat="server" 
            Font-Names="Verdana" Font-Size="Small"  Width="309px"  
            style="font-size: small" EnableAutomaticLoadOnDemand="True"  
            OnClientItemsRequested="OnClientItemsRequested" 
            OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista" 
            OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true" 
            EnableLoadOnDemand="True">
            <ExpandAnimation Type="none" />
            <CollapseAnimation Type="none" />
            <WebServiceSettings Path="../Service/ComboFill.asmx"  Method="FillProductName" />
        </telerik:RadComboBox>
                            <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock2">
                            <script type="text/javascript">
                                var startTime;
                                var sendRequest = true;
                                var calculate = false;
                                function OnClientItemsRequesting(sender, args) {
                                    var input = $find('<%= rcbProduct.ClientID%>');
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
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Narration
            </td>
             <td class="auto-style3">

                 <telerik:RadTextBox ID="txtNarration" runat="server" Width="300px"></telerik:RadTextBox>
                 
            </td>
             <td class="auto-style2"> 
                Customer Name
            </td>
            <td colspan="5">

             <telerik:RadComboBox ID="rcbCustomer" runat="server" 
                    Font-Names="Verdana" Font-Size="Small"  Width="309px" 
                    style="font-size: small" EnableAutomaticLoadOnDemand="True"  
                    OnClientItemsRequested="OnClientItemsRequested" 
                    OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista" 
                    OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true" 
                    EnableLoadOnDemand="True">
                    <ExpandAnimation Type="none" />
                    <CollapseAnimation Type="none" />
                    <WebServiceSettings Path="../Service/ComboFill.asmx"  Method="FillCustomerName" />
                </telerik:RadComboBox>
                <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock1">
                    <script type="text/javascript">
                        var startTime;
                        var sendRequest = true;
                        var calculate = false;
                        function OnClientItemsRequesting(sender, args) {
                            var input = $find('<%= rcbCustomer.ClientID%>');
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
            </td>
         
        </tr>
                </table>
            </td>
        </tr>
      <tr>
          <td>
              <div id="divToPrint">
                 <%--<asp:Panel ID="Panel1" runat="server" >--%>
              <telerik:RadGrid ID="GV" AllowSorting="true" AllowPaging="true" runat="server" Skin="Office2007">
                  <MasterTableView DataKeyNames="CustID"  Width="100%"  AutoGenerateColumns="False" TableLayout="Fixed" CommandItemDisplay="Top">
                       <CommandItemSettings ShowExportToExcelButton="true" ShowRefreshButton="false"  ShowAddNewRecordButton="false"></CommandItemSettings>
                        <Columns>
                              <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="Sr No">
                                    <ItemTemplate>
                                        <asp:Label ID="numberLabel" runat="server" Width="30px" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                </telerik:GridTemplateColumn>
                               <telerik:GridBoundColumn DataField="ProductID" UniqueName="ProductID" HeaderText="Product Code" ItemStyle-HorizontalAlign="Right"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Product Description" UniqueName="ProductName" DataField="ProductName" ReadOnly="false" ItemStyle-Width="15%" HeaderStyle-Width="15%"> </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Cust Id" UniqueName="CustID" DataField="CustID" ReadOnly="false" ItemStyle-HorizontalAlign="Right"> </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Customer" UniqueName="CustName" DataField="CustName" ReadOnly="false" > </telerik:GridBoundColumn>
                                                         
                                <telerik:GridBoundColumn HeaderText="Mobile No" UniqueName="MobileNo" DataField="MobileNo" ReadOnly="false" Display="true" ItemStyle-HorizontalAlign="Right"> </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Rate" UniqueName="Rate" DataField="Rate" ReadOnly="false" Display="true"  DataFormatString="{0:##0.00}" ItemStyle-HorizontalAlign="Right">  </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Qty" UniqueName="Qty" DataField="Qty" ReadOnly="false" Display="true"  ItemStyle-HorizontalAlign="Right">  </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Narration" UniqueName="Narration" DataField="Narration" ReadOnly="false" Display="true"  ItemStyle-HorizontalAlign="Left">  </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn HeaderText="Date" MinDate="01/01/1900" PickerType="DatePicker" UniqueName="Date" DataType="System.DateTime" EditDataFormatString="dd-MMM-yyyy"  DataField="Date" ReadOnly="false" Display="true" DataFormatString="{0:dd-MMM-yyyy}" EditFormColumnIndex="1"> </telerik:GridDateTimeColumn>
                                <telerik:GridDateTimeColumn HeaderText="Time" MinDate="01/01/1900" PickerType="TimePicker"  UniqueName="Time" DataType="System.DateTime" EditDataFormatString="hh:mm tt"  DataField="Time" ReadOnly="false" Display="true" DataFormatString="{0:hh:mm tt}" EditFormColumnIndex="1"> </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn HeaderText="Address" UniqueName="Address" DataField="Address" ReadOnly="false" > </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn HeaderText="User" UniqueName="User" DataField="User" ReadOnly="false" Display="true" > </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn HeaderText="Counter No" UniqueName="CounterNo" DataField="CounterNo" ReadOnly="false" Display="true" ItemStyle-HorizontalAlign="Right"> </telerik:GridBoundColumn>
                                
                                
                        </Columns>
                      
                        <NoRecordsTemplate>
                            No Record Found
                        </NoRecordsTemplate>
                      </MasterTableView>
              </telerik:RadGrid>
                    <%-- </asp:Panel> --%>
                  </div> 
          </td>
      </tr>
    </table>
</asp:Content>

