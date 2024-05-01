<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/12b80a3a82.js" crossorigin="anonymous"></script>
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
   #title:hover{
    cursor: pointer;
  }
   #fileTag{
	cursor:pointer;
  }
  #boardList>tbody>tr>td{
   cursor: pointer;
  }
</style>

</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
        <input type="hidden" value="${ classNum }" id="classNum">
        <input type="hidden" id="studentNo" name="studentNo" value="${ loginStudent.studentNo }">
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
         <div id="notice" class="lec-nav-item" style="background-color: #1c4587; color: white;">공지사항</div>
         <div id="classPlan" class="lec-nav-item">강의계획서</div>
         <div id="board" class="lec-nav-item">자유게시판</div>
         <div id="project" class="lec-nav-item">과제게시판</div>
      </div>
      
      <div class="lList-area">


         <div id="notice-area">
            <!-- 공지사항 게시판 클릭시 화면-->
            
            <div class="list-title" style="margin-bottom: 20px;">공지사항</div>
            <table id="boardList" class="table table-hover" align="center">
               <thead>
                  <tr>
                     <th>글번호</th>
                     <th>제목</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
	               	<c:when test="${ empty list }">
					  <tr>
					  	<td colspan="4">존재하는 공지사항이 없습니다.</td>
					  </tr>           
	                </c:when>
	               	<c:otherwise>
			            <c:forEach var="n" items="${ list }">
			                  <tr>
			                     <input type="hidden" id="classNoticeNo" value="${n.classNoticeNo}">
			                     <td class="cno">${ n.refClassNo }</td>
			                     <td>${ n.cnTitle }</td>
			                     <td>${ n.cnDate}</td>
			                     <td>${ n.cnCount }</td>
			                  </tr>
			             </c:forEach>
	                 </c:otherwise>
                </c:choose>
               </tbody>
            </table>
            
		     <script>
			    $(document).ready(function(){
			      $("#boardList>tbody>tr>td").click(function(){
			    	 console.log($(this).closest("tr").find(".cno").text());
			    	 var classNoticeNo =  $(this).closest("tr").find("#classNoticeNo").val();
			    	 console.log(classNoticeNo);
			    	 if(classNoticeNo != null){
				         location.href='noticeDetail.co?classNum=${classNum}&cno=' + $(this).closest("tr").find(".cno").text() + '&classNoticeNo=' + classNoticeNo;			    		 
			    	 }
			      });
			    })
		  	 </script>

       		<div id="pagingArea">
                <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
               	 <c:if test="${ not empty list }">
               		<c:choose>
               			<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href=""><i class="fa fa-angle-left"></i></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="notice.co?classNum=${ classNum }&cpage=${ pi.currentPage - 1 }">&laquo;</a></li>	                    		
                    	</c:otherwise>
                    </c:choose>
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"  >
                    		<li class="page-item"><a class="page-link" href="notice.co?classNum=${ classNum }&cpage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    	
                    <c:choose>	
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   		<li class="page-item disabled"><a class="page-link" href=""><i class="fa fa-angle-right"></i></a></li>
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="notice.co?classNum=${ classNum }&cpage=${ pi.currentPage + 1 }">&raquo;</a></li>
	                    </c:otherwise>
                	</c:choose>
                 </c:if>
                </ul>
            </div>
         </div>
      </div>


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
						            value += "<td id='fileTag'>" +
						                     "<img width='30' height='30' src='https://img.icons8.com/pastel-glyph/128/737373/search--v2.png'>" +
						                     "</td>";
						        } else {
						            value += "<td>X</td>";
						        }
					
						        value += "</tr>" +
						                 "</tbody>" +
						                 "</table>" +
						                 "</div>" +
                                   "<br>" +
                                   "<div class='card-body' style='display:none;'>" +
                                   "<div>"
   					 
   					 $("#notice-area").html(value);
						      
   					 
   				 }, error:function(){
   					 console.log("ajax통신실패");
   				 }
   			 });
   			})
   		})
   </script>
   
   <script>
   $(document).ready(function(){
	   
	   $(document).on("click", "#fileTag", function(){
           var classNum = $(".content").find("#classNum").val();  	

           $.ajax({
   			 url:"classPlanView.st",
   			 data:{classNum:classNum},
   			 success:function(file){
   				 console.log("되냐고");
   				 console.log(file);
   				 console.log()
   				 value = "";
   				 
   				 value += "<iframe src='" +  file + "'style='width:100%; height:700px;'></iframe>"	   				 

   				$(".card-body").html(value);
   				$(".card-body").show();
   			    
   			 }, error:function(){
   				 console.log("안되냐고");
   			 }
   		 })	 
        })
   })
   </script>
	

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>