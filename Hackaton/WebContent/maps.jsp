<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Map</title>
<script type="text/javascript" src="skytrain.js"></script>
<script type="text/javascript" src="border.js"></script>
<script type="text/javascript" src="medical.js"></script>
<script type="text/javascript" src="amenities.js"></script>
<script type="text/javascript" src="neighbourhood.js"></script>
<link rel="stylesheet" type="text/css" href="./style.css" />
    </head>
    <body style="background-color:#FFFDD0">
    <div class = "top-left">
    <img src="img/logo.png" alt="logo" style="width:300px;height:150px;">
    </div>
    <br><br><br><br><br><br><br>
    <div class = "text-c">
    <form method="get" action="maps.jsp">
    Choose a neighborhood you want to view
    <select name="nb" id="nb">
      <option value="All">All</option>
      <option value="Marpole">Marpole</option>
      <option value="Fairview">Fairview</option>
      <option value="Central Business District">Central Business District</option>
      <option value="Mount Pleasant">Mount Pleasant</option>
      <option value="Grandview-Woodland">Grandview-Woodland</option>
      <option value="Hastings-Sunrise">Hastings-Sunrise</option>
      <option value="West End">West End</option>
      <option value="Renfrew-Collingwood">Renfrew-Collingwood</option>
      <option value="Victoria-Fraserview">Victoria-Fraserview</option>
      <option value="Strathcona">Strathcona</option>
      <option value="South Cambie">South Cambie</option>
      <option value="Oakridge">Oakridge</option>
      <option value="West Point Grey">West Point Grey</option>
      <option value="Dunbar-Southlands">Dunbar-Southlands</option>
      <option value="Kensington-Cedar Cottage">Kensington-Cedar Cottage</option>
      <option value="Killarney">Killarney</option>
      <option value="Arbutus Ridge">Arbutus Ridge</option>
      <option value="Kerrisdale">Kerrisdale</option>
      <option value="Riley Park">Riley Park</option>
      <option value="Shaughnessy">Shaughnessy</option>
      <option value="Musqueam">Musqueam</option>
      <option value="Stanley Park">Stanley Park</option>
      <option value="Kitsilano">Kitsilano</option>
      <option value="Sunset">Sunset</option>
      <option value="Dunbar-Southlands">Dunbar-Southlands</option>
    </select>
    <input type="submit" value="Submit">
    </form>
    </div>
