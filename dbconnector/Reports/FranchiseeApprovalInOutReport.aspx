<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Section_Admin_FranchiseeApprovalInOutReport, App_Web_franchiseeapprovalinoutreport.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" >
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>                                     
                    <telerik:AjaxUpdatedControl ControlID="rgvFranchiseeReport" LoadingPanelID="LoadingPanel1"/>
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

    <asp:UpdatePanel ID="up1" runat="server"  UpdateMode="Conditional">    
        <ContentTemplate>    
            <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server"  Skin="Office2007"  />
            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" style="width:100%">
                <br />
                <table width="98%" align="center"  >
                     <tr style="background-color:#99CCFF; height:25px;" align="center">
                        <td align="left" colspan="4" >
                            <b>Franchisee Approval Report</b> 
                        </td>
                    </tr>
                    <tr>
                        <td style="width:13%" >
                            Branch(Franchisee)
                        </td>
                        <td style="width:27%">
                            <telerik:RadComboBox ID="rcbBranch_Frnch" runat="server" Width="300px"></telerik:RadComboBox>                                                       
                        </td>
                        <td style="width:15%">
                            Branch(Warehouse)
                        </td>
                        <td>
                            <telerik:RadComboBox ID="rcbBranch_wrhs" runat="server" Width="300px"></telerik:RadComboBox>                                                       
                        </td>
                    </tr>
                    <%--<tr>
                         <td style="width:13%">
                            Approval In Date
                        </td>
                        <td style="width:25%">
                             From
                            <telerik:RadDatePicker ID="rdpAppInFromDate"  Width="120px" runat ="server" DateInput-DateFormat="dd-MM-yyyy">                                
                                <DateInput ID="DateInput3" DisplayDateFormat ="dd-MMM-yyyy" DateFormat="dd-MMM-yy"  runat="server" Height="24px"></DateInput>                              
                            </telerik:RadDatePicker>   
                            To        
                             <telerik:RadDatePicker ID="rdpAppInToDate"  Width="120px" runat ="server" DateInput-DateFormat="dd-MM-yyyy">                                
                                <DateInput ID="DateInput4" DisplayDateFormat ="dd-MMM-yyyy" DateFormat="dd-MMM-yy"  runat="server" Height="24px"></DateInput>                              
                            </telerik:RadDatePicker> 
                        </td>
            
                        <td style="width:15%">
                           Approval In VoucherNo 
                        </td>
                        <td>
                           From
                            <asp:TextBox ID="txtAppInFromVchno" runat="server" Width="120px" ></asp:TextBox>      
                            To
                            <asp:TextBox ID="txtAppInToVchno" runat="server" Width="120px" ></asp:TextBox>                                                   
                        </td>
                    </tr>--%>
                    <tr>
                       <td style="width:13%">
                            Approval Out Date 
                        </td>
                        <td style="width:25%">
                            From
                            <telerik:RadDatePicker ID="rdpAppOutFromDate"  Width="120px" runat ="server" DateInput-DateFormat="dd-MM-yyyy"   >                                
                                <DateInput ID="DateInput1" DisplayDateFormat ="dd-MMM-yyyy" DateFormat="dd-MMM-yy"  runat="server" Height="24px"></DateInput>                              
                            </telerik:RadDatePicker>     
                            To 
                            <telerik:RadDatePicker ID="rdpAppOutToDate"  Width="120px" runat ="server" DateInput-DateFormat="dd-MM-yyyy" Calendar-Width="300px" >                                
                                <DateInput ID="DateInput2" DisplayDateFormat ="dd-MMM-yyyy" DateFormat="dd-MMM-yy"  runat="server" Height="24px"></DateInput>                              
                            </telerik:RadDatePicker>     
                        </td>
                        <td style="width:15%">
                           Approval Out VoucherNo
                        </td>
                        <td>
                            From
                            <asp:TextBox ID="txtAppOutFromVchno" runat="server" Width="120px" ></asp:TextBox>   
                            To
                            <asp:TextBox ID="txtAppOutToVchno" runat="server" Width="120px" ></asp:TextBox>                                    
                        </td>
                    </tr>
       
                    <tr>
                        <td style="width:13% ">
                            Product Code
                        </td>
                        <td style="width:25%">               
                            <asp:TextBox ID="txtProductCode" runat="server" Width="300px" ></asp:TextBox>
                        </td>
                        <td style="width:15%">
                           Grouping On
                        </td>
                        <td>
                            <telerik:RadComboBox ID="rcbGroupingOn" runat="server" Width="300px">
                                <Items>
                                    <telerik:RadComboBoxItem Value="1" Text="Voucher Wise"  Selected="true"   />
                                    <telerik:RadComboBoxItem Value="2" Text="Product Wise"   />
                                </Items> 
                            </telerik:RadComboBox>                                  
                        </td>
                    </tr>
                    <tr>
                        <td style="width:13% ">
                            <asp:CheckBox Id="chkShowDiff" runat="server" Text="Show Difference"  Visible="false"    /> 
                        </td>
                        <td style="width:25%" >

                        </td>
                        <td align="center"   >
                            <table width="10%" >
                                <tr>
                                    <td>
                                        <asp:Button ID="btnShow" runat="server" Text="Show" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnExport" runat="server" Text="Export" Enabled="false"   />
                                    </td>
                                </tr>
                            </table> 
                        </td>            
                    </tr>
                    <tr>
                        <td colspan="4" >
                            <telerik:RadGrid ID="rgvFranchiseeReport" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Skin="Office2007" Width="95%"  >
                                <MasterTableView CommandItemDisplay="Top" TableLayout="Fixed"     >      
                                    <CommandItemTemplate >
                                        <div  id="divCommand"  style="padding: 2px 2px; vertical-align:text-top ;"  >
                                            <table id="tblCommand"  width="100%" cellpadding="0" cellspacing="0"  >
	                                            <tr >
                                                    <td style="Width:20%">
                                                       <%-- <asp:Label runat="server" ID="lblGrpHeader" Text="" ></asp:Label>  --%>
                                                    </td>
		                                            <td style="border-Left : 1px solid black;width:54% " >		
                                                        &nbsp;&nbsp;Net Approval	                                 
                                                        <%--<asp:Label runat="server" ID="lblNetApproval" Text="&nbsp;&nbsp;Net Approval" Width="57%"  ></asp:Label>--%>  
		                                            </td>
		                                            <td style="border-Left : 1px solid black" >			                               
                                                        &nbsp;&nbsp;Net Consignment
                                                        <%--<asp:Label runat="server" ID="lblNetConsignment" Text="&nbsp;&nbsp;Net Consignment" ></asp:Label>--%>  
		                                            </td>
	                                            </tr>
                                            </table>
                                        </div> 
                                    </CommandItemTemplate>                                       
                                    <Columns>                         
                                       <telerik:GridBoundColumn DataField="FromBranch" UniqueName="FromBranch" HeaderText="From" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="8%"  ItemStyle-Width="8%" >                               
                                       </telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ToBranch" UniqueName="ToBranch" HeaderText="To" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="8%"  ItemStyle-Width="8%" ></telerik:GridBoundColumn>                           
                                       <telerik:GridBoundColumn DataField="ApprovalOutVchno" UniqueName="ApprovalOutVchno" HeaderText="Apvl Out Vchno" HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="4%"  ItemStyle-Width="4%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ApprovalOutVchDate" UniqueName="ApprovalOutVchDate" HeaderText="Apvl Out Date" DataFormatString="{0:dd-MMM-yyyy}"  HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="6%"  ItemStyle-Width="6%"  ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ApvlSrno" UniqueName="ApvlSrno" HeaderText="Srno" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="2%"  ItemStyle-Width="2%"   ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ProductID" UniqueName="ProductID" HeaderText="Product Code"  HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="4%"  ItemStyle-Width="4%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="BatchNo" UniqueName="BatchNo" HeaderText="Batch No" HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="3%"  ItemStyle-Width="3%"  ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ProductName" UniqueName="ProductName" HeaderText="Product Description"  HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="10%"  ItemStyle-Width="10%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ApvlOutQty" UniqueName="ApvlOutQty" HeaderText="Issue Qty" DataFormatString="{0:#0}" HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="3%" ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ReturnQty" UniqueName="ReturnQty" HeaderText="Return Qty" DataFormatString="{0:#0}"  HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="3%" ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="BilledQty" UniqueName="BilledQty" HeaderText="Billed Qty" DataFormatString="{0:#0}" HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="OutstandingQty" UniqueName="OutstandingQty" HeaderText="Outstanding Qty" DataFormatString="{0:#0}"  HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="5%"  ItemStyle-Width="5%"></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ConsInVchNo" UniqueName="ConsInVchNo" HeaderText="Cons. In VchNo"  HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="4%"  ItemStyle-Width="4%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ConsInVchDate" UniqueName="ConsInVchDate" HeaderText="Cons. In Date" DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="6%"  ItemStyle-Width="6%"    ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ConsSrNo" UniqueName="ConsSrNo" HeaderText="Srno"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="2%"  ItemStyle-Width="2%"  ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ConsInQty" UniqueName="ConsInQty" HeaderText="In Qty" DataFormatString="{0:#0}" HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="ConsOutQty" UniqueName="ConsOutQty" HeaderText="Out Qty" DataFormatString="{0:#0}" HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="SoldQty" UniqueName="SoldQty" HeaderText="Sold Qty" DataFormatString="{0:#0}" HeaderStyle-Wrap="true" Visible="false"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%"  ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="SRQty" UniqueName="SRQty" HeaderText="SR Qty" DataFormatString="{0:#0}" Visible="false" HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%" ></telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="CurrentStock" UniqueName="CurrentStock" DataFormatString="{0:#0}" HeaderText="Current Stock" HeaderStyle-Wrap="true" Visible="false"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%" ></telerik:GridBoundColumn>    
                                       <telerik:GridBoundColumn DataField="HoBilledQty" UniqueName="HoBilledQty" DataFormatString="{0:#0}" HeaderText="Ho Billed Qty" HeaderStyle-Wrap="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  HeaderStyle-Width="3%"  ItemStyle-Width="3%"></telerik:GridBoundColumn>                           
                                   </Columns> 
                               </MasterTableView> 
                           </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadAjaxPanel>        
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="btnExport"  />            
        </Triggers> 
    </asp:UpdatePanel>
</asp:Content>

