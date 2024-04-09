<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>쿨한 커뮤니티 게시판</h2>
            <br>
	            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
<%-- 	            <c:if test="${not empty loginUser}"> --%>
           			<a class="btn btn-secondary btn-sm" style="float:right" href="enrollForm.bo">글쓰기</a>
<%-- 	            </c:if> --%>
            <br></br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                  </tr>
                </thead>
                <tbody>
                
<%--                 	<c:forEach var="b" items="${list}"> --%>
	                    <tr style="border-bottom: 1px solid #858796">
	                        <td class="bno">we${b.boardNo}</td>
	                        <td>we${b.boardTitle}</td>
	                        <td>we${b.boardWriter}</td>
	                        <td>we${b.count}</td>
	                        <td>we${b.createDate}</td>
	                        <td>
<%-- 	                        	<c:if test="${not empty b.originName}"> --%>
	                        		★
<%-- 	                        	</c:if> --%>
	                        </td>
	                    </tr>
<%--                 	</c:forEach> --%>
                	
                </tbody>
            </table>
            <br>
            
            <script>
//             	$(function(){
//             		$("#boardList>tbody>tr").click(function(){
//             			location.href = 'detail.bo?bno=' + $(this).children(".bno").text();
//             		})
//             	})
            </script>
		
			
            <div id="pagingArea">
                <ul class="pagination" style="display:flex; justify-content: center;">
<%--                 	<c:choose> --%>
<%--                 		<c:when test="${pi.currentPage eq 1 }"> --%>
		                    <li class="page-item disabled"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
<%--                 		</c:when> --%>
<%--                 		<c:otherwise> --%>
		                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
<%--                 		</c:otherwise> --%>
<%--                 	</c:choose> --%>
                	
<%-- 	            	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"> --%>
<%-- 	            		<c:choose> --%>
<%-- 		            		<c:when test="${pi.currentPage eq p}"> --%>
	                    		<li class="page-item disabled"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
<%-- 		            		</c:when> --%>
		            		
<%-- 		            		<c:otherwise> --%>
	                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
<%-- 		            		</c:otherwise> --%>
<%-- 	            		</c:choose> --%>
<%-- 	            	</c:forEach> --%>
	            	
<%-- 	            	<c:choose> --%>
<%--                 		<c:when test="${pi.currentPage eq pi.maxPage }"> --%>
	                    	<li class="page-item disabled"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
<%--                 		</c:when> --%>
<%--                 		<c:otherwise> --%>
	                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
<%--                 		</c:otherwise> --%>
<%--                 	</c:choose> --%>
                </ul>
            </div>
           
            <br clear="both"><br>
            

            <form id="searchForm" action="" method="get" align="center" style="display:flex; justify-content: center;">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>