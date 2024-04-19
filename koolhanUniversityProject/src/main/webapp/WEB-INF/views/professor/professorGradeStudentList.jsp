<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        /* padding-top: 50px; */
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
    .btns{
        padding-bottom: 20px;
    }
    .pagination{
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
                    <li>강의 목록</li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li> 성적 등록</li>
                </ul>
            </div>
            

        </div>

        <div style="padding: 15px;">

        </div>

        <div id="contentDiv" class="bg-white">
            <div>

                <h3>수강생 리스트 | <span>강의명 : ${gd.className }</span></h3>

            </div>
            <div style="float: right; padding-right: 100px; padding-bottom: 10px;">
                <button class="btn btn-primary">등록</button>
                <button class="btn btn-danger">취소</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='professorGDEnroll.do'">목록가기</button>
            </div>
        

            <div class="form-group">
                <table class="table" >
                    <thead>
                        <tr>
                            <th>학번</th>
                            <th>학과</th>
                            <th>이름</th>
                            <th>학년</th>
                            <th>중간</th>
                            <th>기말</th>
                            <th>과제</th>
                            <th>출석</th>
                            <th>총점</th>
                            <th>학점</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<c:forEach var="g" items="${list }">
	                        <tr>
	                            <td>${ g.studentId }</td>
	                            <td>컴퓨터공학과</td>
	                            <td>${ g.studentName }</td>
	                            <td>${ g.studentHak }학년</td>
	                            <input type="hidden" value="${g.studentNo }">
	                            <td>
	                                <input type="text" class="form-control gradeInput${ g.studentNo }" maxlength="2">
	                            </td>
	                            <td>
	                                <input type="text" class="form-control gradeInput${ g.studentNo }" maxlength="2">
	                            </td>
	                            <td>
	                                <input type="text" class="form-control gradeInput${ g.studentNo }" maxlength="2">
	                            </td>
	                            <td>
	                                <input type="text" class="form-control gradeInput${ g.studentNo }" maxlength="2">
	                            </td>
	                            <td>
	                                <span class="studentNo" value="${g.studentNo }"></span>
	                            </td>
	                            <td><span>A+</span></td>
	                        </tr>
                        </c:forEach>
                    </tbody>


                </table>
            </div>
                    <div class="btns" align="center">
			<div id="pagingArea">
                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
	                    							<!-- disabled 이전버튼 비활성화 -->
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="professorGradeStuList.co?gno=${ gd.classNo }&cpage=${ pi.currentPage - 1 }">이전</a></li>
	                    	</c:otherwise>
	                    </c:choose>	
                    
                    
                    
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> <!-- 일반for문처럼 사용가능함 -->
                    		<li class="page-item"><a class="page-link" href="professorGradeStuList.co?gno=${ gd.classNo }&cpage=${p}">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="page-item"><a class="page-link" href="professorGradeStuList.co?gno=${ gd.classNo }&cpage=${ pi.currentPage + 1 }">다음</a></li>
               				</c:otherwise>
               			</c:choose>
                </ul>
            </div>
         </div>
            <br>
        </div>

    </div>
    <jsp:include page="../common/footer.jsp"/>    
</body>
</html>