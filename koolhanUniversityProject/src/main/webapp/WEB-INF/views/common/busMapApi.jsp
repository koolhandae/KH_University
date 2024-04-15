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
      
      <div id="map" style="width:100%;height:700px;"></div>

		<script>
		var mapOptions = {
		    center: new naver.maps.LatLng(37.498993, 127.032909),
		    zoom: 18
		};
		
		var map = new naver.maps.Map('map', mapOptions);
		</script>
		      
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>