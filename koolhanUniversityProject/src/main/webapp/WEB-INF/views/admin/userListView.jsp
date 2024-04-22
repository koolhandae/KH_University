<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#studentList, #memberList {
	text-align: center;
	width: 500px;
}

#studentList>tbody>tr:hover, #memberList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#studentSearchForm, #memberSearchForm {
	width: 90%;
	margin: auto;
	display: flex;
}

#studentSearchForm>*, #memberSearchForm>* {
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 70%;
}

.searchBtn {
	Width: 20%;
}

#studentPaging li:hover, #memberPaging li:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
		<br>
		<br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>전체 회원 조회</h2>
			<br> <br>
			<div id="userOuter"
				style="display: flex; justify-content: space-between;">
				<div id="students">
					<form id="studentSearchForm" method="get" align="center">
						<div class="text">
							<input type="text" class="form-control" name="keyword"
								placeholder="검색할 학생의 이름을 입력하세요">
						</div>
						<button type="submit" class="searchBtn btn btn-secondary">검색</button>
					</form>
					<table id="studentList" class="table table-hover" align="center">
						<thead>
							<tr>
								<th>이름</th>
								<th>ID</th>
								<th>연락처</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="s" items="${sList}">
								<tr>
									<td>${s.studentName}</td>
									<td>${s.studentId}</td>
									<td>${s.stPhone}</td>
									<td>${s.stStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>

					<div id="pagingArea">
						<ul id="studentPaging"
							class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
							<c:choose>
								<c:when test="${spi.currentPage eq 1 }">
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										onclick="loadStudentPage('${spi.currentPage - 1}')">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="sp" begin="${spi.startPage}" end="${spi.endPage}">
								<c:choose>
									<c:when test="${spi.currentPage eq sp}">
										<li class="page-item disabled"><a
											class="page-link active">${sp}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link"
											onclick="loadStudentPage('${sp}');">${sp}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${spi.currentPage eq spi.maxPage }">
									<li class="page-item disabled"><a class="page-link"><i
											class="fa fa-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										onclick="loadStudentPage('${spi.currentPage + 1}')">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

				<div id="members">
					<form id="memberSearchForm" action="" style="display: flex;">
						<div class="text">
							<input type="text" class="form-control" name="keyword"
								placeholder="검색할 교직원의 이름을 입력하세요.">
						</div>
						<button type="submit" class="searchBtn btn btn-secondary">검색</button>
					</form>
					<table id="memberList" class="table table-hover" align="center">
						<thead>
							<tr>
								<th>이름</th>
								<th>ID</th>
								<th>연락처</th>
								<th>직무</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${mList}">
								<tr>
									<td>${m.memberName}</td>
									<td>${m.memberId}</td>
									<td>${m.mePhone}</td>
									<td>${m.meType}</td>
									<td>${m.meStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>

					<div id="pagingAreaMe">
						<ul id="memberPaging"
							class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
							<c:choose>
								<c:when test="${mpi.currentPage eq 1 }">
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" onclick="loadMemberPage('${mpi.currentPage + 1}')">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="mp" begin="${mpi.startPage}" end="${mpi.endPage}">
								<c:choose>
									<c:when test="${mpi.currentPage eq mp}">
										<li class="page-item disabled"><a
											class="page-link active">${mp}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link" onclick="loadMemberPage('${mp}');">${mp}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${mpi.currentPage eq mpi.maxPage }">
									<li class="page-item disabled"><a class="page-link"><i
											class="fa fa-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" onclick="loadMemberPage('${mpi.currentPage + 1}')">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<br clear="both">
			<br>
		</div>
	</div>

	<script>
   		function loadStudentPage(cpage){
   			$.ajax({
   				url:"userList.stu",
   				data:{
   					cpage: cpage,
   				},
   				success:function(response){
   				 	let studentTableValue = "";
   				 	for(let s of response.sList){
   				 		studentTableValue += "<tr>"
   			                  +  "<td>" + s.studentName + "</td>"
   			                  +  "<td>" + s.studentId + "</td>"
   			                  +  "<td>" + s.stPhone + "</td>"
   			                  +  "<td>" + s.stStatus + "</td>"
   			                  +  "</tr>";
   				 	}
   				 	$("#studentList tbody").html(studentTableValue);
   				 	
   				 	let studentPagination = "";
    	            let pageSize = 3;
    	            let totalPage = response.spi.maxPage;
    	            let currentGroup = Math.floor((response.spi.currentPage - 1) / pageSize);
    	            let groupStart = currentGroup * pageSize + 1;
    	            let groupEnd = Math.min(groupStart + pageSize - 1, totalPage);

    	            if (groupStart > 1) {
    	            	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (groupStart - 1) + ')">&laquo;</a></li>';
    	            }

    	            for (let i = groupStart; i <= groupEnd; i++) {
    	                if (i === response.spi.currentPage) {
    	                	studentPagination += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
    	                } else {
    	                	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + i + ')">' + i + '</a></li>';
    	                }
    	            }

    	            if (groupEnd < totalPage) {
    	            	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (groupEnd + 1) + ')">&raquo;</a></li>';
    	            }

    	            $("#studentPaging").html(studentPagination);
   				 	
   				 	
//    				 	let studentPagination = "";
   				 	
// 	   				if (response.spi.currentPage > 1) {
// 	   					studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (response.spi.currentPage - 1) + ')">&laquo;</a></li>';
// 	   				} else {
// 	   					studentPagination += '<li class="page-item disabled"><a class="page-link">&laquo;</a></li>';
// 	   				}
   				 	
// 	   				for (let i = 1; i <= response.spi.maxPage; i++) {
// 	   				    if (i === response.spi.currentPage) {
// 	   				    	studentPagination += '<li class="page-item disable"><a class="page-link active" >' + i + '</a></li>';
// 	   				    } else {
// 	   				    	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + i + ')">' + i + '</a></li>';
// 	   				    }
// 	   				}
   				 	
// 	   				if (response.spi.currentPage < response.spi.maxPage) {
// 	   					studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (response.spi.currentPage + 1) + ')">&raquo;</a></li>';
// 	   				} else {
// 	   					studentPagination += '<li class="page-item disabled"><a class="page-link">&raquo;</a></li>';
// 	   				}
// 	   				$("#studentPaging").html(studentPagination);
   				},
   				error:function(){
   					console.log("ajax tongsinsilpae")
   				},
   			})
   		}
   		
   		function loadMemberPage(cpage){
   			$.ajax({
   				url:"userList.me",
   				data:{
   					cpage: cpage,
   				},
   				success:function(response){
   				 	let memberTableValue = "";
   				 	for(let m of response.mList){
   				 		memberTableValue += "<tr>"
   			                  +  "<td>" + m.memberName + "</td>"
   			                  +  "<td>" + m.memberId + "</td>"
   			                  +  "<td>" + m.mePhone + "</td>"
   			                  +  "<td>" + m.meStatus + "</td>"
   			                  +  "<td>" + m.meType + "</td>"
   			                  +  "</tr>";
   				 	}
   				 	$("#memberList tbody").html(memberTableValue);
   				 	
   				let memberPagination = "";
   	            let pageSize = 3;
   	            let totalPage = response.mpi.maxPage;
   	            let currentGroup = Math.floor((response.mpi.currentPage - 1) / pageSize);
   	            let groupStart = currentGroup * pageSize + 1;
   	            let groupEnd = Math.min(groupStart + pageSize - 1, totalPage);

   	            if (groupStart > 1) {
   	                memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (groupStart - 1) + ')">&laquo;</a></li>';
   	            }

   	            for (let i = groupStart; i <= groupEnd; i++) {
   	                if (i === response.mpi.currentPage) {
   	                    memberPagination += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
   	                } else {
   	                    memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + i + ')">' + i + '</a></li>';
   	                }
   	            }

   	            if (groupEnd < totalPage) {
   	                memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (groupEnd + 1) + ')">&raquo;</a></li>';
   	            }

   	            $("#memberPaging").html(memberPagination);
   				 	
   				 	
   				 	
//    				 	let memberPagination = "";
   				 	
// 	   				if (response.mpi.currentPage > 1) {
// 	   					memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (response.mpi.currentPage - 1) + ')">&laquo;</a></li>';
// 	   				} else {
// 	   					memberPagination += '<li class="page-item disabled"><a class="page-link">&laquo;</a></li>';
// 	   				}
   				 	
// 	   				for (let i = 1; i <= response.mpi.maxPage; i++) {
// 	   				    if (i === response.mpi.currentPage) {
// 	   				    	memberPagination += '<li class="page-item disable"><a class="page-link active" >' + i + '</a></li>';
// 	   				    } else {
// 	   				    	memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + i + ')">' + i + '</a></li>';
// 	   				    }
// 	   				}
   				 	
// 	   				if (response.mpi.currentPage < response.mpi.maxPage) {
// 	   					memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (response.mpi.currentPage + 1) + ')">&raquo;</a></li>';
// 	   				} else {
// 	   					memberPagination += '<li class="page-item disabled"><a class="page-link">&raquo;</a></li>';
// 	   				}
// 	   				$("#memberPaging").html(memberPagination);
   				},
   				error:function(){
   					console.log("ajax tongsinsilpae")
   				},
   			})
   		}
   </script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>