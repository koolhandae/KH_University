<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.selectTuition{ */
/* 		height: 70px;  */
/* 		width: 1000px;  */
/* 		text-align: center; */
/* 	} */
	
/* 	.topMenu{ */
/* 		background-color: rgb(48, 76, 121); */
/*       color : whitesmoke; */
/*    } */

/*    .innerOuter{ */
/*       height: 700px; */
/*    } */
   
    .selectTuitionbtn{ 
   		height:70px; 
   		width:300px; 
   		margin-right: 100px; 
    }
   
    .paymentTuition{ 
    		height:70px; 
    		width:300px; 
    } 

     .tuitionBtn>button{ 
       display: flexbox; 
       font-size: 20px; 
       border-radius: 13px; 
       border: 2px solid rgb(48, 76, 121); 
       color: rgb(48, 76, 121);

       /* background-color: rgb(48, 76, 121);  */ 
    }  
   
    .tuitionBtn>button:hover{ 
 	  background-color: rgb(18, 46, 81); 
    	  color : white; 
    } 
   
    .tuitionBtn>button.text{
    	  opacity: 0.5; 
    } 
   
    #boardList *{ 
 		text-align: center; 
 		vertical-align: middle;
     } 


</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content" >
       <div class="innerOuter">
      
      <div class="tuitionBtn" align="center";>
         <button class="selectTuitionbtn btn">등록금 내역 조회</button>
         <button class="paymentTuition btn" id="">등록금 납부 고지서</button>
      </div>
      <br><br><br>
      <h2>등록금 납부 내역 조회</h2>
      <br><br>
      
         <select name="semester" id="semester">
            <option value="">1학년 1학기</option>
            <option value="">1학년 2학기</option>
            <option value="">2학년 1학기</option>
            <option value="">2학년 2학기</option>
            <option value="">3학년 1학기</option>
            <option value="">3학년 2학기</option>
            <option value="">4학년 1학기</option>
            <option value="">4학년 2학기</option>
         </select>
         <button class="btn">조회</button>
      	<br><br>
      	
      	<table id="boardList" class="selectTuition table table-hover" align="center">
            <tr class="topMenu">
               <td>등록연도</td>
               <td>등록학기</td>
               <td>장학금 유형</td>
               <td>등록금</td>
               <td>장학금</td>
               <td>납입금</td>
            </tr>
            <tr>
               <td>2024</td>
               <td>1학기</td>
               <td>2유형</td>
               <td>4,000,000</td>
               <td>2,000,000</td>
               <td>2,000,000</td>
            </tr>
            <tr>
               <td>2024</td>
               <td>1학기</td>
               <td>2유형</td>
               <td>4,000,000</td>
               <td>2,000,000</td>
               <td>2,000,000</td>
            </tr>
         </table>
      
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>