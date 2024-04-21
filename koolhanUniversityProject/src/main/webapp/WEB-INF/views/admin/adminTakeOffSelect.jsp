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
   		<a class="btn btn-primary btn-lg"  href="admintakeOffSelect.me" roll="button" style="background-color:rgb(48, 76, 121)">휴학 신청</a>
   		   <span style="margin-left: 40px; margin-right: 40px;"></span>
   		<a class="btn btn-primary btn-lg"  href="adminReturnSchool.me" roll="button" style="background-color:rgb(48, 76, 121)">복학 신청</a>  
    </div>
      <br><br><br>
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">휴학 신청 처리</h2>
   		<hr><br>
   		
   		<form action="admintakeOffSelectForm.me" method="post">
	   		<table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
	   			<thead align="center">
		   		  <tr>
		   		  	<th>신청일자</th>
		   		  	<th>학번</th>
		   		  	<th>구분</th>
		   		  	<th>시작학기</th>
		   		  	<th>종료학기</th>
		   		  	<th>신청상태</th>
		   		  	<th>처리</th>
		   		  </tr>
		   		</thead>
		   		
		   		<tbody align="center"> 
		   			  <c:forEach var="item" items="${list}">
			   		  <tr>
			   		  	<td>${item.absInsert}</td>
			   		  	<td>${item.absId}</td>
			   		  	<td>${item.absSort} </td>
			   		  	<td>${item.absStart}</td>
			   		  	<td>${item.absEnd}</td>
			   		  	<td>
			   		  		${item.tbStatus}
			   		  	</td>
			   		  	<td>
			   		  		<input type="hidden" name="absId" value="${item.absId}" />
			   		  		<input type="submit" value="승인" >
			   		  	</td>
			   		  </tr>
			   		 
	            	</c:forEach>
		   		</tbody>
	   		  </table>
   		  </form>
   		  <br>
   	<script>

   	</script>
   	</div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>