<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
	<div class="content">
      <div id="weatherDiv">
      	<input type="hidden" id="seoul" value="서울">

		<div>
			<h5>강남구</h5>
			<span>19.8도</span>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>미세먼지</td>
						<td id="mise"></td>
					</tr>
					<tr>
						<td>대기환경지수</td>
						<td id="daegi"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
      </div>
     </div>
     <!-- 
   <script>
   	$(function(){
   		let seoul = $("#seoul").val();
   		
   			
   			//json형식으로 응답받기
   			$.ajax({
   				url:"air.do",
   				data:{seoul:seoul},
   				success:function(data){
   					//console.log(data)
   					console.log(data.response.body.items)
   					const itemArr = data.response.body.items
   					
   					const filteredItems = itemArr.filter(item => item.stationName === "강남구"); //강남구인것만 뽑아오게 필터링
					let item = (filteredItems[0]);
					let mise = Number(item.khaiValue);
					let daegi = Number(item.pm10Value);

					if(mise>=0 && mise<= 30){
						$("#mise").text("좋음").css("color","#32a1ff"); 
					}else if(mise>=31 && mise<= 80){
						$("#mise").text("보통").css("color","#00c73c"); 
					}else if(mise>=81 && mise<= 150){
						$("#mise").text("나쁨").css("color","#fd9b5a"); 
					}else if(mise>=151){
						$("#mise").text("매우나쁨").css("color","#ff5959"); 
					}
					
					if(daegi>=0 && daegi<= 30){
						$("#daegi").text("좋음").css("color","#32a1ff"); 
					}else if(daegi>=31 && daegi<= 80){
						$("#daegi").text("보통").css("color","#00c73c"); 
					}else if(daegi>=81 && daegi<= 150){
						$("#daegi").text("나쁨").css("color","#fd9b5a"); 
					}else if(daegi>=151){
						$("#daegi").text("매우나쁨").css("color","#ff5959"); 
					}

				

					
   					
   					
   				},error:function(){
   					
   				}
   			})
   			

   	})
   	
   </script>
    -->

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>