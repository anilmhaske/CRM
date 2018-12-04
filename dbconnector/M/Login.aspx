<%@ page title="Login" language="VB" masterpagefile="~/M/Index.master" autoeventwireup="false" inherits="M_Login, App_Web_login.aspx.4fd81c8b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="90%">
             <tr>
                <td align="center">LoginName</td>
            </tr>
            <tr>
                <td align="center"> <asp:TextBox ID="txtLoginName" runat="server"></asp:TextBox> </td> 
            </tr>
            <tr>
                <td align="center">Password</td>
            </tr>
            <tr>
                <td align="center"> <asp:TextBox ID="txtPassword" runat="server" 
                        TextMode="Password"></asp:TextBox> </td> 
            </tr>
            
            <tr>
                <td align="center">
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign In" onclick="btnSignIn_Click"  />
                        
                </td>
            </tr>
            <tr>
                <td align="center"> &nbsp;</td>
            </tr>
        </table>
</asp:Content>

