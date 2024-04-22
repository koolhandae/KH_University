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
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">복학 신청 처리</h2>
   		<hr><br>
   		
   		
   		<table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
   			<thead align="center">
	   		  <tr>
	   		  	<th>신청일자</th>
	   		  	<th>학번</th>
	   		  	<th>복학연도</th>
	   		  	<th>복학학기</th>
	   		  	<th>처리상태</th>
	   		  </tr>
	   		</thead>
	   		
	   		<tbody align="center"> 
		   		  <tr>
		   		  	<td>sysdate</td>
		   		  	<td>학번 가져오기</td>
		   		  	<td>2024년도</td>
		   		  	<td>1학기</td>
		   		  	<td>
		   		  		<Select>
		   		  			<option>승인</option>
		   		  			<option>보류</option>
		   		  			<option>불허</option>
		   		  		</Select>
		   		  		<button>확인</button>
		   		  	</td>
		   		  </tr>
	   		</tbody>
   		  </table>
   		  <br>
   	
   	</div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>