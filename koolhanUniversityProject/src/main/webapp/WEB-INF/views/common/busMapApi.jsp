<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, fRiqV0PozEcfRmcbuJ3j2gBZCUECcDV7W8NV9EZb">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnjen0pxzw"></script>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   	<div class="content">
	   <div class="innerOuter">
	   
	   <h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">지도</h2>
	   <hr>
	      
	      <div id="map" style="width:100%;height:700px;"></div>
	
	<!-- 	<script>
			var mapOptions = {
			    center: new naver.maps.LatLng(37.498993, 127.032909),
	 		    zoom: 8
			};
			
	 		var map = new naver.maps.Map('map', mapOptions);
			</script> -->
			
			
	<!--  	<script>
				$.ajax({
					url:"shuttleBus.do",
					success:function(bus){
	
						var position = new naver.maps.LatLng(36.339799, 127.434001);
	
						var map = new naver.maps.Map('map', {
						    center: position,
						    zoom: 10
						});
	
						var markerOptions = {
						    position: position,
						    map: map,
						    icon: {
						        url: 'resources/images/bus-icon.png',
						        size: new naver.maps.Size(22, 35),
						        origin: new naver.maps.Point(0, 0),
						        anchor: new naver.maps.Point(11, 35)
						    }
						};
	
						var marker = new naver.maps.Marker(markerOptions);
						});
						
					}, error:function(){
						console.log("실시간 버스 조회 ajax 실패~");
					}
					
				})
			
			</script> -->
			
			
	<!-- 		<script>
			    $.ajax({
			        url: "shuttleBus.do",
			        success: function(bus) {
			            var position = new naver.maps.LatLng(36.339799, 127.434001);
			
			            var mapOptions = {
			                center: position,
			                zoom: 17
			            };
			
			            var map = new naver.maps.Map('map', mapOptions);
			
			            var markerOptions = {
			                position: position,
			                map: map,
			                icon: {
			                    url: './resources/images/bus-icon-xs50.png',
			                    size: new naver.maps.Size(50, 50),
			                }
			            };
			
			            var marker = new naver.maps.Marker(markerOptions);
			        },
			        error: function() {
			            console.log("실시간 버스 조회 ajax 실패~");
			        }
			    });
			</script> -->
			
			
			
 <script>
    $.ajax({
        url: "shuttleBus.do",
        success: function(buses) { 
            var position1 = new naver.maps.LatLng(36.32693, 127.421985);
            var position2 = new naver.maps.LatLng(36.292885, 127.320356);
            var position3 = new naver.maps.LatLng(36.278412, 127.252039);
            var position4 = new naver.maps.LatLng(36.281756, 127.239993);
            var position5 = new naver.maps.LatLng(36.294965, 127.321379);
            var position6 = new naver.maps.LatLng(36.318054, 127.396068);
            var position7 = new naver.maps.LatLng(36.33282, 127.437719);

            var mapOptions = {
                center: position2,
                zoom: 13
            };

            var map = new naver.maps.Map('map', mapOptions);

            var markers = [];

            var markerOptions1 = {
                position: position1,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions2 = {
                position: position2,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions3 = {
                position: position3,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions4 = {
                position: position4,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions5 = {
                position: position5,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions6 = {
                position: position6,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var markerOptions7 = {
                position: position7,
                map: map,
                icon: {
                    url: './resources/images/bus-icon-xs50.png',
                    size: new naver.maps.Size(50, 50),
                }
            };

            var marker1 = new naver.maps.Marker(markerOptions1);
            var marker2 = new naver.maps.Marker(markerOptions2);
            var marker3 = new naver.maps.Marker(markerOptions3);
            var marker4 = new naver.maps.Marker(markerOptions4);
            var marker5 = new naver.maps.Marker(markerOptions5);
            var marker6 = new naver.maps.Marker(markerOptions6);
            var marker7 = new naver.maps.Marker(markerOptions7);

            markers.push(marker1);
            markers.push(marker2);
            markers.push(marker3);
            markers.push(marker4);
            markers.push(marker5);
            markers.push(marker6);
            markers.push(marker7);

            buses.forEach(function(bus) {
                var position = new naver.maps.LatLng(bus.latitude, bus.longitude);
                var markerOptions = {
                    position: position,
                    map: map,
                    icon: {
                        url: './resources/images/bus-icon-xs50.png',
                        size: new naver.maps.Size(50, 50),
                    }
                };
                var marker = new naver.maps.Marker(markerOptions);
                markers.push(marker);
            });
        },
        error: function() {
            console.log("실시간 버스 조회 ajax 실패~");
        }
    });
</script>
			
			
<!-- <script>
    // Function to update map markers with new bus data
    function updateMarkers(map, markers, busData) {
        // Remove existing markers
        markers.forEach(function(marker) {
            marker.setMap(null);
        });
        markers = [];

        // Parse XML data
        var parser = new DOMParser();
        var xmlDoc = parser.parseFromString(busData, "text/xml");

        // Get bus location nodes
        var busLocations = xmlDoc.getElementsByTagName("item");

        // Add new markers based on bus data
        for (var i = 0; i < busLocations.length; i++) {
            var latitude = parseFloat(busLocations[i].getElementsByTagName("gpsY")[0].textContent);
            var longitude = parseFloat(busLocations[i].getElementsByTagName("gpsX")[0].textContent);
            var position = new naver.maps.LatLng(latitude, longitude);

            var markerOptions = {
                position: position,
                map: map
            };
            
            var marker = new naver.maps.Marker(markerOptions);
            markers.push(marker);
        }
    }

    // Fetch real-time bus data from the server
    function fetchBusData() {
        $.ajax({
            url: "shuttleBus.do",
            dataType: "text",
            success: function(busData) {
                // Update the map with new bus data
                updateMarkers(map, markers, busData);
            },
            error: function() {
                console.log("실시간 버스 조회 ajax 실패~");
            }
        });
    }

    $(document).ready(function() {
        var mapOptions = {
            center: new naver.maps.LatLng(36.32693, 127.421985),
            zoom: 17
        };

        var map = new naver.maps.Map('map', mapOptions);
        var markers = [];

        // Initial fetch
        fetchBusData();

        // Poll for new data every 30 seconds (or adjust as needed)
        setInterval(fetchBusData, 30000);  // Every 30 seconds
    });
</script> -->
			
			
		      
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>