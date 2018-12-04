<%@ page title="Login Here" language="VB" masterpagefile="~/MasterPage/Index.master" autoeventwireup="false" inherits="Login, App_Web_login.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="50%" >
        <tr>
            <td align="left" valign="top">
                <table align="center" width="100%" cellspacing="0" cellpadding="0">
                <tr style="height:30px;"> 
                    <td valign="bottom" >&nbsp;</td>
                    <td colspan="2" valign="bottom" >&nbsp;</td>
                </tr>

        <tr style="height:30px;"> 
            <td valign="middle" style="text-align:center" >
                
            </td>
            <td colspan="2" valign="bottom" >
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/signin.jpg" />
                Sign in !  &nbsp;&nbsp; Build :
                <asp:Label ID="lblVersionNo" runat="server" Text="V1.031210"></asp:Label>
            </td>
        </tr>
        <tr style="height:1px;"> 
            <td colspan="3"><hr /></td>
        </tr>
        <tr style="height:30px;"> 
            <td align="center" valign="middle" rowspan="4" style="width:200px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/celebrating.jpg" />
            </td>
            <td colspan="2" align="left" valign="middle">
                <b>Please Enter Your credential?</b>
            </td>
        </tr>
        <tr style="height:30px;"> 
            <td width="150"  align="left" valign="middle">LoginName</td>
            <td width="340" valign="middle"><asp:TextBox ID="txtLoginName" runat="server" Text="" Width="200px" ></asp:TextBox></td>
        </tr>
        <tr style="height:30px;"> 
            <td width="150"  align="left" valign="middle">Password</td>
            <td width="340" valign="middle">
                <asp:TextBox ID="txtPassword" runat="server" Text="" TextMode="Password"  Width="200px" ></asp:TextBox>
            </td>
        </tr>
        <tr style="height:30px;"> 
            <td  width="150" height="30px" align="left" valign="middle">&nbsp;</td>
            <td  width="340" height="30px" align="left" valign="middle"> 
                <asp:Button  ID="btnSubmit" runat="server" Text="Submit"></asp:Button>
            </td>
        </tr>
        <tr style="height:1px;"> 
            <td colspan="3"><hr /></td>
        </tr>    
        <tr style="height:110px;"> 
            <td align="center"> 
                &nbsp;</td>
            <td colspan="2" align="center"> 
                <br /><br />
            </td>
        </tr>

    </table>
            </td>
        </tr>
    </table>
</asp:Content>

