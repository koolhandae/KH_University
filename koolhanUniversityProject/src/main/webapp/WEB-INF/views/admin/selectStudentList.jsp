<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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