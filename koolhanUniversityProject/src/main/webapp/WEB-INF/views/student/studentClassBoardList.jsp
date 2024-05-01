<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      margin-right: 1200px;
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
     #lecture-main-title{
        font-size: middle;
        font-weight: 600;
        padding-left: 20px;
        padding-right: 10px;
        color: #1c4587;
     }
     #lecture-mid-title{
        font-size: middle;
        font-weight: 600;
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
      padding-left: 20px;
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
      padding-left: 100px;
      padding-right: 100px;
      padding-top: 30px;
      padding-bottom: 30px;
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
   #ing-project, #miss-project, #done-project{
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: space-around;
    justify-content: space-evenly;
    align-items: center;
   }
   #project-btn{
      box-sizing: border-box;
      padding-top: 8px;
      cursor: pointer;
   }
   .fa-solid{
      font-size: small;
      margin-right: 18px;
   } 
   .input-file-button{
      padding: 5px;
      border-color:rgb(61, 61, 61);
      border: 2px dashed;
      border-radius: 4px;
      cursor: pointer;
      width:300px;
    margin-top: -5px;
   }
   #img-notice{
      color: rgb(233, 0, 0);
      font-size: small;
      padding: 10px;
      text-align: right;
   }
   .list-main-title{
      display: flex;
      justify-content: space-between;
   }
   .pagenation{
      justify-content: center;
   }

   .pagination.pagination-rounded-flat .page-item .page-link, a {
      border: none;
      border-radius: 50px;
   }

   .page-link.active {
    background-color: #1c4587 !important;
    color: white !important;
  }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   
   <div class="content">
       <input type="hidden" value="${ classNum }" id="classNum">
        <div class="title-area">
           <div id="title" onclick="location.href='showCourse.st'">나의 수강 조회</div>
           
         <div id="mid-title">나의강의실</div>
         <div>></div>
         <div id="fin-title">나의수강조회</div>
      </div>
      <div class="lecture-area">
         <div id="lecture-main-title">${ className }</div>
         <div id="lecture-mid-title">강의실</div>
      </div>
      <div class="lecture-navigator">
         <div id="notice" class="lec-nav-item">공지사항</div>
         <div id="classPlan" class="lec-nav-item">강의계획서</div>
         <div id="board" class="lec-nav-item" style="background-color: #1c4587; color: white;">자유게시판</div>
         <div id="project" class="lec-nav-item">과제게시판</div>
      </div>
      
      <div class="lList-area">
	      <div id="notice-area">
	      	<div class="list-main-title">
		      <div class="list-title" style="margin-bottom: 20px;">자유게시판</div>
		      <div>
		      	<button type="button" id="writeBtn" class="btn btn-outline-secondary btn-sm">글쓰기</button>
		      </div>
	        </div>
	            <table id="boardList" class="table table-hover" align="center">
	               <thead>
	                  <tr>
	                     <th>글번호</th>
	                     <th>제목</th>
	                     <th>작성일</th>
	                     <th>작성자</th>
	                     <th>조회수</th>
	                  </tr>
	               </thead>
	               <tbody>
	               <c:choose>
	               	 <c:when test="${ empty list }">
	               	 	<tr>
	               	 		<td colspan="5">존재하는 게시판이 없습니다.</td>
	               	 	</tr>
	               	 </c:when>
	               	 <c:otherwise>
	               	 <c:forEach var="l" items="${ list }">	      	 
	                  <tr>
	                  	 <input type="hidden" id="classBoardNo" value=${l.classBoardNo}>
	                     <td class="bno">${l.cbWriter}</td>
	                     <td>${l.cbTitle}</td>
	                     <td>${l.cbDate}</td>
	                     <td>${l.studentName}</td>
	                     <td>${l.cbCount}</td>
	                  </tr>
	               	 </c:forEach>
	               	 </c:otherwise>
	               </c:choose>
	               </tbody>
	            </table>
	        
	     <script>
		    $(document).ready(function(){
		      $("#boardList>tbody>tr>td").click(function(){  
		    	  console.log($(this).closest("tr").find(".bno").text());
		    	  var classBoardNo =  $(this).closest("tr").find("#classBoardNo").val();
		    	  if(classNoticeNo != null){
		        	 location.href='boardDetail.co?classNum=${classNum}&bno=' + $(this).closest("tr").find(".bno").text() + '&classBoardNo=' + classBoardNo;
		    	  }
		    	});
		    })
	  	 </script>    
	     <c:if test="${ not empty list}">    
      	  <div id="pagingArea">
                <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
               		<c:choose>
               			<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href=""><i class="fa fa-angle-left"></i></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="board.co?classNum=${ classNum }&bpage=${ pi.currentPage - 1 }">&laquo;</a></li>	                    		
                    	</c:otherwise>
                    </c:choose>
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"  >
                    		<li class="page-item"><a class="page-link" href="board.co?classNum=${ classNum }&bpage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    	
                    <c:choose>	
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   		<li class="page-item disabled"><a class="page-link" href=""><i class="fa fa-angle-right"></i></a></li>
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="board.co?classNum=${ classNum }&bpage=${ pi.currentPage + 1 }">&raquo;</a></li>
	                    </c:otherwise>
                	</c:choose>
                </ul>
          </div>
          </c:if>  
	   </div>
	   </div>
	</div>
   	<!-- 과제 제출시 첨부파일 이름 담기 -->
   <script>
      $("#input-file").change(function(){
         var fileName = $("#input-file").val();
         $(".input-file-button").text(fileName);
      })
   </script>

   <!-- 강의실 네비게이터 클릭시 색변환  -->
   <script>
      $(".lec-nav-item").click(function(){
         $(".lec-nav-item").not(this).css({
            "background-color": "white",
            "color": "gray"
         });
         $(this).css({
            "background-color": "#1c4587",
            "color": "white"
         })
      })
   </script>
   
   <!-- 글작성으로 이동 -->
   	<script>
		$("#writeBtn").click(function(){
			location.href="insertBoard.st";
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