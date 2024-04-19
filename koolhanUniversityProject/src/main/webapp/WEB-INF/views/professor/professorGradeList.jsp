<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        h1{
        margin: 0 !important;
        color: rgb(32, 56, 100);
        /* padding: 20px; */
    }
    h3{
        padding: 50px 50px 0 100px;
        margin: 0 !important;
    }
    #topdiv{
        margin-top: 50px;
        margin-left: 100px;
        margin-right: 100px;  
        padding: 20px 20px 20px 50px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
        padding: 0;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv, #footerDiv, #footerH3{
        margin-left: 100px;
        margin-right: 100px;  
    }
    #h1Div{
        float: left;
    }
    #liGroup{
        float: right;
        line-height: 50px;
    }
    .form-group{
        padding-top: 50px;
        padding-right: 100px;
        padding-bottom: 30px;
        padding-left: 100px
    }
    th,td {
        text-align: center !important;
        width: 275px;
    }
    thead *{
        background-color: #1c4587;
        color: white;
    }
    .pagination {
    display: flex;
    padding-left: 0;
    list-style: none;
    border-radius: 0.35rem;
    justify-content: center;
	}


</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">성적 등록</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li> 강의목록 </li>
                </ul>
            </div>

        </div>

        <div style="padding: 15px;">

        </div>
        <script>
            	$(function(){
            		$(".stuList").click(function(){
            			location.href = 'professorGradeStuList.co?gno=' + $(this).siblings(".gno").val();
            		})
            	})
            </script>


        <div id="contentDiv" class="bg-white">
            <div>
                <h3>내 강의 목록</h3>
            </div>
        

            <div class="form-group">
                <table class="table" >
                    <thead>
                        <tr>
                            <th>강의번호</th>
                            <th>년도</th>
                            <th>학년</th>
                            <th>학기</th>
                            <th>강의명</th>
                            <th>구분</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<c:forEach var="c" items="${list }">
	                        <tr>
	                            <td>${ c.classNum }</td>
	                            <td>${c.enrollDate}</td>
	                            <td>${c.classGrade }</td>
	                            <td>${c.classSemester }</td>
	                            <td>${c.className }</td>
	                            <td>${c.classTypeName }</td>
	                            <td>
	                            	<input type="hidden" class="gno" id="hiddenClassNo"name="classNo" value="${c.classNo }">
	                                <button class="btn btn-outline-primary stuList" data-toggle="modal" data-target="#staticBackdrop">수강생조회</button>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>


                </table>
            </div>
            
            <div id="pagingArea">
                <ul class="pagination">
                	
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
	                    							<!-- disabled 이전버튼 비활성화 -->
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="professorGDEnroll.do?cpage=${ pi.currentPage - 1 }">이전</a></li>
	                    	</c:otherwise>
	                    </c:choose>	
                    
                    
                    
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> <!-- 일반for문처럼 사용가능함 -->
                    		<li class="page-item"><a class="page-link" href="professorGDEnroll.do?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="page-item"><a class="page-link" href="professorGDEnroll.do?cpage=${ pi.currentPage + 1 }">다음</a></li>
               				</c:otherwise>
               			</c:choose>
                </ul>
            </div>
            <br>
        </div>



        
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>