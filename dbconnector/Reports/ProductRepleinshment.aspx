<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_ProductRepleinshment, App_Web_productrepleinshment.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 150px;
        }
        .style2
        {
            width: 101px;
        }
    </style>

<script type="text/javascript">
    function requestStart(sender, args) {
        if (args.get_eventTarget().indexOf("btnExport") >= 0)
            args.set_enableAjax(false);
    }
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="requestStart">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="pnlGrid" LoadingPanelID="LoadingPanel1"    />
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
  

    <asp:Panel ID="pnlControls" runat="server" Height="140px">
        <table align="center" width="100%"   style="text-align:left">
            <tr >
                <td style="background-color:#99CCFF; height:25px;">
                    <b>Product Replenishment Report</b>
                </td>
            </tr>
         </table> 
        <table>
            <tr>
                <td class="style2" valign="top" ><asp:Label ID="lblSaleDays" runat="server" Text="Sale Days"></asp:Label></td>   
                <td valign="top" ><asp:TextBox ID="txtSaleDays" runat="server" Width="122px"></asp:TextBox> </td> 
                <td valign="top" ><asp:Label ID="lblProductDesc" runat="server" Text="Enter Product Id/Text*"></asp:Label></td> 
                <td valign="top" ><asp:TextBox ID="txtProductID" runat="server" Width="200px"></asp:TextBox></td>  
            </tr>
            <tr>
                <td class="style2" valign="top" ><asp:Label ID="lblSellingBranch" runat="server" Text="Selling Branch"></asp:Label></td>
                <td class="style1" valign="top" ><asp:Button ID="btnSelectSellingBranch" runat="server" Text="Select Branch" Width="130px" /></td>    
                <td valign="top" ><asp:Label ID="lblGroupAttribute" runat="server" Text="Group Attribute"></asp:Label></td>
                <td valign="top" ><asp:DropDownList ID="ddlGroupAttribute" runat="server" Width="200px" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="style2" valign="top" ><asp:Label ID="lblTargetBranch" runat="server" Text="Target Branch" /></td>    
                <td class="style1" valign="top" ><asp:Button ID="btnTargetBranch" runat="server" Text="Select Branch" Width="129px" /></td>                
                <td valign="top" ><asp:CheckBox ID="chkNested" runat="server" Text="With Nested" /></td>
                <%--<td valign="top" ><asp:CheckBox ID="chkAutoColumnWidth" runat="server" Text= "Auto Fit Column Width"/></td>--%>
                <%--<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" style="width:100%">
                    <td><asp:Button ID="btnShow" runat="server" Text="Show" ValidationGroup="txtGroup" /></td>--%>
                   <%--<td><asp:Button ID="btnExport" runat="server" Text="Export" /></td>--%>
               <%-- </telerik:RadAjaxPanel> --%>
            </tr>
            <tr><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter numbers only" ControlToValidate="txtSaleDays"  ValidationGroup ="txtGroup" ValidationExpression= "^[0-9]*$"></asp:RegularExpressionValidator></tr>
        </table>
        <table>
            <tr>
                <td>
                   <%-- <telerik:RadWindow ID="rwndSellingBranch" Visible="true" Title = "Select Selling Branch"  runat="server" Width="260px" Height ="320px" Skin="Simple" Behaviors="Move,Close,Reload" Top="220px" Left ="116px">--%>
                    <telerik:RadWindow ID="rwndSellingBranch" Visible="true" Title = "Select Selling Branch"  runat="server" Width="310px" Height ="375px" Skin="Simple" Behaviors="Move,Close,Reload" Top="220px" Left ="116px">
                        <ContentTemplate >
                         <center >
                         <asp:UpdatePanel ID="upPnlSellingBranch" runat="server" >
                         <ContentTemplate >
                             <table>
                                    <tr>
                                        <td valign="top" ><asp:CheckBox ID="chkAllSelectSellingBranch" runat="server" Text = "Select All" AutoPostBack="true"/><%--<asp:Label ID="lblSelectSellingBranch" runat="server" Text="Select All "></asp:Label>--%></td>
                                    </tr>
                                            <tr>
                                            <td valign="top" >
                                            <telerik:RadListView ID="rdlstViewSellingBranch" Visible="true" Height="300px" Width="150px" runat="server">
                                             <LayoutTemplate>
                                             <table  border="1" cellspacing="0">
                                             
                                                <tr style="background-color: #D9DFDF;">
                                                    <th id="Th1" runat="server">
                                                        ID
                                                    </th>
                                                    <th id="Th2" runat="server">
                                                        Branch Name
                                                    </th>
                                                    <th id="Th3" runat="server">
                                                        ShortName
                                                    </th>
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
                                        <td align = "center"><asp:Button ID="btnok" runat="server" Text="OK" />
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel" /></td>    
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
        <table>
            <tr>
                <td>
                    <telerik:RadWindow ID="rwndTargetBranch" Visible="true" Title = "Select Target Branch" runat="server" Width="300px" Height ="370px" Skin="Simple" Behaviors="Move,Close,Reload" Top="250px" Left ="116px">
                        <ContentTemplate >
                            <center >
                            <asp:UpdatePanel ID="upPnlTargetBranch" runat="server" >
                            <ContentTemplate >
                                <table>
                                    <tr>
                                        <td valign="top" >
                                            <asp:CheckBox ID="chkAllTargetBranch" runat="server" Text= "Select All" AutoPostBack="true"/><%--<asp:Label ID="lblBranch" runat="server" Text="Select All "></asp:Label>--%></td>
                                    </tr>
                                    <tr>
                                    <td valign="top" >
                                          <telerik:RadListView ID="rdLstViewTargetBranch" Visible="true" Height="300px" Width="150px" runat="server">
                                            <LayoutTemplate>
                                             <table  border="1" cellspacing="0">
                                             
                                                <tr style="background-color: #D9DFDF;">
                                                    <th id="Th1" runat="server">
                                                        ID
                                                    </th>
                                                    <th id="Th2" runat="server">
                                                        Branch Name
                                                    </th>
                                                    <th id="Th3" runat="server">
                                                        ShortName
                                                    </th>
                                                </tr>
                                                <tr runat="server" id="itemPlaceholder" />
                                            </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                            <tr id="Tr2" runat="server">
                                                <td>
                                                    <asp:Label ID="targetBranchID" runat="Server" Text='<%#Eval("BRanchID") %>' />
                                                </td>
                                                <td valign="top">
                                             <%--   <telerik:RadListBox runat="server" >
                                                </telerik:RadListBox>--%>
                                                    <asp:CheckBox ID="targetBranchName" runat="Server" Text='<%#Eval("BranchName") %>' />
                                                </td>
                                                <td valign="top">
                                                    <asp:Label ID="targetShortname" runat="Server" Text='<%#Eval("Shortname") %>' />
                                                </td>
                                            </tr>
                                            </ItemTemplate>
                                            </telerik:RadListView>
                                    </td>

         <%--                               <td><telerik:RadListBox ID="rdlstTargetBranch" Height="180px" width="220px" runat="server" CheckBoxes="True">
                                               <Items><telerik:RadListBoxItem Text="Month"></telerik:RadListBoxItem> </Items>
                                            </telerik:RadListBox>
                                        </td>--%>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align = "center"><asp:Button ID="btnokk" runat="server" Text="OK" />
                                                             <asp:Button ID="btnCut" runat="server" Text="Cancel" /></td>    
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

         
    </asp:Panel>
  
   <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" style="width:100%">
   <table width="100%">
   <tr align="center" >
    <td valign="top" >
    <asp:Button ID="btnShow" runat="server" Text="Show" ValidationGroup="txtGroup" /> &nbsp;
    <asp:Button ID="btnExport" runat="server" Text="Export" /></td>
  </tr>  
  </table>  
    <asp:Panel ID="pnlGrid" runat="server" Width="100%">
        <table width="100%">
            <tr>
            <td>
            <%--<asp:UpdatePanel ID="upPnlGrid" runat="server" >
            <ContentTemplate >--%>

            <asp:GridView AutoGenerateColumns="false" Width="100%" Visible="false" EmptyDataText="No Data Found !" ID="gvReport" runat="server" BackColor="White" BorderColor="#CCCCCC" AllowPaging="true" PageSize="20"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" HeaderStyle-Wrap="true" PagerSettings-Mode="Numeric" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Prev">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            
            
            <RowStyle ForeColor="#000066" Wrap="true" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle HorizontalAlign="Left" BackColor="#99CCFF" Font-Bold="True" ForeColor="Black" />
            <emptydatarowstyle Width="100%" backcolor="LightSkyBlue" forecolor="Red" Font-Bold="true" />
            </asp:GridView>
            <table>
            <tr>
                <td>
                Page Size :
                <asp:DropDownList ID="ddlList" AutoPostBack="true"  runat="server" >
                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem Selected="True" >20</asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Value="40" Text="40"></asp:ListItem>
                <asp:ListItem>50</asp:ListItem>                                        
                </asp:DropDownList>
                </td>
            </tr>
            </table>
            <%-- </ContentTemplate>
            </asp:UpdatePanel>--%>
            </td>
            </tr>
        </table>
    </asp:Panel>
  </telerik:RadAjaxPanel> 
  <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server"  Skin="Office2007"  />
</asp:Content>
                                                      
                                                                
                                                                    
                                                             
                                                               
                                                                    
                                                               
                                                               

