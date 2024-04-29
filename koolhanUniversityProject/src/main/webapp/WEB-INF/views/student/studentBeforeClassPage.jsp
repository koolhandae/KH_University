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
   .lecture-area{
      width: 100%;
      height: 40px;
      background-color: white;    
      display: flex;
      line-height: 40px;
      margin-top: 15px;
   }
   #lecture-year{
      font-size: middle;
      font-weight: 600;
      padding-left: 20px;
      padding-right: 10px;
      color: gray;
   }
   #lecture-semester{
   	  font-size: middle;
      font-weight: 600;
      padding-right: 10px;
      color: gray;
   }
   .form-select, .form-select-2{
      border-color: rgb(214, 214, 214);
      border-radius: 5px;
      height: 80%;
      display: block;
      line-height: 80%;
      margin-top: 3px;
      padding-left: 5px;
      margin-right: 10px;
      width: 80px;
   }
   .lList-area{
      background-color: white;
      margin-top: 15px;
      width: 100%;
      height: 500px;
   }
   .list-content{
      padding: 20px;
   }
   .list-title{
      font-weight: 600;
      color: gray;
   }
   #boardList *{
		text-align: center;
		vertical-align: middle;
	}

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <div class="title-area">
         <div id="title">이전 수강내역 조회</div>
         <div id="mid-title">강의관리 > 이전 수강내역 조회 </div>
      </div>
      <div class="lecture-area">
         <div id="lecture-year">수강년도</div>
         <select class="form-select" aria-label="Default select example">
            <option value="2020">2020</option>
            <option value="2021">2021</option>
            <option value="2022">2022</option>
            <option value="2023">2023</option>
         </select>
         
         <div id="lecture-semester">학기</div>
         <select class="form-select-2" aria-label="Default select example">
            <option value="2020">1학기</option>
            <option value="2021">2학기</option>
         </select>
         <button type="button" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">조회</button>
      </div>
      <div class="lList-area">
         <div class="list-content">
            <div class="list-title" style="margin-bottom: 15px;">수강내역</div>
            <table id="boardList" class="table table-hover" align="center">
               <thead style="height: 40px;  color: #858796;">
                  <tr>
                     <th>강의번호</th>
                     <th>수강년도</th>
                     <th>학년</th>
                     <th>학기</th>
                     <th>구분</th>
                     <th>강의이름</th>
                     <th>강의시간</th>
                     <th>학점</th>
                   </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>126172</td>
                     <td>2022</td>
                     <td>2학년</td>
                     <td>1학기</td>
                     <td>전공</td>
                     <td>자바기초</td>
                     <td>목 1,2,3</td>
                     <td>3</td>
                  </tr>

                  <tr>
                     <td>126542</td>
                     <td>2023</td>
                     <td>3학년</td>
                     <td>2학기</td>
                     <td>전공</td>
                     <td>자바심화</td>
                     <td>화 1,2,3</td>
                     <td>3</td>
                  </tr>

                  <tr>
                     <td>125542</td>
                     <td>2023</td>
                     <td>3학년</td>
                     <td>1학기</td>
                     <td>교양</td>
                     <td>일본어의이해</td>
                     <td>금 1,2,3</td>
                     <td>2</td>
                  </tr>
               </tbody>
            </table>
         </div>

      </div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>