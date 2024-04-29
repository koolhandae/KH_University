<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="src/css/jquery.simplefileinput.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/js/jquery.simplefileinput.min.js"></script>

<style>
  .content{
      padding: 50px;
   }
   .title-area{
      /*
      width: 100%;
      height: 50px;
      background-color: white;      
      display: flex;
      line-height: 50px;
      justify-content: space-between;
      */
      width: 100%;
      height: 50px;
      background-color: white;
      display: flex;
      line-height: 50px;
      justify-content: flex-start;
   }
   .title-area .home{
      font-size: 0;
      width: 37px;
      height: 54px;
      display: inline-block;
      position: relative;
   }
   #title{
      font-size: x-large;
      font-weight: 600;
      color: #1c4587;
      padding-left: 20px;
      margin-right: 1450px;
   }
   #mid-title{
      font-size:small;
      padding-right: 20px;
   }
   #fin-title{
      padding-left: 20px;
      font-size:small;
   }
   .lecture-area{
      width: 100%;
      height: 40px;
      background-color: white;    
      display: flex;
      line-height: 40px;
      margin-top: 15px;
   }
   #lecture-title{
      font-size: middle;
      font-weight: 600;
      padding-left: 20px;
      padding-right: 10px;
      color: gray;
   }
   .lList-area{
      background-color: white;
      margin-top: 15px;
      width: 100%;
      height: auto;
   }
   .lecture-navigator{
      height: 55px;
      display: flex;
      margin-top: 15px;
   }
   .list-title{
      font-weight: 600;
      font-size: larger;
      color: rgb(82, 81, 81);
      text-align: center;
   }
   .lecture-navigator div{
      border: 1px solid rgb(201, 201, 201);
      background-color: white;
      font-weight: 600;
      color: gray;
      text-align: center;
      vertical-align: middle;
      width: 100%;
      margin: 1px;
      line-height: 53px;
      cursor: pointer;
   }
   #notice:hover, #classPlan:hover, #board:hover, #project:hover{
      background-color: #1c4587;
      color: white;
   }
   #boardList, #planList *{
		text-align: center;
		vertical-align: middle;
	}
   #boardList{
      margin-block-end: auto;
   }
   #notice-area{
      padding: 50px;
      padding-top: 30px;
   }
   #planList{
      border-bottom: 1px solid rgb(156, 155, 155);
   }
   #planList thead{
      background-color: #1c4587;
      color: white;
   }
   .project-area{
      margin: 10px;
      display: flex;
   }
   .project-area div{
      border: 2px solid rgb(231, 231, 231);
      border-radius: 10px;
      width: 100%;
      height: 200px;
      margin: 10px;
      text-align: center;
      font-size: x-large;
      color: rgb(82, 81, 81);
      font-weight: 600;
   }

   .fa-solid{
      font-size: small;
      margin-right: 18px;
   } 
   #line-title{
      margin-top: -40px;
      margin-bottom: 15px;
      text-align: center;
   }
   #board-area{
      border-top: 2px solid gray;
      margin-left: 200px;
      margin-right: 200px;
   }
   #board-content{
      padding: 20px;
   }
   #board-title{
      font-size: large;
      color: rgb(82, 81, 81);
      font-weight: 600;
      padding-left: 15px;
      padding-right: 15px;
   }
   .table td{
      border-bottom: 1px solid #e3e6f0;
   }
   #board-table{
      margin-top: 15px;
   }
   #board-text{
      padding: 30px;
      height: 300px;
   }
   .btn1{
      display: none;
   }
   #board-file-label{
      border: 1px solid #e2e2e2;
      border-radius: 5px;
      height: 35px;
      padding-left: 20px;
      width: 100%;
      display: block;
      padding-top: 5px;
   }
   #board-file-btn{
      background-color: #1c4587;
      border: 1px solid #1c4587;
      border-bottom-right-radius: 5px;
      border-top-right-radius: 5px;
      color: white;
      height: 34px;
      width: 150px;
      float: right;
      padding: 4px;
      text-align: center;
      margin-top: -29px;
   }
   #board-file-div{
      display: flex;
      box-sizing: border-box;
   }
   #board-file-label span{
      height: 100;
   }
   .table th {
    border-bottom: 1px solid #e3e6f0;
   }

   


