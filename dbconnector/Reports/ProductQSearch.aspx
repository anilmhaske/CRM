<%@ page title="Product Stock Position" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="ProductQSearch, App_Web_productqsearch.aspx.dfa151d5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
    <script type="text/javascript">
        function openWin() 
        {

            var strLobName = document.getElementById('<%=cmbLobID.ClientID%>').value;
            var strSearchType = document.getElementById('<%=cmbSearchType.ClientID%>').value;
            var strSearchString = document.getElementById('<%=txtSearchString.ClientID%>').value;
            var oWnd = radopen("SearchWindow.aspx?SearchLob=" + strLobName + "&SearchType=" + strSearchType+ "&SearchString=" + strSearchString + "" , "RadWindow1");
            
        }
        function OnClientClose(oWnd, args) 
        {
            var arg = args.get_argument();
            if (arg) 
            {
                var searchString = arg.searchString;
                document.getElementById('<%=txtSearchString.ClientID%>').value = searchString
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="Timer1">
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
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" style="width:100%" >
    
    <table align="center" width="95%">
        <tr style="height:25px;" align="center"  >
            <td>
                <table align="center" width="90%"  style="text-align:left">
                    <tr>
                        <td style="background-color:#99CCFF; height:25px;" >
                            <b>Product Stock Position</b>
                        </td>
                    </tr>
                </table> 
            </td>
        </tr>
        <tr align="center"  >
            <td align="center">
                <table >
                    <tr>
                        <td style="text-align: left;" >Search Type</td>
                        <td style="text-align: left;">
                            <asp:DropDownList ID="cmbLobID" runat="server" AutoPostBack="True"></asp:DropDownList> &nbsp;&nbsp;
                            <asp:DropDownList ID="cmbSearchType" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td style="text-align: left;" ></td>
                    </tr>
                    <tr>
                        <td style="text-align: left;vertical-align:top ; " >Search String</td>
                        <td style="text-align: left;">
                            <asp:TextBox ID="txtSearchString" runat="server" Width="250px"></asp:TextBox>
                                <telerik:RadComboBox ID="cmbProductName" runat="server" 
                                    Font-Names="Verdana" Font-Size="Small"  Width="250px"  Visible="false"
                                    style="font-size: small" EnableAutomaticLoadOnDemand="True"  
                                    OnClientItemsRequested="OnClientItemsRequested" 
                                    OnClientItemsRequesting="OnClientItemsRequesting" Skin="Vista" 
                                    OnClientDropDownClosed="OnClientDropDownClosed" EnableItemCaching="true" 
                                    EnableLoadOnDemand="True">
                                    <ExpandAnimation Type="none" />
                                    <CollapseAnimation Type="none" />
                                    <WebServiceSettings Path="../Service/ComboFill.asmx"  Method="FillProductName" />
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock runat="Server" ID="RadScriptBlock1">
                                <script type="text/javascript">
                                    var startTime;
                                    var sendRequest = true;
                                    var calculate = false;
                                    function OnClientItemsRequesting(sender, args) {
                                        var input = $find('<%= cmbProductName.ClientId %>');
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
                                 </telerik:RadScriptBlock> <br />
                                Don't know exact word?
                                <asp:LinkButton ID="lnkFindNow" runat="server">find now</asp:LinkButton> <br />                        
                        </td>
                        <td style="text-align: center;" >
                        
                        </td>
                    </tr>   
                    <tr>
                        <td style="text-align: left;"><asp:CheckBox ID="chkWithZero"  Text="With Zero Stock" runat="server" /></td>
                        <td style="text-align: left;"><asp:Button ID="btnSubmit" runat="server" Text="Show Matrix" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSelectBranch" runat="server" Text="Select Branch" />
                        </td>                    
                        <td style="text-align: left;" >
                         </td>
                    </tr>
                </table>       
            </td>
        </tr>
        <tr align="center"  >
        <td>
            <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table align="center" width="90%"  style="text-align:left">
                        <tr>
                            <td style="background-color:yellow; height:10px;" >
                                <asp:Label ID="lblInformation" runat="server" Text="Product Matrix"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                    <RowStyle ForeColor="#000066" />
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                </table>
                </ContentTemplate> 
            </asp:UpdatePanel> 
            <br />
        </td>
    </tr>    
    </table>

    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Web20" ReloadOnShow="true" DestroyOnClose="false" Overlay="True" style="z-index: 7001" >        
        <Windows>
            <telerik:RadWindow 
                id="RadWindow1"
                runat="server" RestrictionZoneID="zoneID1"
                width="600px"  OnClientClose="OnClientClose"
                height="520px" NavigateUrl="#" 
                title="Search Product"
                TabIndex="1"
                behaviors="Move,Close" Modal="true" IconUrl="#">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    </telerik:RadAjaxPanel>
    <telerik:RadWindow ID="rwndProductQBranch" Visible="true" Title = "Select Branch"  runat="server" Width="310px" Height ="400px" Skin="Simple" Behaviors="Move,Close,Reload" Top="270px" Left ="516px">
    <ContentTemplate >
        <center >
            <asp:UpdatePanel ID="upPnlBranch" runat="server" >
                <ContentTemplate >
                    <table>
                        <tr>
                            <td valign="top" ><asp:CheckBox ID="chkAllSelectBranch" runat="server" Text = "Select All" AutoPostBack="true"/><%--<asp:Label ID="lblSelectSellingBranch" runat="server" Text="Select All "></asp:Label>--%></td>
                        </tr>
                        <tr>
                            <td valign="top" >
                                <telerik:RadListView ID="rdlstViewBranch" Visible="true" Height="300px" Width="150px" runat="server">
                                    <LayoutTemplate>
                                        <table  border="1" cellspacing="0">                                             
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
                            <td align = "center"><asp:Button ID="btnok" runat="server" Text="OK" />
                                <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                            </td>    
                        </tr>
                    </table>                
                </ContentTemplate>
            </asp:UpdatePanel>                          
        </center>
    </ContentTemplate>
</telerik:RadWindow>    
</asp:Content>

