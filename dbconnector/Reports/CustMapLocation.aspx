<%@ page title="Customer Map Location" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="CustMapLocation, App_Web_custmaplocation.aspx.dfa151d5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
      body 
      {
        margin: 0;
        padding: 10px 20px 20px;
        font-family: Arial;
        font-size: 16px;
      }

      #map-container 
      {
        padding: 6px;
        border-width: 1px;
        border-style: solid;
        border-color: #ccc #ccc #999 #ccc;
        -webkit-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        -moz-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
          width: 100%;
      }

      #map 
      {
        width: 100%;
        height: 800px;
      }

      #actions 
      {
        list-style: none;
        padding: 0;
      }

      #inline-actions 
      {
        padding-top: 10px;
      }

      .item 
      {
        margin-left: 20px;
      }
    </style>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="../App_Script/jquery-1.2.3.min.js"></script>
    <script type="text/javascript" src="../App_Script/markerclusterer_packed.js"></script>
    
    <script type="text/javascript">

        var data;
        var markerClusterer = null;
        var map = null;
        var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=FFFFFF,008CFF,000000&ext=.png';

        $(document).ready(function() {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Service/CRMMap.asmx/GetLatLong",
                data: "{}",
                dataType: "json",
                success: function(msg) {
                    var data = msg;
                    refreshMap(data);
                },
                error: function(result) {
                    alert("Error in service");
                }
            });
        });

        google.load('maps', '3', { other_params: 'sensor=false' });
        google.setOnLoadCallback(initialize);

        function refreshMap(data) {
            if (markerClusterer) {
                markerClusterer.clearMarkers();
            }
            var markers = [];

            for (var i = 0; i < data.d.length; i++) {
                imageUrl = "../Images/MAP/MV1.png"
                //'http: //www.google.com/mapfiles/markerR.png'
                //'http: //www.google.com/mapfiles/markerJ.png'
                //'http: //www.google.com/mapfiles/markerF.png'

                var markerImage = new google.maps.MarkerImage(imageUrl, new google.maps.Size(24, 32));
                var latLng = new google.maps.LatLng(data.d[i].Latitude, data.d[i].Longitude)
                var markertitle = data.d[i].CustomerName
                var markercontent = '<div>' +
                '<b>' + data.d[i].CustomerName + ' (' + data.d[i].CustID + ')</b></br>' +
               'Address : ' + data.d[i].LocationAddress + '';

                var marker = new google.maps.Marker({ position: latLng, map: map, draggable: true, icon: markerImage, title: markertitle, info: markercontent });
                var infowindow = new google.maps.InfoWindow();
                google.maps.event.addListener(marker, 'click', function() {
                    infowindow.setContent(this.info);
                    infowindow.open(map, this);
                });
                //markers.push(marker);

            }
            var zoom = null;
            var size = null;
            var style = null;

            //        markerClusterer = new MarkerClusterer(map, markers,
            //        {
            //            maxZoom: zoom,
            //            gridSize: size
            //        });
        }

        function initialize() {
            map = new google.maps.Map(document.getElementById('map'),
        {
            zoom: 5,
            center: new google.maps.LatLng(12.00, 80.00),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        }

        function clearClusters(e) {
            e.preventDefault();
            e.stopPropagation();
            markerClusterer.clearMarkers();
        }

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table  align="center" width="98%">
        <tr style="background-color:#99CCFF; height:25px;" align="left">
            <td><b>Customer Geo Location</b></td>
        </tr>
        <tr>
            <td>
                <div id="map-container">
                    <div id="map"></div>
                </div>  
            </td>
        </tr>      
    </table> 
    
</asp:Content>