</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   		<input type="hidden" id="bno" value="${cb.classBoardNo}">
   		<input type="hidden" id="classNum" value="${classNum}">
   		<div class="title-area">
           <div id="title" onclick="location.href='showCourse.st'">나의 수강 조회</div>
           
           <a>
              <!--<i class="fa-solid fa-house"></i>-->
           </a>
           
         <div id="mid-title">나의강의실</div>
         <div>></div>
         <div id="fin-title">나의수강조회</div>
      </div>
      <div class="lecture-area">
         <div id="lecture-title">자바기초 강의실</div>
      </div>
      <div class="lecture-navigator">
         <div id="notice" class="lec-nav-item">공지사항</div>
         <div id="classPlan" class="lec-nav-item">강의계획서</div>
         <div id="board" class="lec-nav-item">자유게시판</div>
         <div id="project" class="lec-nav-item">과제게시판</div>
      </div>
      
      <div class="lList-area">
      	 <div id="notice-area">
      	 	<div class="list-title" style="margin-bottom: 20px;">자유게시판</div>
            <div id="line-title">
               <img width="70" height="50" src="https://img.icons8.com/ios-filled/50/525151/horizontal-line.png" alt="horizontal-line"/>
            </div>
               <div id="board-area">
               <div id="board-content">
                  <div id="board-title">${cb.cbTitle}</div>
                  <table id="board-table" class="table">
                     <tr>
                        <td>등록자 :</td>
                        <td style="width:30%">${cb.studentName}</td>
                        <td>등록일 :</td>
                        <td>${cb.cbDate}</td>
                        <td>조회수 : </td>
                        <td>${cb.cbCount}</td>
                     </tr>
                  </table>
                  <div id="board-text">
                     <span>${cb.cbContent}</span>
                  </div>
                  <input type="hidden" id="board-file" class="btn1"/>
                  <div id="board-file-div">
                     <label id="board-file-label" for="board-file">                   
                     <c:if test="${ empty cb.cbChangeName }">
                     	 <div style="margin-left: 150px;">
	                        <span>첨부파일이 없습니다.</span>
	                     </div>
                     </c:if>
                    	 <c:if test="${not empty cb.cbChangeName}">
                     <div style="margin-left: 150px;">
                        <a href="${cb.cbChangeName}" download="${cb.cbOriginName}" style="color: gray; margin-left: 150px;">${ cb.cbChangeName }</a>
                     </div>
                    	</c:if>
                        <div id="board-file-btn">+ upload files</div>
                     </label>
                  </div>
                  <br>
                  <div style="text-align: center;">
                  	 <button type="bitton" class="btn btn-secondary btn-sm" onclick="history.back();">뒤로가기</button>
	                  <c:if test="${ loginStudent.studentName eq cb.studentName }">
	                     <button type="button" class="btn btn-outline-secondary btn-sm" onclick="updateBoardForm.st">수정하기</button>
	                     <button type="button" class="btn btn-secondary btn-sm" id="deleteBtn">삭제하기</button>
	                  </c:if>
                  </div>
                  <br>
                  <table id="replyArea" class="table" align="center" style="margin-left: 15px;">
                     <thead>
                           <!--
                           <th colspan="2">
                              <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%" readonly>로그인한 사용자만 이용가능한 서비스입니다. 로그인 후 이용바랍니다</textarea>
                           </th>
                           <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                           -->
                           <th colspan="2">
                              <textarea class="form-control" name="" id="content" cols="60" rows="2" style="resize:none; width:100%"></textarea>
                           </th>
                           <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                         </tr>
                         <tr>
                            <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                         </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th>작성자</th>
                           <td>내용</td>
                           <td>날짜</td>
                        </tr>
                     </tbody>
                 </table>
               </div>
               
            </div>
         </div>
      </div>
 	
   </div>
   <script>
      $(function(){
         $("#board").css({
            "background-color": "#1c4587",
            "color": "white"
         })
      })
   </script>
   
   <script>
   $("#deleteBtn").click(function(){
	   var bno = $("#bno").val();
	   console.log("타냐?");
	   console.log(bno);
	   $.ajax({
		   url:"deleteBoard.st",
		   data:{bno:bno},
		   success:function(result){
			   console.log("akax성공");
				if(result>0){
					location.href="board.co";
				}else{
					Swal.fire({
			            icon: 'warning',
			            text: '게시글 삭제에 실패했습니다!' 
			        });
				}
			   
		   }, error:function(){
			   console.log("ajax실패");
		   }
	   })
   })
   
   </script>   
      
      
   <script>
	$("#board").click(function(){
		var classNum = $("#classNum").val();
		location.href='board.co?classNum=' + classNum;
	})   
   </script>
   
   <script>
   $("#board-file").change(function(){
      const filneName = $(this).val();
      $("#board-file-label span").text(filneName);
   })

   </script>
   
    <!-- 다시 공지사항으로 이동 -->
   <script>
      $(document).ready(function(){
         $("#notice").click(function(){
            var classNum = $("#classNum").val(); // classNum 값을 가져옴
            location.href = "notice.co?classNum=" + classNum;
         })
      })
   </script>
   
   	<!-- 자유게시판 클릭시 이동 -->
   	<script>
   	$(document).on("click","#board",function(){ 		
          location.href = "board.co";
   	})
   	</script>
   	
   	<!-- 과제게시판 클릭시 이동 -->
   	<script>
   	$(document).on("click","#project",function(){ 		
          console.log("되냐?")
          location.href = "project.st";
   	})
   	</script>
   
   <!-- 강의계획서 div로 이동 -->
   <script>
	   	$(document).ready(function(){
   			$("#classPlan").click(function(){
  				var classNum = $(".content").find("#classNum").val();  	
  				
   				console.log(classNum); 			
   			 $.ajax({
   				 url:"classPlan.co",
   				 data:{classNum:classNum},
   				 success:function(c){ 
   					 console.log("ajax통신성공");
					 var c = c;
					 var value ="";
					 
					 var originName = c.originName;
					 var changeName = c.changeName;
					 
					 
					 value += "<div class='list-title' style='margin-bottom: 20px;'>강의계획서</div>" +
				                 "<table id='planList' class='table' align='center'>" +
				                 "<thead>" +
				                 "<tr>" +
				                 "<th>학점</th>" +
				                 "<th>강의실</th>" +
				                 "<th>강의시간</th>" +
				                 "<th>대표교수</th>" +
				                 "<th>강의계획서</th>" +
				                 "</tr>" +
				                 "</thead>" +
				                 "<tbody>" +
				                 "<tr>" +
				                 "<td>" + c.classScore + "</td>" +
				                 "<td>" + c.classRoom + "</td>" +
				                 "<td>" + c.classTime + "</td>" +
				                 "<td>" + c.memberName + "</td>";
			
						        if (changeName) {
						            value += "<td>" +
						                     "<a href='" + changeName + "' download='" + originName + "' id='planFile'>" +
						                     "<img width='30' height='30' src='https://img.icons8.com/pastel-glyph/128/737373/search--v2.png'>" +
						                     "</a>" +
						                     "</td>";
						        } else {
						            value += "<td>X</td>";
						        }
					
						        value += "</tr>" +
						                 "</tbody>" +
						                 "</table>" +
						                 "</div>";
   					 
   					 $("#notice-area").html(value);
						      
   					 
   				 }, error:function(){
   					 console.log("ajax통신실패");
   				 }
   			 });
   			})
   		})
   </script>
	

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>