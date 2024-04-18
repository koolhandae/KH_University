<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#bookList {
	text-align: center;
	width: 100%;
	table-layout: fixed;
}

#bookList>tbody>tr:hover {
	cursor: pointer;
}
#bookList>tbody>tr>td {
	white-space: nowrap;  
	overflow: hidden;       
	text-overflow: ellipsis;
}
#titleLength{
	width:600px;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	Width: 20%;
}

</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
		<br>
		<br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>중앙도서관 검색</h2>
			<br>

			<form id="searchForm" action="search.lib" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="total" selected>통합</option>
                        <option value="title">제목</option>
                        <option value="author">저작자</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyWord">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
			<br>
			<br> <br></br>
			<c:if test="${not empty keyWord}">
				<div style="display: flex; align-items: baseline;">
					<h3 id="searchKey" style="color: #1c4587; font-weight: 600;">${keyWord}</h3>
					<span>의 검색 결과</span>
				</div>
			</c:if>

			<c:choose>
				<c:when test="${not empty list}">
					<table id="bookList" class="table table-hover" align="center">
						<thead>
							<tr>
								<th>카테고리</th>
								<th id="titleLength">제목</th>
								<th>저작자</th>
								<th>구역</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<br>
<script>
	$(document).ready(function(){
		const list = ${list};
		const result = list.result;
		let value = "";
		for(let i in result){
			value += "<tr>"
				  +		"<td>" + result[i].typeName + "</td>" 
				  + 	"<td>" + result[i].titleInfo + "</td>"
		    	  + 	"<td>" + result[i].authorInfo + "</td>"
		    	  + 	"<td>" + result[i].placeInfo + "</td>";
			value += "</tr>";
		}
		$("#bookList>tbody").html(value);
	})
</script>
					<div id="pagingArea">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${pi.currentPage - 1}">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${pi.currentPage - 1}">Previous</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<c:choose>
									<c:when test="${pi.currentPage eq p}">
										<li class="page-item disabled"><a class="page-link"
											href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${p}">${p}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${pi.currentPage + 1}">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="search.lib?condition=${condition}&keyWord=${keyWord}&pageNum=${pi.currentPage + 1}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div align="center">
						<h2>검색결과가 없습니다.</h2>
					</div>
				</c:otherwise>

			</c:choose>
			<br clear="both">
			<br>



		</div>
		<br>
		<br>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>