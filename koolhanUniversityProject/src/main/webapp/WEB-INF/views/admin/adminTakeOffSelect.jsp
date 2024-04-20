<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 #boardList *{ 
 		vertical-align: middle;
    } 

    #boardList th{
        background-color: rgb(48, 76, 121);
        color: white;
    }

    #boardList td{
        padding-left: 20px;
    }
	
	hr{
      width: 1000px;
    }
	
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	<div class="innerOuter">
   	
   		<div class="tuitionBtn" align="center";>
   		<a class="btn btn-primary btn-lg"  href="#" roll="button" style="background-color:rgb(48, 76, 121)">휴학 신청</a>
   		   <span style="margin-left: 40px; margin-right: 40px;"></span>
   		<a class="btn btn-primary btn-lg"  href="#" roll="button" style="background-color:rgb(48, 76, 121)">복학 신청</a>  
    </div>
      <br><br><br>
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">휴학 신청 처리</h2>
   		<hr><br>
   		
   		
   		<table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
   			<thead>
	   		  <tr>
	   		  	<th>신청일자</th>
	   		  	<th>신청자 학번</th>
	   		  	<th>구분</th>
	   		  	<th>시작학기</th>
	   		  	<th>종료학기</th>
	   		  	<th>신청서 확인</th>
	   		  </tr>
	   		</thead>
	   		
	   		<tbody> 
	   		  <c:forEach var="a" items="${ list }">
		   		  <tr>
		   		  	<td>${ a.absDate }</td>
		   		  	<td>${ a.absNo }</td>
		   		  	<td>${ a.absSort }</td>
		   		  	<td>2024년도 1학기</td>
		   		  	<td>${ a.absSemester }</td>
		   		  	<td id="takeOffSelect" location href="">조회</td>
		   		  </tr>
		   		  </c:forEach>
	   		</tbody>
   		  </table>
   		  <br>
   	
   	</div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>