<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pagination {
	justify-content: center;
}

.pagination.pagination-rounded-flat .page-item .page-link, a {
	border: none;
	border-radius: 50px;
}

.page-link:active {
	background-color: #1c4587 !important;
	color: white !important;
}
.active{
	background-color: #1c4587 !important;
	color: white !important;
}
li{
	margin:3px
}
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">

		<div id="pagingArea">
			<ul
				class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#?cpage=${pi.currentPage - 1}"><i
								class="fa fa-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="#?cpage=${pi.currentPage - 1}">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${pi.currentPage eq p}">
							<li class="page-item disabled"><a class="page-link active"
								href="#?cpage=${p}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="#?cpage=${p}">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#?cpage=${pi.currentPage + 1}"><i
								class="fa fa-angle-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="#?cpage=${pi.currentPage + 1}">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>






	</div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>