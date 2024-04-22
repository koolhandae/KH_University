<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, 1BBg3FRZBiHjilPktaL2DqvaItpNpWJuuSiQM1qI">
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
			
			
			<script>
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
			</script>
		      
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>