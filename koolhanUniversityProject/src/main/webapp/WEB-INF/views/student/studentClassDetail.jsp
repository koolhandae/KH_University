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
      padding: 30px;
      padding-top: 20px;
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
        <div class="title-area">
           <div id="title">나의 수강 조회</div>
           
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
               <c:forEach var="n" items="${ list }">
                  <tr>
                     <td>${ n.classNoticeNo }</td>
                     <td>${ n.cnTitle }</td>
                     <td>${ n.cnDate}</td>
                     <td>${ n.cnCount }</td>
                  </tr>
                </c:forEach>
               </tbody>
            </table>
         </div>

       <div id="pagingArea">
                <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
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
                </ul>
            </div>
            <br>
      </div>
      <!-- 공지사항 세부사항 클릭시 -->
	  <!-- 
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
                  <tr>
                     <td>4</td>
                     <td>중간과제 제출 관련공지입니다</td>
                     <td>2024.04.12</td>
                     <td>5</td>
                  </tr>
                   <tr>
                     <td>3</td>
                     <td>3주차 강의자료입니다</td>
                     <td>2024.03.19</td>
                     <td>10</td>
                  </tr>
                   <tr>
                     <td>2</td>
                     <td>2주차 강의자료입니다</td>
                     <td>2024.03.12</td>
                     <td>2</td>
                  </tr>
                   <tr>
                     <td>1</td>
                     <td>1주차 강의자료입니다</td>
                     <td>2024.03.05</td>
                     <td>1</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
       -->

      <!-- 강의계획서 클릭시 화면 -->
      <!--
      <div class="list-title" style="margin-bottom: 20px;">강의계획서</div>
            <table id="planList" class="table" align="center">
               <thead>
                  <tr>
                     <th>학점</th>
                     <th>강의실</th>
                     <th>강의시간</th>
                     <th>대표교수</th>
                     <th>강의계획서</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>3</td>
                     <td>1관 201호</td>
                     <td>목 1,2,3</td>
                     <td>김시연 교수</td>
                     <td>
                     	<a href=""> 
                           <img width="30" height="30" src="https://img.icons8.com/pastel-glyph/128/737373/search--v2.png"/>
                        </a>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
      -->

      <!-- 자유게시판 클릭시 화면 -->
      <!-- 
      <div class="list-main-title">
	      <div class="list-title" style="margin-bottom: 20px;">자유게시판</div>
	      <div>
	      	<button type="button" class="btn btn-outline-secondary btn-sm">글쓰기</button>
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
                  <tr>
                     <td>4</td>
                     <td>3조 보고서 제출합니다</td>
                     <td>2024.04.20</td>
                     <td>김**</td>
                     <td>2</td>
                  </tr>
                  <tr>
                     <td>3</td>
                     <td>2조 보고서 제출합니다</td>
                     <td>2024.04.20</td>
                     <td>서**</td>
                     <td>5</td>
                  </tr>
                  <tr>
                     <td>2</td>
                     <td>1조 보고서 제출합니다</td>
                     <td>2024.04.18</td>
                     <td>정**</td>
                     <td>4</td>
                  </tr>
                  <tr>
                     <td>1</td>
                     <td>4주차 강의자료 아직 안올라왔습니다</td>
                     <td>2024.04.15</td>
                     <td>우**</td>
                     <td>15</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
       -->
      <!--
      <div id="pagingArea">
                <ul class="pagination">
               		<c:choose>
               			<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">Previous</a></li>	                    		
                    	</c:otherwise>
                    </c:choose>
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    	
                    <c:choose>	
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   		<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
	                    </c:otherwise>
                	</c:choose>
                </ul>
            </div>
       -->    
      


      <!-- 과제게시판 클릭시 화면 -->   
      <!--
         <div class="project-area">
            <div id="ing-project">
               <img width="80" height="80" src="https://img.icons8.com/material-outlined/96/FCA819/no-entry.png" alt="no-entry"/>
               <span>미완료 과제 1건</span>
            </div>
            <div id="miss-project">
               <img width="100" height="100" src="https://img.icons8.com/sf-regular/100/BB0505/cancel.png" alt="cancel"/>
               <span style="padding-bottom: 10px";>누락된 과제 0건</span>
            </div>
            <div id="done-project">
               <img width="75" height="75" src="https://img.icons8.com/metro/80/64A11F/checked.png" alt="checked"/>
               <span>제출완료 0건</span>
            </div>
         </div>
            <table id="boardList" class="table" align="center">
               <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>첨부파일</th>
                     <th>진행상황</th>
                     <th>제출</th>
                     <th>마감일</th>
                  </tr>
               </thead>
               <form action="">
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>중간과제:자바산술연산</td>
                        <td>
                           <label class="input-file-button" for="input-file">
                              upload-file
                           </label>
                           <input type="file" id="input-file" style="display:none">
                        </td>
                        <td>진행중</td>
                        <td id="project-btn">
                           <img width="30" height="30" src="https://img.icons8.com/fluency-systems-regular/30/1C4587/nui2.png" alt="nui2"/>
                        </td>
                        <td>2024.04.05 오후 11:59</td>
                     </tr>
                  </tbody>
               </form>
            </table>
            <div id="img-notice">
               <span>* 첨부파일 제출시 제목은 "학번_과제 제목" 형식 으로 제출바랍니다</span>
            </div>
         </div>
      </div>
   </div>
   -->  

   <script>
      $("#input-file").change(function(){
         var fileName = $("#input-file").val();
         $(".input-file-button").text(fileName);
      })
   </script>

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

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>