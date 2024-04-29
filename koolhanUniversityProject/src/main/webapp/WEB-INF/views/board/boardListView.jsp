<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #boardList {
        text-align: center;
    }
    
    #boardList>tbody>tr:hover {
        cursor: pointer;
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
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>커뮤니티 게시판</h2>
            <br>
            	<c:if test="${not empty loginStudent}">
           			<a class="btn btn-secondary btn-sm" style="float:right" href="enrollForm.bo">글쓰기</a>
	            </c:if>
            <br></br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="b" items="${list}">
	                    <tr>
	                        <td class="bno">${b.boardNo}</td>
	                        <td>${b.boardTitle}</td>
	                        <td>${b.boardWriter}</td>
	                        <td>${b.count}</td>
	                        <td>${b.createDate}</td>
	                    </tr>
                	</c:forEach>
                	
                </tbody>
            </table>
            <br>
            
            <script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href = 'detail.bo?bno=' + $(this).children(".bno").text();
            		})
            	})
            </script>
		
			
            <div id="pagingArea">
                <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}"><i class="fa fa-angle-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
		                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                		</c:otherwise>
                	</c:choose>
                	
	            	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	            		<c:choose>
		            		<c:when test="${pi.currentPage eq p}">
	                    		<li class="page-item disabled"><a class="page-link active" href="list.bo?cpage=${p}">${p}</a></li>
		            		</c:when>
		            		
		            		<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
		            		</c:otherwise>
	            		</c:choose>
	            	</c:forEach>
	            	
	            	<c:choose>
                		<c:when test="${pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}"><i class="fa fa-angle-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
            <br><br>
        </div>
        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>