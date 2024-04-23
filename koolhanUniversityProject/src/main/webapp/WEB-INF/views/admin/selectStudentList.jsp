<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.student-navigator div, .member-navigator div {
	border: 1px solid rgb(201, 201, 201);
	background-color: white;
	font-weight: 600;
	color: gray;
	text-align: center;
	vertical-align: middle;
	width: 100%;
	margin: 1px;
	line-height: 53px;
	cursor: pointer;
}
.student-navigator, .member-navigator {
	height: 55px;
	display: flex;
	margin-top: 15px;
}
</style>
</head>
<body>
	<div id="students">
		<form id="studentSearchForm" method="get" align="center">
			<div class="text">
				<input type="text" class="form-control" name="keyword"
					placeholder="검색할 학생의 이름을 입력하세요">
			</div>
			<button type="submit" class="searchBtn btn btn-secondary">검색</button>
		</form>
		<div class="student-navigator">
			<div id="notice" class="lec-nav-item"
				style="background-color: #1c4587; color: white;">공지사항</div>
			<div id="classPlan" class="lec-nav-item">강의계획서</div>
			<div id="board" class="lec-nav-item">자유게시판</div>
			<div id="project" class="lec-nav-item">과제게시판</div>
		</div>
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
			<ul
				class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
				<c:choose>
					<c:when test="${spi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link"><i
								class="fa fa-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link">&laquo;</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="sp" begin="${spi.startPage}" end="${spi.endPage}">
					<c:choose>
						<c:when test="${spi.currentPage eq sp}">
							<li class="page-item disabled"><a class="page-link active">${sp}</a></li>
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
						<li class="page-item"><a class="page-link">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>