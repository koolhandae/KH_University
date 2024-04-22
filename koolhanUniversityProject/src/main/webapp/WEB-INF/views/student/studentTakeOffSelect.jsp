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
 
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">휴학 신청 처리</h2>
   		<hr><br>
   		
   		<form action="takeOffSelect.do">
   		<table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
   			<thead>
	   		  <tr>
	   		  	<th>신청일자</th>
	   		  	<th>구분</th>
	   		  	<th>시작학기</th>
	   		  	<th>종료학기</th>
	   		  	<th>신청서 확인</th>
	   		  	<th>상태</th>
	   		  </tr>
	   		</thead>
	   		
	   		<tbody>
		   		  <tr>
		   		  	<td>sysdate</td>
		   		  	<td>이유</td>
		   		  	<td>2024년도 1학기</td>
		   		  	<td>종료 연도, 학기</td>
		   		  	<td id="takeOffSelect">조회</td>
		   		  	<td>${ a.absStatus }</td>
		   		  </tr>
	   		</tbody>
   		  </table>
   		</form>
   		  <br>
   	</div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>