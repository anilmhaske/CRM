<%@ page language="VB" autoeventwireup="false" inherits="SearchWindow, App_Web_searchwindow.aspx.dfa151d5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Search</title>
    
    <style type="text/css">
        .gvFixedHeader
        {
          font-weight:bold;
          position:relative;
          background-color:White;
        }
  </style>
  
    
</head>
<body>
    <form id="form1" runat="server">
    
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function returnToParent() {
            var oArg = new Object();
            oArg.searchString = document.getElementById('<%=txtSearchString.ClientID%>').value;
            var oWnd = GetRadWindow();
            oWnd.close(oArg);
        }
    </script>
    
    <script type ="text/javascript">
        function CheckOne(obj) 
        {
            document.getElementById('<%=txtSearchString.ClientID%>').value = obj.value
        }
        
    </script>
        
    <table width="90%" align="center"   cellspacing="0" cellpadding="0">
        <tr>
            <td style="background-color:Yellow;" >
                <b>Search Result </b> &nbsp;&nbsp;
                <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
                <asp:Panel ID="pnlWrapper" runat="server" Height="350px" Width="500px" ScrollBars="Vertical" >
                <asp:GridView ID="GV" runat="server" BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" >
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <HeaderStyle CssClass="gvFixedHeader" BackColor="#990000" Font-Bold="True" 
                        ForeColor="#FFFFCC" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <input id="chkSelectOne" name="group1" onclick="CheckOne(this)" type="radio" 
                                    value='<%# Eval("Result") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>        
            </asp:Panel>
            </td>   
        </tr>
        <tr>
            <td align="center">
                <hr />
                <button title="Submit" id="close" onclick="returnToParent(); return false;"> Submit</button>    
                <div style="display:none;"> 
                    <asp:TextBox ID="txtSearchString" runat="server"  Width="0px"  ReadOnly="True"  />
                </div>
            </td>
        </tr>

    </table>
        
   </form>
</body>
</html>
