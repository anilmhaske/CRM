<%@ page title="Customer LatLong" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="EntityLatLong, App_Web_entitylatlong.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server" >
    
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="../App_Script/jquery-1.2.3.min.js"></script>
    
    <script type="text/javascript">

        google.load('maps', '3.9', { other_params: 'sensor=false' });
        google.setOnLoadCallback(initialize);
        
        var map;
        var geocoder;
        
        function initialize() 
        {
            map = new google.maps.Map(document.getElementById('map_canvas'), 
            {
                zoom: 9,
                center: new google.maps.LatLng(18.52043, 73.856743),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            
            geocoder = new google.maps.Geocoder();
            
            google.maps.event.addListener(map, 'click', function(event) 
            {
                document.getElementById("<%=txtLatitude.ClientID %>").value = event.latLng.lat();
                document.getElementById("<%=txtLongitude.ClientID %>").value = event.latLng.lng();
            });

        }
    
              
        function showLocation() 
        {
            initialize();
            var e = document.getElementById("<%=ddlEntityName.ClientID%>");
            var address = e.options[e.selectedIndex].text;
            address = document.getElementById("<%=txtSearchString.ClientID%>").value;
            geocoder.geocode({ 'address': address }, function(results, status)
             {
                 if (status == google.maps.GeocoderStatus.OK) 
                {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker(
                    {
                        map: map,
                        position: results[0].geometry.location
                    });

                    document.getElementById("<%= txtLatitude.ClientID %>").value = results[0].geometry.location.lat();
                    document.getElementById("<%=txtLongitude.ClientID %>").value = results[0].geometry.location.lng();
                    
                } else 
                {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
   
        }
       

</script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"  >
   <br />
    <table  align="center" width="98%" >
        <tr style="background-color:#99CCFF; height:25px;" align="left">
            <td><b>Assign Latitude and Longitue </b></td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate >
                        <table width="95%">
                    <tr>
                        <td>Customer</td>
                        <td>
                            <asp:DropDownList ID="ddlEntityName" runat="server" AutoPostBack="true" Width="350px">
                            </asp:DropDownList>
                            <asp:CheckBox ID="chkEdit" runat="server" AutoPostBack="True" Text="Edit" />
                        </td>
                        <td>Lat/Lng</td>
                        <td>
                            <asp:TextBox ID="txtLatitude" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                            <asp:TextBox ID="txtLongitude" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:TextBox ID="txtSearchString" runat="server"  Width="350px"></asp:TextBox>
                            &nbsp;</td>
                        <td>
                            <input name="find" onclick="showLocation();" type="button" value="Search" /></td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="Update" />
                        </td>                       
                    </tr>
                    
                </table>
                     </ContentTemplate> 
                </asp:UpdatePanel>    
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="map_canvas"  style="width:100%; height:700px;"></div>
            </td>
        </tr>      
    </table> 

    
</asp:Content>
