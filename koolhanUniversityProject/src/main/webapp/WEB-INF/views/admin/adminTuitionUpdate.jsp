admintuitionUpdate.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #boardList *{ 
 		vertical-align: middle;
    } 

    #boardList th{
        background-color: rgb(48, 76, 121);
        color: white;
        text-align: center;
    }

   .searchArea{
        float: right;
        padding-right: 100px;
    }

   .searchArea>input{
        color: rgb(75,75,75);
        height: 31.5px;
    }

    #btn {
        border: 2px solid rgb(48, 76, 121); 
        color: rgb(48, 76, 121);
        border-radius: 5px;
        height: 35px;
    }

    #btn:hover{ 
        background-color: rgb(18, 46, 81); 
        color : white; 
    }

    .updateBtn>button{
      display: flex;
    }

    #N{
      margin-left: 20px;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <div class="innerOuter">
         <h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">등록금 관리</h2>
         <hr>
         <br>
            <div class="searchArea">
               <input type="text" id="search" placeholder="학번 또는 이름을 검색해주세요">
               <button class="btn" id="btn">검색</button>
         </div>
         <br><br>
         <table id="boardList" class="selectTuition table" style="width: 900px;">
               <tr>
                  <th>이름</th>
                  <td>김뫄뫄</td>
                  <th>학번</th>
                  <td>2401010</td>
               </tr>

               <tr>
                  <th>학부(과)</th>
                  <td colspan="3">컴퓨터공학과</td>
               </tr>

               <tr>
                  <th>등록금</th>
                  <td>
                     <input type="number" min="0" name="tuition" id="tuition">
                  </td>
                  <th>장학금</th>
                  <td>
                     <input type="number" min="0" name="payback" id="payback">
                  </td>
               </tr>

               
               <tr>
                  <th>총 납입금</th>
                  <td>
                  <input type="number" min="0" name="total" id="total">
                  </td>
                  <th>납입 상태</th>
                  <td id="lastB">
                     <label for="Y">
                  	   <input type="radio" name="status" id="Y"> 납입
                     </label>
                     <label for="N">
                  	   <input type="radio" name="status" id="N"> 미납입
                     </label>
                  </td>
               </tr>
            </table>
			
			<br><br>
			         
            <div class="updateBtn" align="center">
               <button class="btn" id="btn">수정하기</button>
            </div>
      	</div>
	</div>      
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>