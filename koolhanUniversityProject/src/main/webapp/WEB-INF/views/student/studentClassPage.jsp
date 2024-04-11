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
   .form-select{
      border-color: rgb(214, 214, 214);
      border-radius: 5px;
      height: 80%;
      display: block;
      line-height: 80%;
      margin-top: 3px;
      padding-left: 5px;
      margin-right: 10px;
      width: 180px;
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
         <div id="title">나의 수강 조회</div>
         <div id="mid-title">강의관리 > 나의수강조회 </div>
      </div>
      <div class="lecture-area">
         <div id="lecture-title">강의명</div>
         <select class="form-select" aria-label="Default select example">
            <option value="" disabled selected hidden>강의명을 선택하세요</option>
            <option value="java">자바기초</option>
            <option value="jscript">자바스크립트기초</option>
            <option value="mybatis">마이바티스기초</option>
            <option value="spring">스프링기초</option>
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
                     <th>학기</th>
                     <th>강의명</th>
                     <th>강의실</th>
                     <th>강의시간</th>
                     <th>학점</th>
                     <th>강의실 입장</th>
                   </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>200531</td>
                     <td>2학년 1학기</td>
                     <td>자바기초</td>
                     <td>1관 201호</td>
                     <td>목 1,2,3</td>
                     <td>3</td>
                     <td>
                        <button type="button" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">상세보기</button>
                     </td>
                  </tr>

                  <tr>
                     <td>200563</td>
                     <td>2학년 1학기</td>
                     <td>자바스크립트기초</td>
                     <td>1관 205호</td>
                     <td>화 1,2,3</td>
                     <td>3</td>
                     <td>
                        <button type="button" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">상세보기</button>
                     </td>
                  </tr>

                  <tr>
                     <td>200568</td>
                     <td>2학년 1학기</td>
                     <td>마이바티스 기초</td>
                     <td>1관 306호</td>
                     <td>금 5,6</td>
                     <td>2</td>
                     <td>
                        <button type="button" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">상세보기</button>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>

      </div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>