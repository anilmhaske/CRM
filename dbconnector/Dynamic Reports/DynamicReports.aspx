<%@ page title="" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Dynamic_Reports_DynamicReports, App_Web_dynamicreports.aspx.e0bb34ec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table >
       <tr>
           <td>
                <telerik:RadMenu ID="mnuMain" Runat="server" Skin="Web20" style="top:0px;left:0px;" NavigateUrl="~/Dynamic Reports/ReportViewer.aspx" > 
                </telerik:RadMenu>
           </td>
       </tr>
   </table>
   
</asp:Content>
           


