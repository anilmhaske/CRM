<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Reports_BranchwiseProductReorderLevelList, App_Web_branchwiseproductreorderlevellist.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="Timer1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="LoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="Panel2" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="DropDownList1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="Panel1" />
                <telerik:AjaxUpdatedControl ControlID="Panel2" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" />
    <div>
       
        <table align="center" width="95%">
        <tr style="height:25px;background-color:#D2F0FF; " align="left"  >
            <td>
                <b>Branch Wise Product Reorder Level</b>             
            </td>
        </tr>
        <tr align="center"  >
            <td align="left">
                <table>
                    <tr>
                        <%--<td valign="top" >
                            Change Timer Interval:
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="5 seconds" Value="5000"></asp:ListItem>
                                <asp:ListItem Text="30 seconds" Value="30000"></asp:ListItem>
                                <asp:ListItem Text="1 minute" Value="60000"  Selected="True"></asp:ListItem>
                                <asp:ListItem Text="2 minute" Value="120000"></asp:ListItem>
                                <asp:ListItem Text="5 minute" Value="300000"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Panel ID="Panel2" runat="server">
                                &nbsp;Last Updated On :
                                <asp:Label ID="lblInterval" runat="server" Text="" Style="font-weight: bold;"></asp:Label>
                            </asp:Panel>
                        </td>--%>
                         <td>
                            <asp:Button ID="btnSelectBranch" runat="server"  Text="Select Branch"    />
                        </td>
                        <td>
                            <asp:Button ID="btnShow" runat="server"  Text="Show" />  
                        </td>
                        <td>
                                        <asp:Button ID="btnExport" runat="server" Text="Export" Enabled="false"   />
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
                            <telerik:RadWindow ID="rwndBranch" Visible="true" Title = "Select Branch"  runat="server" Width="310px" Height ="375px" Skin="Simple" Behaviors="Move,Close,Reload" Top="200px" Left ="20px">
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
                        </td>
                    </tr>      
                </table>
            </td>
        </tr>
        <tr align="Left"  >
            <td>
                <br />
                <telerik:RadGrid ID="RadGrid1" runat="server"  OnItemDataBound="RadGrid1_ItemDataBound" Skin="Office2007"  AllowPaging="true" PageSize="50"  Width="60%"   >                   
                    <%--<MasterTableView AutoGenerateColumns="False" DataKeyNames="Live"  >
                        <Columns>
                            <telerik:GridBoundColumn DataField="BranchID" HeaderText="BranchID" UniqueName="BranchID" Visible="false"  ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchName" HeaderText="BranchName" UniqueName="BranchName" Visible="true"  ></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumn">
                                <HeaderStyle Width="40px" />
                                <ItemTemplate>
                                    <asp:Image ID="Image1" AlternateText="progress" BorderWidth="0px" runat="server">
                                    </asp:Image>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Live" HeaderText="Live" UniqueName="Live" Visible="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Productid" HeaderText="Productid" UniqueName="Productid" Visible="false"  ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ProductName" HeaderText="ProductName" UniqueName="ProductName" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>                            
                            <telerik:GridBoundColumn DataField="Reorderlevel" HeaderText="Reorderlevel" UniqueName="Reorderlevel" DataFormatString="{0:0}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CStk" HeaderText="CStk" UniqueName="CStk" DataFormatString="{0:0}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" ></telerik:GridBoundColumn>
                        </Columns>                        
                    </MasterTableView>
                    <ClientSettings>
                        <Resizing  AllowResizeToFit="true" AllowColumnResize="true"  ResizeGridOnColumnResize="true"    /> 
                    </ClientSettings> --%>
                </telerik:RadGrid>
               <%-- <asp:Panel ID="Panel1" runat="server">
                    <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick" />
                </asp:Panel>--%>
                <br />
            </td>
        </tr>
    </table>
       
    </div>
</asp:Content>

