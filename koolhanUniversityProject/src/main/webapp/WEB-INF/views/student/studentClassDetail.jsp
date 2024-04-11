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
      padding: 30px;
   }
   .title-area{
      width: 100%;
      height: 50px;
      background-color: white;      
      display: flex;
      line-height: 50px;
      justify-content: space-between;
   }
   #title{
      font-size: large;
      font-weight: 600;
      color: #1c4587;
      padding-left: 20px;
   }
   #mid-title{
      font-size:small;
      padding-right: 20px;
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
      height: 500px;
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
      border: 1px solid rgb(207, 207, 207);
      border-radius: 10px;
      width: 100%;
      height: 150px;
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


</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
        <div class="title-area">
         <div id="title">나의 수강 조회</div>
         <div id="mid-title">강의관리 > 나의수강조회 </div>
      </div>
      <div class="lecture-area">
         <div id="lecture-title">자바기초 강의실</div>
      </div>
      <div class="lecture-navigator">
         <div id="notice">공지사항</div>
         <div id="classPlan">강의계획서</div>
         <div id="board">자유게시판</div>
         <div id="project">과제게시판</div>
      </div>
      
      <div class="lList-area">


         <div id="notice-area">
            <!-- 공지사항 게시판 클릭시 화면-->
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
      <div class="list-title" style="margin-bottom: 20px;">자유게시판</div>
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

      <!-- 과제게시판 클릭시 화면 -->     
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
               <tbody>
                  <tr>
                     <td>1</td>
                     <td>중간과제:자바산술연산</td>
                     <td>
                        <input type="file">
                     </td>
                     <td>진행중</td>
                     <td id="project-btn">
                        <img width="30" height="30" src="https://img.icons8.com/fluency-systems-regular/30/1C4587/nui2.png" alt="nui2"/>
                     </td>
                     <td>2024.04.05 오후 11:59</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>

   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>