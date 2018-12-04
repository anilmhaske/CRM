<%@ page title="Salesman" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Salesman, App_Web_salesman.aspx.6044e34" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>
    <table align="center" style="width: 70%; border: 1px">
    
        <tr style="background-color:#99CCFF; height:25px;" align="center">
            <td colspan="4" align="center">
                <b>SalesMan Master >> Add/Edit Operation</b> 
            </td>
        </tr>
        <tr align="left" style="height:25px">
            <td style="width:"10%" ></td>
            <td  style="width:"20%">Operation</td>
            <td  style="width:"50%">
                <asp:RadioButton ID="optAdd"  Text="Add"  Font-Names="Verdana" Font-Size="12px"  runat="server" Checked="True" GroupName="type" AutoPostBack="True" />&nbsp;
                <asp:RadioButton ID="OptEdit" Text="Edit"  Font-Names="Verdana" Font-Size="12px" runat="server" GroupName="type" AutoPostBack="True" />
            </td>
            <td style="width:"10%" ></td>
        </tr>
        <tr align="center" style="height:25px" >
            <td ></td>
            <td align="left">
                Salesman ID</td>
            <td align="left" >
                 <asp:DropDownList ID="drlsalesmanid"  Width="100px" Height="20px" runat="server" Font-Names="Verdana" Font-Size="12px"></asp:DropDownList> &nbsp;&nbsp;
                 <asp:CheckBox ID="chkenabled" Checked="true" Text="Enabled" AutoPostBack="true"  runat="server" />
            </td>
            <td ></td>
        </tr>
        <tr align="center" style="height:25px">
            <td >
            </td>
            <td align="left" style="width:85px">
                <asp:Label ID="lblname" runat="server" Width="98px"  Text="Name"   Font-Names="Verdana" Font-Size="12px" ></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtname" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px" ></asp:TextBox> <br />
                <asp:DropDownList ID="drlname" Font-Names="Verdana" Font-Size="12px" Height="24px" runat="server" width="303px" Visible="False" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td ><asp:RequiredFieldValidator ID="ReqvName" runat="server" ErrorMessage="Please enter the Name!" ControlToValidate="txtname" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>        
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                Group&nbsp; Name</td>
            <td align="left">
                <asp:DropDownList ID="drlGroup"  Width="200px" Height="24px" runat="server" 
                    Font-Names="Verdana" Font-Size="12px" AutoPostBack="True">
                </asp:DropDownList>
            </td>        
            <td ></td>
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left">
                <asp:Label ID="lbladdress" runat="server" Width="98px"  Text="Address"   Font-Names="Verdana" Font-Size="12px" ></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtaddress" runat="server"  Font-Names="Verdana" Font-Size="12px"  Width="303px" Height="60px" TextMode="MultiLine"></asp:TextBox>
            </td>        
            <td ></td>
         </tr>
         <tr align="center" style="height:25px">
            <td></td>
            
            <td align="left">
                City</td>
            <td align="left">
                <asp:TextBox ID="txtcity" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px"></asp:TextBox>
            </td>        
            <td ></td>
         </tr>
         <tr align="center" style="height:25px">
            <td >
            </td>
            <td align="left">
                Tel No</td>
            <td align="left">
                <asp:TextBox ID="txtphone1" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px"></asp:TextBox>
            </td>        
            <td >
                <asp:RegularExpressionValidator ID="REVPhone1" runat="server" ErrorMessage="Please Enter Proper PhoneNo!" ControlToValidate="txtphone1" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
            </td>

         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            
            <td align="left" >
                Mobile No</td>
            <td align="left">
                <asp:TextBox ID="txtphone2" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px"></asp:TextBox>
            </td>    
            <td >
                            <asp:RegularExpressionValidator ID="REVPhone2" runat="server" 
                    ErrorMessage="Please Enter Proper PhoneNo!" ControlToValidate="txtphone2" 
                    ValidationExpression="\d*">*</asp:RegularExpressionValidator>

            </td>    
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left">
                Target Qty</td>
            <td align="left">
                <asp:TextBox ID="txttargetqty" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="128px"></asp:TextBox>
                Target Amt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txttargetamt" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="50px"></asp:TextBox>&nbsp;
            </td>        
            <td>
                <asp:RegularExpressionValidator ID="REVTqty" runat="server" ErrorMessage="Please Enter Proper Qty!" ControlToValidate="txttargetqty" ValidationExpression="\d*">*</asp:RegularExpressionValidator>            
                <asp:RangeValidator ID="RangeVTAmt" runat="server" ErrorMessage="Please enter Proper Amount!" ControlToValidate="txttargetamt" MaximumValue="999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
            </td>
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                <asp:Label ID="lbltargetPoints" runat="server" Width="98px"  Text="Target Points"   Font-Names="Verdana" Font-Size="12px" ></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txttargetpoints" Height="18px" runat="server" Font-Names="Verdana" 
                    Font-Size="12px"  Width="129px"></asp:TextBox>
                Points Earned
                <asp:TextBox ID="txtpointsearned" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="50px"></asp:TextBox>
            </td>
            <td >
                <asp:RegularExpressionValidator ID="REVtPoints0" runat="server" 
                    ControlToValidate="txttargetpoints" ErrorMessage="Please Enter Proper Points!" 
                    ValidationExpression="\d*">*</asp:RegularExpressionValidator>
                <asp:RangeValidator ID="RvPtsearned0" runat="server" 
                    ControlToValidate="txtpointsearned" 
                    ErrorMessage="Please enter Proper Earned Points!" MaximumValue="999999" 
                    MinimumValue="0" Type="Double">*</asp:RangeValidator>
             </td>
        
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" style="width:85px">
                Reference No</td>
            <td align="left">
                <asp:TextBox ID="txtrefno" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px"></asp:TextBox>
            </td>  
            <td >
                <asp:RegularExpressionValidator ID="REVRefNo0" runat="server" 
                    ControlToValidate="txtrefno" ErrorMessage="Please Enter Proper Ref.No!" 
                    ValidationExpression="\d*">*</asp:RegularExpressionValidator>
             </td>      
         </tr>
        <tr align="center" style="height:25px">
             <td colspan="4">
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
             </td> 
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
     <table align="center" style="width: 70%; border: 1px;background-color:#99CCFF;">
        <tr align="center" style="height:20px">
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="70px" />
            </td>
        </tr>
    </table>
    
    
</asp:Content>

