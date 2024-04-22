<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

                <button class="btn btn-primary" onclick="submitGrade()">등록</button>
                <button class="btn btn-warning" onclick="updateGrade()">수정</button>
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

                    	<c:forEach var="g" items="${list}" varStatus="grd">
                            <tr>
                                <td>${g.studentId}</td>
                                <td>컴퓨터공학과</td>
                                <td>${g.studentName}</td>
                                <td>${g.studentHak}학년</td>

                                <input type="hidden" name="studentNo${grd.index}" id="studentNo${grd.index}" value="${g.studentNo}">
                                <input type="hidden" id="classNo${grd.index}" value="${g.classNo}">
                                
                                <td>
                                    <input type="text" id="midPoint${grd.index}" class="form-control" onchange="total(${grd.index})" name="midPoint" maxlength="2">
                                </td>
                                <td>
                                    <input type="text" id="finPoint${grd.index}" class="form-control" onchange="total(${grd.index})" name="finPoint" maxlength="2">
                                </td>
                                <td>
                                    <input type="text" id="projectPoint${grd.index}" class="form-control" onchange="total(${grd.index})" name="projectPoint" maxlength="2">
                                </td>
                                <td>
                                    <input type="text" id="attenPoint${grd.index}" class="form-control" onchange="total(${grd.index})" name="attenPoint" maxlength="2">
                                </td>
                                <td>
                                    <span id="totalPoint${grd.index}"></span>
                                </td>
                                <td><span id="grade${grd.index}"></span></td>
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
		<input type="hidden" id="classNoHidden" value="${gd.classNo }">
		<script>
		
		var grade_cnt = "${fn:length(list)}";
		console.log(grade_cnt); //list 의 길이?를 알아보자
				
				
				//총점 계산기
				function total(grd){
			

						
						
					let mid = Number($("#midPoint"+grd).val());
                    let fin = Number($("#finPoint"+grd).val());
                    let project = Number($("#projectPoint"+grd).val());
                    let atten = Number($("#attenPoint"+grd).val());
                    let totalPoint = mid+fin+project+atten;
                    console.log(totalPoint);
                    
                    $("#totalPoint"+grd).text(totalPoint);
                    
                    if (totalPoint >= 0 && totalPoint <= 59) {
                        $("#grade" + grd).text("F");
                    } else if (totalPoint >= 60 && totalPoint <= 64) {
                        $("#grade" + grd).text("D");
                    } else if (totalPoint >= 65 && totalPoint <= 69) {
                        $("#grade" + grd).text("D+");
                    } else if (totalPoint >= 70 && totalPoint <= 74) {
                        $("#grade" + grd).text("C");
                    } else if (totalPoint >= 75 && totalPoint <= 79) {
                        $("#grade" + grd).text("C+");
                    } else if (totalPoint >= 80 && totalPoint <= 84) {
                        $("#grade" + grd).text("B");
                    } else if (totalPoint >= 85 && totalPoint <= 89) {
                        $("#grade" + grd).text("B+");
                    } else if (totalPoint >= 90 && totalPoint <= 94) {
                        $("#grade" + grd).text("A");
                    } else if (totalPoint >= 95 && totalPoint <= 100) {
                        $("#grade" + grd).text("A+");
                    }
					
                    
				}

            	
            	function submitGrade() {
            	    var gradesData = [];
            	    
            	    // 각 학생의 성적 데이터를 수집하여 배열에 저장
            	    for (let i = 0; i < grade_cnt; i++) {
            	        let studentNo = $("#studentNo"+i).val();
            	        let classNo = $("#classNo"+i).val();
            	        let midPoint = $("#midPoint"+i).val();
                        let finPoint =$("#finPoint"+i).val();
                        let projectPoint = $("#projectPoint"+i).val();
                        let attenPoint = $("#attenPoint"+i).val();
                        let grade = $("#grade"+i).text();
                        let totalPoint = $("#totalPoint"+i).text()
            	        
            	        // 학생의 성적 데이터를 객체로 구성하여 배열에 추가
            	        var studentGrade = {
            	            studentNo: studentNo,
            	            classNo: classNo,
            	            midPoint: midPoint,
            	            finPoint: finPoint,
            	            projectPoint: projectPoint,
            	            attenPoint: attenPoint,
            	            grade: grade,
            	            totalPoint: totalPoint
            	        };
            	        
            	        gradesData.push(studentGrade);
            	        
            	    }
            	    console.log(gradesData);
					
            	    
            	    $.ajax({
            	        url: "inputGradeAjax.do", // Ajax 요청을 보낼 URL
            	        type: "POST", // POST 방식으로 요청
            	        contentType: "application/json", // 전송할 데이터의 타입 설정
            	        data: JSON.stringify(gradesData), // 전송할 데이터(JSON 문자열)
            	        success: function(result) {
            	            // 성공적으로 처리된 경우 실행할 코드
            	            console.log("성적이 성공적으로 등록되었습니다.");
            	            Swal.fire({
		    		    		icon: "success",
		    		    		title: "등록 완료!",
		    		    		text: "성적 등록이 완료되었습니다",
		    		    	});
            	            
            	           
                            
            	        },
            	        error: function() {
            	            // 오류가 발생한 경우 실행할 코드
            	            console.error("성적 등록 중 오류가 발생했습니다:");
            	            // 오류 처리 후 추가 작업 수행 가능
            	        }
            	    });
            	    
            	    
			
		        }
            	
            	function updateGrade(){
					var gradesData = [];
            	    
            	    // 각 학생의 성적 데이터를 수집하여 배열에 저장
            	    for (let i = 0; i < grade_cnt; i++) {
            	        let studentNo = $("#studentNo"+i).val();
            	        let classNo = $("#classNo"+i).val();
            	        let midPoint = $("#midPoint"+i).val();
                        let finPoint =$("#finPoint"+i).val();
                        let projectPoint = $("#projectPoint"+i).val();
                        let attenPoint = $("#attenPoint"+i).val();
                        let grade = $("#grade"+i).text();
                        let totalPoint = $("#totalPoint"+i).text()
            	        
            	        // 학생의 성적 데이터를 객체로 구성하여 배열에 추가
            	        var studentGrade = {
            	            studentNo: studentNo,
            	            classNo: classNo,
            	            midPoint: midPoint,
            	            finPoint: finPoint,
            	            projectPoint: projectPoint,
            	            attenPoint: attenPoint,
            	            grade: grade,
            	            totalPoint: totalPoint
            	        };
            	        
            	        gradesData.push(studentGrade);
            	        
            	    }
            	    console.log(gradesData);
					
            	    
            	    $.ajax({
            	        url: "updateGradeAjax.do", // Ajax 요청을 보낼 URL
            	        type: "POST", // POST 방식으로 요청
            	        contentType: "application/json", // 전송할 데이터의 타입 설정
            	        data: JSON.stringify(gradesData), // 전송할 데이터(JSON 문자열)
            	        success: function(result) {
            	            // 성공적으로 처리된 경우 실행할 코드
            	            console.log("성적이 성공적으로 수정되었습니다.");
            	            Swal.fire({
		    		    		icon: "success",
		    		    		title: "수정 완료!",
		    		    		text: "성적 수정이 완료되었습니다",
		    		    	});
            	            
            	           
                            
            	        },
            	        error: function() {
            	            // 오류가 발생한 경우 실행할 코드
            	            console.error("성적 수정 중 오류가 발생했습니다:");
            	            // 오류 처리 후 추가 작업 수행 가능
            	        }
            	    });
            	}
		</script>
		
		
		<script>
			$(function(grd){
				
				
				$.ajax({
		            url:"selectGradeAjax.do",
		            data:{classNo:$("#classNoHidden").val()},
		            success:function(list){
						console.log(list)
						for(let i = 0; i<grade_cnt; i++){
            	        $("#midPoint"+i).val(list[i].midPoint);
                        $("#finPoint"+i).val(list[i].finPoint);
                        $("#projectPoint"+i).val(list[i].projectPoint);
                        $("#attenPoint"+i).val(list[i].attenPoint);
                        $("#grade"+i).text(list[i].grade);
                        $("#totalPoint"+i).text(list[i].totalPoint)

                        }
						
		            },error:function(){
		
		            }
		
		        });
				
			})
		</script>
    </div>
    <jsp:include page="../common/footer.jsp"/>    
</body>
</html>