<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
      #btn {
        border: 2px solid rgb(48, 76, 121);
        color: rgb(48, 76, 121);
        border-radius: 5px;
      }

      #btn:hover {
        background-color: rgb(18, 46, 81);
        color: white;
      }

      .billBtn > button {
        margin: auto;
      }

      .selectTuitionbtn {
        height: 70px;
        width: 250px;
        margin-right: 100px;
      }

      .paymentTuition {
        height: 70px;
        width: 250px;
      }

      .tuitionBtn > button {
        display: flexbox;
        font-size: 20px;
        border-radius: 13px;
        border: 2px solid rgb(48, 76, 121);
        color: rgb(48, 76, 121);

        /* background-color: rgb(48, 76, 121);  */
      }

      .tuitionBtn > button:hover {
        background-color: rgb(18, 46, 81);
        color: white;
      }

      #boardList th {
        background-color: rgb(48, 76, 121);
        color: white;
        text-align: center;
      }

      #boardList td {
        padding-left: 30px;
      }

      #boardList {
        width: 900px;
      }

      #borderList > tr {
        border-bottom: 1px;
        border-color: rgb(75, 75, 75);
      }

      #search {
      	height: 35px;
      }

      .searchArea, .generateBtn {
        display: inline-block;
        float: right;
      }
      
      .generateBtn{
        padding-right: 10px;
        
      }

      .searchArea{
        padding-right: 150px;
      }

      hr {
        width: 1000px;
      }
    </style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <div class="innerOuter">

        <h1 style="margin-left: 200px; font-weight: 900; color: rgb(75, 75, 75)">
          등록금 고지서 발급
        </h1>
        <h5 style="margin-left: 200px">2024년도 1학기</h5>
        <hr />
        <br />
        <br />

        <!-- <form action="tuitionMakeSelect.ad"> -->
        <table id="boardList" class="table" align="center">
          <tr>
            <th>학부(과)</th>
            <td colspan="3">컴퓨터공학과</td>
          </tr>

          <tr>
            <th>등록금</th>
            <td colspan="3">
              ${ tuition.tbPrice } 
            </td>
          </tr>
          <tr>
            <th>연도</th>
            <td>2024</td>
            <th>학기</th>
            <td>${ tuition.tbSemester } </td>
          </tr>
      

          <tr>
            <th>납부기간</th>
            <td align="center" colspan="3">
              ${ tuition.tbOpen } ~ ${ tuition.tbClose }
            </td>
          </tr>
        </table>

        <br />

        <!-- </form> -->
        <br />
        <hr>
        <br>
        <div class="searchArea">
          <input type="text" name="search" id="search" placeholder="전체 또는 학번을 입력해주세요"/>
          <button class="btn" id="btn">검색</button>
        </div>
        <div class="generateBtn">
        	<a href="tuitionMakeStudent.ad" >등록금 납부 대상 발급 및 조회</a>
        </div>
        <br><br>
        <table id="boardList" class="table" align="center" width="700px">
          <tr>
            <th>고지서 번호</th>
            <th>학번</th>
            <th>등록금</th>
            <th>장학금</th>
          </tr>

	 	 <c:forEach var="item" items="${list}">
			   		  <tr align="center">
			   		  	<td>${item.ttNo}</td>
			   		  	<td>${item.studentId}</td>
			   		  	<td>${item.tuition} </td>
			   		  	<td>${item.scholarShip}</td>
			   		  </tr>
			   		 
	     </c:forEach>
    
        </table>

      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>