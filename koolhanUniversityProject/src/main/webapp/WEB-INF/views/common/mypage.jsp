<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content * {
color: rgb(100,100,100);
}
#boardList {
        width:660px;
        margin-left: 100px;
    }
th{
	width: 150px;
}
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter" style="display:flex;justify-content: space-around;">
            <div>
	        	<c:choose>
		       		<c:when test="${loginUser.meType eq 'P'}">
			            <h2>교수 정보 조회</h2>
		       		</c:when>
		       		<c:when test="${not empty loginStudent}">
			            <h2>학생 정보 조회</h2>
		       		</c:when>
		       		<c:otherwise>
			            <h2>교직원 정보 조회</h2>
		       		</c:otherwise>
	        	</c:choose>
	            <br>
					<table id="boardList" class="table">
	                <thead>
	                  <tr style="text-align: left;">
	                    <th colspan="2"><h3>회원 정보</h3></th>
	                  </tr>
	                </thead>
	                <tbody>
	                    <tr>
		                   	<th>이름</th>
		                   	<td>${loginUser.memberName}${loginStudent.studentName}</td>
	                    </tr>
	                    <tr>
		                   	<th>아이디</th>
		                   	<td>${loginUser.memberId}${loginStudent.studentId}</td>
	                    </tr>
	                    <tr>
		                   	<th>전화번호</th>
		                   	<td>${loginUser.mePhone}${loginStudent.stPhone}</td>
	                    </tr>
	                    <tr>
		                   	<th>이메일</th>
		                   	<td>${loginUser.meEmail}${loginStudent.stEmail}</td>
	                    </tr>
	                    <tr>
		                   	<th>주소</th>
		                   	<td>${loginUser.meAddress}${loginStudent.stAddress}</td>
	                    </tr>
	                </tbody>
	            </table>
            </div>
            <div style="display:flex; justify-content: center;">
            <c:choose>
            	<c:when test="${empty loginUser}">
	            	<c:choose>
						<c:when test="${empty loginStudent.changeName}">
			            	<img style="width:225px;height:200px;margin-top:90px;" alt="" src="resources/images/default_user.png">
						</c:when>
						<c:otherwise>
							<img style="width:225px;height:200px;margin-top:90px;"	src="${loginStudent.changeName}">
						</c:otherwise>
					</c:choose>
            	</c:when>
				<c:otherwise>
	            	<c:choose>
						<c:when test="${empty loginUser.changeName}">
			            	<img style="width:225px;height:200px;margin-top:90px;" alt="" src="resources/images/default_user.png">
						</c:when>
						<c:otherwise>
							<img style="width:225px;height:200px;margin-top:90px;"	src="${loginUser.changeName}">
						</c:otherwise>
					</c:choose>
				</c:otherwise>				
            </c:choose>
            </div>
            <div class="btns" align="center">
                <button id="updateInfo" type="submit" class="btn btn-primary updateInfo">정보수정</button>
            </div>
            <script>
            	$(function(){
            		let type = '${loginUser.meType}';
            		$(".updateInfo").click(function(){
            			switch(type){
            			case "" : 
            				location.href="update.stu";
            				break;
           				default: 
           					location.href="update.me";
           					break;
            			}
            		})
            	})
            </script>
        </div>
        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>