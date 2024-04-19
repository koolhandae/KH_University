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
        padding: 20px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv{
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
                    <h1 style="font-weight: 900;">강의 관리</h1>
                </div>
                <div id="liGroup">
                    <ul>
                        <li>나의 강의 목록 </li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li style="font-weight: bold;"> 강의 목록</li>
                    </ul>
                </div>

            </div>
            <!-- <hr> -->
        </div>

        <div style="padding: 15px;">

        </div>

            <script>
            	$(function(){
            		$(".updateButton").click(function(){
            			location.href = 'classDetail.co?cno=' + $(this).siblings(".cno").val();
            		})
            	})
            </script>

        <div id="contentDiv" class="bg-white">
        <input type="hidden" id="userId "value="${loginUser.memberId}">
            <div>
                <h3>강의 목록</h3>
            </div>
        

            <div class="form-group">
                <table class="table" id="classList">
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
                         <c:forEach var="c" items="${list}"> 
	                        <tr>
	                            <td>${ c.classNum }</td>
	                            <td>${c.enrollDate}</td>
	                            <td>${c.classGrade }</td>
	                            <td>${c.classSemester }</td>
	                            <td>${c.className }</td>
	                            <td>${c.classTypeName }</td>
	                            <td>
                         			<input type="hidden" class="cno" id="hiddenClassNo"name="classNo" value="${c.classNo }">
	                                <button class="btn btn-warning updateButton" >상세보기</button>
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
	                    		<li class="page-item"><a class="page-link" href="classList.bo?cpage=${ pi.currentPage - 1 }">이전</a></li>
	                    	</c:otherwise>
	                    </c:choose>	
                    
                    
                    
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> <!-- 일반for문처럼 사용가능함 -->
                    		<li class="page-item"><a class="page-link" href="classList.bo?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="page-item"><a class="page-link" href="classList.bo?cpage=${ pi.currentPage + 1 }">다음</a></li>
               				</c:otherwise>
               			</c:choose>
                </ul>
            </div>

            
        </div>

                
                <!-- 
                 Modal
                <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">  대형모달 설정 
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">강의 수정</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <form action="#" method="post" id="enrollForm">
                                <div class="form-group">
                                    
                                    <label for="lectureNo">강의번호 :</label>
                                    <input type="text" class="form-control" id="lectureNo" name="classNum" placeholder="숫자만 입력해주세요" value="${c.classNum }" required><br>
                                    
                                    <label for="lectureNm"> &nbsp;강의이름 :</label>
                                    <input type="text" class="form-control" id="lectureNm" name="className" placeholder="강의명을 입력해주세요" value="${c.className }" required><br>
                                    
                
                                    <table>
                                        <tr>
                                            <td >
                                                <label for="student_Grade"> &nbsp;대상학년 :</label>
                                                <select name="classGrade" id="student_Grade" class="form-control dropdown">
                                                    <option value="">1학년</option>
                                                    <option value="">2학년</option>
                                                    <option value="">3학년</option>
                                                    <option value="">4학년</option>
                                                </select><br> 
                                            </td> 
                                            <td >
                                                <label for="lectureSemester"> &nbsp;강의학기 :</label>
                                                <select name="classSemester" id="lectureSemester" class="form-control">
                                                    <option value="">1학기</option>
                                                    <option value="">2학기</option>
                                                    <option value="">여름계절학기</option>
                                                    <option value="">겨울계절학기</option>
                                                </select><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="lectureRoom"> &nbsp;강의실 :</label>
                                                <input type="text" class="form-control" id="classRoom" name="lectureRoom" placeholder="예) 000관 000호" value="${c.classRoom }" required><br>
                                            </td>
                
                                            <td>
                                                <label for="lectureTime"> &nbsp;강의시간 :</label>
                                                <input type="text" class="form-control" id="lectureTime" name="classTime" placeholder="예) 수 1,2,3" value="${c.classTime }" required><br>
                                            </td>
                                        </tr> 
                                    </table>
                                    
                                    
                                    <label for="lectureGrade"> &nbsp;학점 :</label>
                                    <input type="text" class="form-control" id="lectureGrade" name="classScore" maxlength="1" placeholder="예) 1" value="${c.classScore }" onchange="onlyNumber();"><br>
                                    
                                    <label for="lectureType"> &nbsp;구분 :</label><br>
                                    <select name="lectureType" id="lectureType" class="form-control">
				                        <option value="C1" >전공</option>
				                        <option value="C2" >교양</option>
				                        <option value="C3" >전공기초</option>
				                        <option value="C4" >기타</option>
                                    </select><br>
                
                                    <label for="headCount"> &nbsp;수강정원 :</label>
                                    <input type="text" class="form-control" id="headCount" name="classPeople" placeholder="숫자만 입력해주세요" maxlength="3" onchange="onlyNumber2();" required><br>
                                   
                                    <label for="etc"> &nbsp;기타사항 :</label>
                                    <input type="text" class="form-control" id="etc" name="classEtc" placeholder="기타사항을 입력해주세요" required><br>
                
                                    <label for="fileUpload"> &nbsp;강의계획서 업로드 : </label>
                                    <input type="file" id="fileUpload" name="fileUpload" accept=".pdf, .hwp, .docx, .doc"><br>
                                    <div style="font-size: 0.8em; color: rgb(248, 123, 123);" >.pdf, .hwp, .docx, .doc 파일만 첨부 가능합니다.</div>
                                    <div></div>
                                   
                
                
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer" style=" display: flex; flex-wrap: wrap; align-items: center; justify-content: center;">
                            <div class="btns" >
                                <button id="enrollBtn" type="submit" class="btn btn-primary">수정</button>
                                <button type="reset" class="btn btn-danger">취소</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                 -->


            <script>

                    function onlyNumber(){ //학점에 숫자만 입력되게 하는 거..!
                        let lectureGradeVal = $("#lectureGrade").val();
                        console.log(lectureGradeVal);
                        if(!/^[0-9]+$/.test(lectureGradeVal)){
                           let newVal = lectureGradeVal.replace(/\D/g, '');
                           $("#lectureGrade").val(newVal);
                        }
                    }
    
                    function onlyNumber2(){ //수강인원에 숫자만 입력되게
                        let headCount = $("#headCount").val();
                        if(!/^[0-9]+$/.test(headCount)){
                           let newVal = headCount.replace(/\D/g, '');
                           $("#headCount").val(newVal);
                        }
                    }
                    
                    
    
            </script>

            <script>
/*
            $(function(){
            		$.ajax({
        				url:"classList.co",
        				date:{
        					memberId:$("#userId").val()
        				},
        				success:function(list){
        					console.log("lsit" + list);
        					
        				},error:function(){
        					
        				}
        			})
            	})
            	*/
            </script>





        
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>