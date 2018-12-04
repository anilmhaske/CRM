<%@ page title="Supplier" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Supplier, App_Web_supplier.aspx.6044e34" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>
    <table align="center" style="width: 70%; border: 1px">
        <tr style="background-color:#99CCFF; height:25px;" align="center">
            <td colspan="4" align="center">
                <b>Supplier Master >> Add/Edit Operation</b> 
            </td>
        </tr>
        <tr align="left" style="height:25px">
            <td style="width:"10%" ></td>
            <td style="width:"20%">Operation</td>
            <td style="width:"50%">
                <asp:RadioButton ID="optAdd"  Text="Add"  Font-Names="Verdana" Font-Size="12px"  runat="server" Checked="True" GroupName="type" AutoPostBack="True" />&nbsp;
                <asp:RadioButton ID="OptEdit" Text="Edit"  Font-Names="Verdana" Font-Size="12px" runat="server" GroupName="type" AutoPostBack="True" />
            </td>
            <td style="width:"10%" ></td>
        </tr>
        <tr align="center" style="height:25px" >
            <td></td>
            <td align="left">Supplier ID</td>
            <td align="left" >
                 <asp:DropDownList ID="drlSupplierid"  Width="100px" Height="20px" runat="server" Font-Names="Verdana" Font-Size="12px"></asp:DropDownList> &nbsp;&nbsp;
                  Type &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="Drltype" Font-Names="Verdana" Font-Size="12px" Height="20px" runat="server" width="150px" Visible="true" AutoPostBack="True"></asp:DropDownList>
                 <asp:CheckBox ID="chkenabled" Checked="true" Text="Enabled" AutoPostBack="true"  runat="server" />
            </td>
            <td ></td>
        </tr>
        <tr align="center" style="height:25px">
            <td>
            </td>
            <td align="left" style="width:85px">
                <asp:Label ID="lblname" runat="server" Width="98px"  Text="Name"   Font-Names="Verdana" Font-Size="12px" ></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtname" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px" ></asp:TextBox> <br/>
                <asp:DropDownList ID="drlname" Font-Names="Verdana" Font-Size="12px" Height="24px" runat="server" width="303px" Visible="False" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ReqvName" runat="server" ErrorMessage="Please enter the Name!" ControlToValidate="txtname" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>        
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                Short&nbsp; Name</td>
            <td align="left">
                <asp:TextBox ID="txtshortname" runat="server" Height="22px" Font-Names="Verdana" Font-Size="12px"  Width="200px" ></asp:TextBox> &nbsp;&nbsp;&nbsp; Supplier Type &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drlSupplierType"  Width="200px" Height="24px" runat="server" Font-Names="Verdana" Font-Size="12px">
                    <asp:ListItem Value="1">Goods</asp:ListItem>
                    <asp:ListItem Value="2">Expense</asp:ListItem>
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
                <asp:TextBox ID="txtcity" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
                &nbsp;&nbsp; Pin Code &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtpin" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
            </td>        
            <td > <asp:RegularExpressionValidator ID="REVPincode" runat="server" ErrorMessage="Please Enter Proper Pincode!" ControlToValidate="txtpin" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
            </td>
         </tr>
         <tr align="center" style="height:25px">
            <td >
            </td>
            <td align="left">
                Tel No</td>
            <td align="left">
                <asp:TextBox ID="txtphone1" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
                &nbsp;&nbsp; Fax &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtfax" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
            </td>        
            <td >
                <asp:RegularExpressionValidator ID="REVPhone1" runat="server" ErrorMessage="Please Enter Proper PhoneNo!" ControlToValidate="txtphone1" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="REVfax" runat="server" ErrorMessage="Please Enter Proper FaxNo!" ControlToValidate="txtfax" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
            </td>
         </tr>
         <tr align="center" style="height:25px">
            <td></td>
            <td align="left">
                Email Id</td>
            <td align="left">
                <asp:TextBox ID="txtemail" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="303px"></asp:TextBox>
            </td>    
            <td>
               <asp:RegularExpressionValidator ID="REVEmail" runat="server" ErrorMessage="Please Enter Proper EmailId!" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>    
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left">
                BST No</td>
            <td align="left">
                <asp:TextBox ID="txtBSTNo" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;CST No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtCSTNo" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>&nbsp;
            </td>        
            <td>&nbsp;</td>
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                Supplier TIN</td>
            <td align="left">
                <asp:TextBox ID="txtsupplierTin" Height="18px" runat="server" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
                &nbsp;&nbsp;
                Supplier Class &nbsp;&nbsp;
                <asp:DropDownList ID="drlsupplierclass"  Width="200px" Height="24px" runat="server" Font-Names="Verdana" Font-Size="12px" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td >&nbsp;</td>
         </tr>
         <tr align="center" style="height:25px">
            <td></td>
            <td align="left" style="width:85px">
                Credit Period</td>
            <td align="left">
                <asp:TextBox ID="txtcrperiod" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="120px"></asp:TextBox> 
                &nbsp; Days &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Op Rep Balance&nbsp; <asp:TextBox ID="txtbalance" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="200px"></asp:TextBox>
            </td>  
            <td >
                 <asp:RequiredFieldValidator ID="RFVPeriod" runat="server" ErrorMessage="Please Enter Credit Period!" ControlToValidate="txtcrperiod" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                 <asp:RangeValidator ID="Rvbalance" runat="server" ControlToValidate="txtbalance" ErrorMessage="Please Enter proper balance!" MaximumValue="999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                 <asp:RegularExpressionValidator ID="REVPeriod" runat="server" ErrorMessage="Please Enter Proper Credit Period!" ControlToValidate="txtcrperiod" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
            </td>      
         </tr>
         <tr align="center" style="height:25px">
            <td >
            </td>
            <td align="left">
                <asp:RadioButton ID="optManual" runat="server" Text="Manual" Checked="true" GroupName="a" AutoPostBack="True" /></td>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;    
                <asp:CheckBox ID="chkconsignment" runat="server" Text="On Consignment" /> 
            </td>  
            <td >&nbsp;</td>      
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                <asp:RadioButton ID="OptMarkup" runat="server" Text="Mark up" GroupName="a" AutoPostBack="True" /></td>
             <td align="left">
             <asp:Label ID="lblsalerate" runat="server" Text="Sale Rate" Visible="True"></asp:Label> &nbsp;
             <asp:TextBox ID="txtmtype" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="120px" Visible="True"></asp:TextBox> 
                &nbsp;<asp:Label ID="lblpercone" runat="server" Text="%" Visible="True"></asp:Label>
            </td>  
            <td >&nbsp;
                <asp:RangeValidator ID="RVMType" runat="server" ControlToValidate="txtmtype" ErrorMessage="Please Enter proper Sale Rate!" MaximumValue="999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
            </td>      
         </tr>
         <tr align="center" style="height:25px">
            <td ></td>
            <td align="left" >
                <asp:RadioButton ID="OptMarkDown" runat="server" Text="Mark Down" GroupName="a" AutoPostBack="True" />
            </td>
            <td align="left">
                <asp:Label ID="lblMRP" runat="server" Text="MRP" Visible="false"></asp:Label> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtmtypeMRP" runat="server" Height="18px" Font-Names="Verdana" Font-Size="12px"  Width="120px" Visible="False"></asp:TextBox> 
                &nbsp<asp:Label ID="lblperctwo" runat="server" Text="%" Visible="false"></asp:Label>
            </td>  
            <td >&nbsp;
            <asp:RangeValidator ID="RVMRP" runat="server" ControlToValidate="txtmtypeMRP" ErrorMessage="Please Enter proper MRP!" MaximumValue="999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
            </td>      
         </tr>
         <tr align="center" style="height:10px">
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

