<%@ page language="VB" autoeventwireup="false" inherits="abc, App_Web_abc.aspx.cdcab7d2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" AsyncPostBackTimeout="36000"></telerik:RadScriptManager>
    <telerik:RadGrid ID="RadGrid1" runat="server"  Skin="Office2007"  Width="80%" AllowPaging="true" PageSize="50">
    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