<%
String nb = request.getParameter("nb");
if(nb == null) {
	nb = "All";
}
double lat=0, lng=0;
int zoom = 0;
if(nb.equals("All")) {
  lat = 49.249015;
  lng = -123.100414;
  zoom = 12;
}else if(nb.equals("Marpole")){
  lat = 49.211936;
  lng = -123.129504;
  zoom = 15;
}else if(nb.equals("Fairview")){
  lat = 49.263845;
  lng = -123.130699;
  zoom = 15;
}else if(nb.equals("Central Business District")){
  lat = 49.279644;
  lng = -123.114690;
  zoom = 15;
}else if(nb.equals("Mount Pleasant")){
  lat = 49.264944;
  lng = -123.103347;
  zoom = 15;
}else if(nb.equals("Grandview-Woodland")){
  lat = 49.275873;
  lng = -123.067594;
  zoom = 15;
}else if(nb.equals("Hastings-Sunrise")){
  lat = 49.277459;
  lng = -123.041682;
  zoom = 15;
}else if(nb.equals("West End")){
  lat = 49.286063;
  lng = -123.134922;
  zoom = 15;
}else if(nb.equals("Renfrew-Collingwood")){
  lat = 49.248525;
  lng = -123.041529;
  zoom = 15;
}else if(nb.equals("Victoria-Fraserview")){
  lat = 49.219418;
  lng = -123.064564;
  zoom = 15;
}else if(nb.equals("Strathcona")){
  lat = 49.273358;
  lng = -123.090483;
  zoom = 15;
}else if(nb.equals("South Cambie")){
  lat = 49.243187;
  lng = -123.122597;
  zoom = 15;
}else if(nb.equals("Oakridge")){
  lat = 49.226027;
  lng = -123.124433;
  zoom = 15;
}else if(nb.equals("West Point Grey")){
  lat = 49.268632;
  lng = -123.204532;
  zoom = 15;
}else if(nb.equals("Dunbar-Southlands")){
  lat = 49.249499;
  lng = -123.184513;
  zoom = 15;
}else if(nb.equals("Kensington-Cedar Cottage")){
  lat = 49.254572;
  lng = -123.072132;
  zoom = 15;
}else if(nb.equals("Kitsilano")){
  lat = 49.266367;
  lng = -123.166484;
  zoom = 15;
}else if(nb.equals("Sunset")){
  lat = 49.220076;
  lng = -123.090892;
  zoom = 15;
}else if(nb.equals("Killarney")){
  lat = 49.221969;
  lng = -123.038230;
  zoom = 15;
}else if(nb.equals("Arbutus Ridge")){
  lat = 49.253364;
  lng = -123.160476;
  zoom = 15;
}else if(nb.equals("Kerrisdale")){
  lat = 49.233541;
  lng = -123.153873;
  zoom = 15;
}else if(nb.equals("Riley Park")){
  lat = 49.247016;
  lng = -123.102610;
  zoom = 15;
}else if(nb.equals("Shaughnessy")){
  lat = 49.244165;
  lng = -123.141308;
  zoom = 15;
}else if(nb.equals("Musqueam")){
  lat = 49.230445;
  lng = -123.202483;
  zoom = 15;
}else if(nb.equals("Stanley Park")){
  lat = 49.303097;
  lng = -123.146416;
  zoom = 15;
}
%>
  <br>
      <div id="map"></div>
      <script>
        function initMap(){
          var options = {
            zoom:<%=zoom%>,
            center:{lat:<%=lat%>,lng:<%=lng%>},
            mapId: "4504f8b37365c3d0"
          }
          var map = new google.maps.Map(document.getElementById('map'), options);

          var col = "";
          //loop through markers
          for(var i = 0; i < markers.length;i++){
            addNeighbourhoodMarker(markers[i]);
          }

          for(var i = 0; i < neighborhood.length;i++){
            if(neighborhood[i].content>20 && neighborhood[i].content<=40){
              col = '#0000FF';
            }else if(neighborhood[i].content>40 && neighborhood[i].content<+50){
              col = '#00FF00';
            }else if(neighborhood[i].content>50 && neighborhood[i].content<=70){
              col = '#FFFF00';
            }else if(neighborhood[i].content>70 && neighborhood[i].content<=100){
              col = '#FFA500';
            }else if(neighborhood[i].content>100){
              col = '#FF0000';
            }
            addShape(neighborhood[i], col);
          }

            function addShape(props, col){
                var Polygon = new google.maps.Polygon({
                  paths: props.coords,
                  strokeColor: col,
                  strokeOpacity: 0.6,
                  fillColor: col,
                  fillOpacity: 0.35
                });
                Polygon.setMap(map)
            }

          function addNeighbourhoodMarker(props){
            const neighName = document.createElement("div");
            neighName.className = "neighbourhood-tag";
            neighName.textContent = markers[i].name;
            var markerView = new google.maps.marker.AdvancedMarkerView({
              position: props.coords,
              map:map,
              content: neighName
              });

            if(props.content){
              var infoWindow = new google.maps.InfoWindow({
                content: "Crime Rate: "+props.content.toString()
              });

              markerView.addListener('click', function(){
                infoWindow.open(map, markerView);
              });
            }
          }

          for(var i = 0; i < stations.length;i++){
            addSkytrainMarker(stations[i]);
          }

          function addSkytrainMarker(props){
            const latlang = {lat:props.Latitude, lng:props.Longitude}
            var marker = new google.maps.Marker({
              position: latlang,
              map:map,
              icon: {
                url: "img/iconST.png",
                scaledSize: new google.maps.Size(25, 25),
                anchor: new google.maps.Point(5, 5)
                }
              });

            if(props.Line){
              var infoWindow = new google.maps.InfoWindow({
                content: props.Station+"<br>"+props.Line
              });

              marker.addListener('click', function(){
                infoWindow.open(map, marker);
              });
            }
          }

          for(var i = 0; i < medical.length;i++){
            addMedicalMarker(medical[i]);
          }

          function addMedicalMarker(props){
            var type = "";
            if(props.Type == "Hospital"){
                  type= "img/iconHT.png"
            }else if(props.Type == "Pharmacies"){
                  type= "img/iconPM.png"
            }else{
                  type= "img/iconCN.png"
            }
            const latlang = {lat:props.Latitude, lng:props.Longitude}
            var marker = new google.maps.Marker({
              position: latlang,
              map:map,
              icon: {
                  url: type,
                scaledSize: new google.maps.Size(25, 25),
                anchor: new google.maps.Point(5, 5)
                }
              });

            if(props.Name){
              var infoWindow = new google.maps.InfoWindow({
                content: props.Name
              });

              marker.addListener('click', function(){
                infoWindow.open(map, marker);
              });
            }
          }

          for(var i = 0; i < amenities.length;i++){
            addAmenitiesMarker(amenities[i]);
          }

          function addAmenitiesMarker(props){
            var type = "";
            if(props.Type == "Attractions"){
                  type= "img/iconAT.png"
            }else{
                  type= "img/iconSD.png"
            }
            const latlang = {lat:props.Latitude, lng:props.Longitude}
            var marker = new google.maps.Marker({
              position: latlang,
              map:map,
              icon: {
                  url: type,
                scaledSize: new google.maps.Size(25, 25),
                anchor: new google.maps.Point(5, 5)
                }
              });

            if(props.Name){
              var infoWindow = new google.maps.InfoWindow({
                content: props.Name
              });

              marker.addListener('click', function(){
                infoWindow.open(map, marker);
              });
            }
          }
        }
        

    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhSzcSSQmx3DXacXsHWjcTV71NBT6Xy7M&callback=initMap&libraries=marker&v=beta">
    </script>
    
    <br>
    <div class = "center-right">
      <img src="img/barometer.png" alt="bar" style="width:200px;height:80px;"><br>
      <img src="img/Skytrain.png" alt="Skytrain" style="width:150px;height:40px;"><br>
      <img src="img/Clinic.png" alt="Clinic" style="width:150px;height:40px;"><br>
      <img src="img/Pharmacy.png" alt="Pharmacy" style="width:150px;height:40px;"><br>
      <img src="img/Hospital.png" alt="Hostipal" style="width:150px;height:40px;"><br>
      <img src="img/Attraction.png" alt="Attraction" style="width:150px;height:40px;"><br>
      <img src="img/Shopping_District.png" alt="Shopping District" style="width:150px;height:40px;">
    </div>
</body>
</html>