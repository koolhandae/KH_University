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
        padding: 50px 50px 0 50px;
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
        padding-right: 200px;
        padding-bottom: 100px;
        padding-left: 200px
    }
    .btns{
        padding-bottom: 50px;
    }
    th,td{
    	width:200px;
    	height : 60px;
    	line-height: 30px;
        border-color:white;
    }
    th{
        background-color: #1c4587;
        color: white;
       text-align: center !important;
    }
    table *{
        border-color:none;
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	
       
    
    	<div id="topdiv"class="bg-white">

                <div id="h1Div">
                <h1 style="font-weight: 900;">강의 상세보기</h1>
                </div>
                <div id="liGroup">
                    <ul>
                        <li>나의 강의실 </li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li style="font-weight: bold;"> 상세보기</li>
                    </ul>
                </div>

            <div></div>
			<!-- <hr> -->
        </div>

        <div style="padding: 15px;">

        </div>


        
        <div id="contentDiv" class="bg-white">
        <div>
            <h3>강의 상세보기</h3>

                <div class="form-group">
                    
                    <table class="table">
                    	<tr >
                    		<th >강의번호</th>
                    		<td style="border-color:white">${ c.classNum }</td>
                    		<th>강의이름</th>
                    		<td style="border-color:white">${ c.className }</td>
                    	</tr>
                        <tr>
                            <th> 대상학년</th>
  							<td style="border-color:white">${ c.classGrade }</td>
                            <th> 강의학기</th>
  							<td style="border-color:white">${ c.classSemester }</td>
                        </tr>
                        <tr>
                            <th>강의실</th>
                            <td style="border-color:white">${c.classRoom}</td>
                            <th>강의시간</th>
                            <td style="border-color:white">${c.classTime }</td>
                        </tr> 
                        <tr>
                            <th>학점</th>
                            <td style="border-color:white">${c.classScore}</td>
                            <th>구분</th>
                            <td style="border-color:white">${c.classTypeName }</td>
                        </tr> 
                        <tr>
                            <th>수강정원</th>
                            <td style="border-color:white">${c.classPeople}</td>
                            <th>기타사항</th>
                            <td style="border-color:white">${c.classEtc }</td>
                        </tr> 
                         <tr>
                            <th>강의계획서</th>
                            <td colspan="2" style="border-color:white">
                                <c:choose>
	                    		<c:when test="${ empty c.originName }">
			                    	<!-- 첨부파일이 없는 경우 -->
			                    			첨부파일이 없습니다.
		                    	</c:when>
		                    	
		                    	<c:otherwise>
			                        <!-- 첨부파일이 있는 경우-->
			                        <a href="${c.changeName }" download="${c.originName }">${c.originName }</a>
		                        </c:otherwise>
	                        </c:choose>
                            </td>
                        </tr> 
                    </table>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <a id="enrollBtn"  class="btn btn-primary" onclick="postFormSubmit(1);">수정</a>
                    <a href="classList.bo" class="btn btn-secondary">목록</a>
                    <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제</a>
                </div>
                <form id="postForm" action="" method="post">
	            	<input type="hidden" name="cno" value="${ c.classNo }">
	            	<input type="hidden" name="filePath" value="${ c.changeName }">
	            </form>
	            
                <script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // 수정하기를 클릭
	            			
	            			$("#postForm").attr("action","classUpdateForm.co").submit(); //속성은 attr
	            			
	            		}else{ // 삭제하기 클릭
	            			Swal.fire({
	            				  title: "정말로 삭제하시겠습니까?",
	            				  text:"",
	            				  icon: 'warning',
	            				  
	            				  showCancelButton: true,
	            				  confirmButtonText: "승인",
	            				  cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	            				  
	            				}).then((result) => {
	            				  /* Read more about isConfirmed, isDenied below */
	            				  if (result.isConfirmed) {
	            					  $("#postForm").attr("action","classDelete.co").submit(); //속성은 attr
	            				  } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	            				     Swal.fire('취소되었습니다!', '', 'info');
	            				    
	            				  }
	            				});
	            			
	            			//가만히있는다고 가는게 아니라 submit을 해줘야 감
	            		}
	            	}
	            </script>
                
        </div>



        
    

      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>