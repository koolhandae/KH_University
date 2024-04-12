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
 		text-align: center; 
 		vertical-align: middle;
    } 

  #boardList th{
    background-color: rgb(48, 76, 121);
    color: white;
    text-align: center;
    }

  #btn {
    border: 2px solid rgb(48, 76, 121); 
    color: rgb(48, 76, 121);
    border-radius: 5px;
    }

  #btn:hover{ 
    background-color: rgb(18, 46, 81); 
    color : white; 
    }    
  
  .billBtn>button{
      margin: auto;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   <div class="innerOuter">
   	  <h1 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">등록금 납부</h1>
   	  <hr><br>
   	  	
   		<h3>학생 정보</h3>
   		<table id="boardList" class="selectTuition table" style="width: 900px;">
   			
        <tr>
          <th>이름</th>
          <td>김뫄뫄</td>
          <th>학번</th>
          <td>2401010</td>
        </tr>
        <tr>
          <th>학부(과)</th>
          <td colspan="3" style="border-bottom: 1px solid rgb(230, 230, 230);">쿨한대학교 컴퓨터공학과</td>
        </tr>
   		</table>
   	  <br>
      <h3>등록금 납입 정보</h3>
      <table id="boardList" class="selectTuition table" style="width: 900px; border-bottom: 1px solid rgb(230, 230, 230);">
        <tr>
          <th>등록금</th>
          <td>4,000,000</td>
          <th>장학금</th>
          <td>1,500,000</td>
        </tr>
        <tr>
          <th style="font-size: 20px";>총 납부금</th>
          <td colspan="3" style="font-size: 20px; font-weight: bold;">2,500,000</td>
        </tr>
      </table>
      <br>
      <h3>납입 방식</h3>
      <table id="boardList" class="selectTuition table" style="width: 900px;">
        <tr>
          <td>
            <input type="radio" name="radioBtn" id=""> 카카오페이
            <input type="radio" name="radioBtn" id=""> 토스페이
            <input type="radio" name="radioBtn" id=""> 무통장입금
          </td>
        </tr>
      </table>
      <br><br>
      <div class="billBtn" style="display: flex">
        <button class="btn btn-xs" id="btn">결제하기</button>
      </div>
   </div>  
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>