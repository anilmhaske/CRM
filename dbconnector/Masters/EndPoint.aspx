<%@ page title="Retailware End Point" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="EndPoint, App_Web_endpoint.aspx.6044e34" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br /><br />

        <table width="80%" align="center">
            <tr>
                <td style="font-size:15px" >Running WebServices</td>
            </tr>
        </table> 
        <table align="center" width="80%" border="1"  style="border-color :#66CCFF" cellspacing="0" cellpadding="0">
        
            <tr>
                <td width="10%"  height="25px" align="center" bgcolor="#66CCFF">CodeNo</td> 
                <td width="20%" height="25px" align="center" bgcolor="#66CCFF">Service Name</td>
                <td width="55%" height="25px" align="center" bgcolor="#66CCFF">Service Description</td>
                <td width="15%" height="25px" align="center" bgcolor="#66CCFF">Access Point</td>
            </tr>
            <tr>
                <td  align="center">WS001</td>
                <td  align="center"><br />Sales Return <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables the branches to do sales return of items <br />
                    which are sold at one branch and sales return at other branch <br />
                    using head office data.<br /><br />
                </td> 
                <td  align="center"><a href="../Service/SalesReturn.asmx">Click here !</a></td>
            </tr>
            <tr>
                <td  align="center">WS002</td>
                <td  align="center"><br />Remote Purchase <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables the purchse applicable branch to do <br />
                    purchase from local machine <br />
                    Here product/master creation happens at cental ho<br /><br />
                </td> 
                <td  align="center"><a href="../Service/RemotePurchase.asmx">Click here !</a></td>
            </tr>
            <tr>
                <td  align="center">WS003</td>
                <td  align="center"><br />Loyalty Points <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables the branch to get the customer <br />
                    loyalty accumulation points and ledger for transactions from variour branches.
                    <br />
                    <br />
                </td> 
                <td  align="center"><a href="../Service/LoyaltyScheme.asmx">Click here !</a></td>
            </tr>
            <tr>
                <td  align="center">WS004</td>
                <td  align="center"><br />Branch Information
                    <br />
                    ( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables the user to get branch information like <br />Live Score,Product Quick Search<br /><br />
                </td> 
                <td  align="center"><a href="../Service/BranchInfo.asmx">Click here !</a></td>
            </tr>
            <tr>
                <td  align="center">WS005</td>
                <td  align="center"><br />Gift Voucher&nbsp; <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables branch to Pull,Capture,Release Gift Voucher Payments with validations<br /><br />
                </td> 
                <td  align="center"><a href="../Service/GiftVoucher.asmx">Click here !</a></td>
            </tr>
            <tr>
                <td  align="center">WS006</td>
                <td  align="center"><br />Mobile Apps&nbsp; <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables handheld device to communicate and do live transactions with database server<br /><br />
                </td> 
                <td  align="center"><a href="../Service/MobileApp.asmx">Click here !</a></td>
            </tr>
                  <tr>
                <td  align="center">WS007</td>
                <td  align="center"><br />Remote GRN&nbsp; <br />( V1.0 )<br /></td> 
                <td >
                    <br />
                    This service enables subscriber (registered supplier) to do Remote GRN<br /><br />
                </td> 
                <td  align="center"><a href="../Service/RemoteGRN.asmx">Click here !</a></td>
            </tr>
        </table>
        <table width="80%" align="center" style="height:100px">
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table> 

</asp:Content>

