<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">복학 신청 처리</h2>
   		<hr><br>
   		
   	 
   		<table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
   			<thead align="center">
	   		  <tr>
	   		  	<th>신청일자</th>
	   		  	<th>학번</th>
	   		  	<th>복학연도</th>
	   		  	<th>복학학기</th>
	   		  	<th>신청상태</th>
	   		  	<th>처리</th>
	   		  </tr>
	   		</thead>
	   		
	   		<tbody align="center"> 
	   			<c:forEach var="l" items="${list}">
		   		  <tr>
		   		  	<td>
		   		  		<fmt:parseDate var="parsedDate" value="${ l.preInsert }" pattern="yyyy-MM-dd HH:mm:ss" />
					    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
		   		  	</td>
		   		  	<td>${ l.preId }</td>
		   		  	<td>${ l.preYear }년도</td>
		   		  	<td>${ l.preSemester }학기</td>
		   		  	 <td class="status ${l.preId}">
                        <c:choose>
                            <c:when test="${l.tbStatus eq 'I'}">처리중</c:when>
                            <c:when test="${l.tbStatus eq 'Y'}">승인</c:when>
                            <c:when test="${l.tbStatus eq 'N'}">반려</c:when>
                            <c:otherwise>오류</c:otherwise>
                        </c:choose>
                     </td>
	   		  		 <td>
					    <button class="btn btn-primary" name="tbStatus" value="Y" onclick="yes('${l.preId}', '${l.tbStatus}');">승인</button>
					    <button class="btn btn-danger" name="tbStatus" value="N" onclick="no('${l.preId}', '${l.tbStatus}');">반려</button>
                     </td>
		   		  </tr>
		   		</c:forEach>
	   		</tbody>
   		  </table>
   		  <br>
   	
   		<script>
   			function yes(preId, tbStatus){
   				
   				let test = $(this);
   				
   				$.ajax({
   					url:"adminReturnSchoolForm.me", 
   					data: {preId: preId,
   						   tbStatus: tbStatus},
   						   
   					success: function(list){
   						location.reload();
   						
   					}, error: function(){
   						console.log("복학 승인 ajax 실패");
   						
   					}, complete: function () {
   			            location.reload();
   			        }
   				})
   			}
   			
   			function no(preId, tbStatus){
   				
   				let test = $(this);
   				
   				$.ajax({
   					url:"adminReturnSchoolForm.me",
   					data:{ preId: preId,
   						   tbStatus: tbStatus},
   					success: function(list) {		
   						location.reload();
   						
   					}, error : function(){
   						console.log("복학 반려 ajax 실패");
   						
   					}, complet : function() {
   						location.reload();
   					}
   				})
   			}
   		</script>
   	</div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>