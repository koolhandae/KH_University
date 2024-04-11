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
	

   .topMenu{ 
 		background-color: rgb(48, 76, 121); 
       color : whitesmoke; 
      } 

/*    .innerOuter{ */
/*       height: 700px; */
/*    } */
   
    .selectTuitionbtn{ 
   		height:70px; 
   		width:250px; 
   		margin-right: 100px; 
    }
   
    .paymentTuition{ 
    		height:70px; 
    		width:250px; 
    } 
    
    #semester{
    	width: 150px;
    	height:40px;
    	margin-right:5px;
    }

     .tuitionBtn>button{ 
       display: flexbox; 
       font-size: 20px; 
	   border-radius: 13px;
       border: 2px solid rgb(48, 76, 121); 
       color: rgb(48, 76, 121);

       /* background-color: rgb(48, 76, 121);  */ 
    }  
    
    #btn {
    	border: 2px solid rgb(48, 76, 121); 
    	color: rgb(48, 76, 121);
    	border-radius: 5px;
    }
   
    .tuitionBtn>button:hover{ 
 	  background-color: rgb(18, 46, 81); 
    	  color : white; 
    } 
    
    #btn:hover{ 
 	  background-color: rgb(18, 46, 81); 
      color : white; 
    }     
   
    .tuitionBtn>button.text{
    	  opacity: 0.5; 
    } 
   
    #boardList *{ 
 		text-align: center; 
 		vertical-align: middle;
      pointer-events: none;
     } 
	
	.semesterArea{
		display: flex;
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
      <h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">등록금 납부 내역 조회</h2>
      <hr>
      <br>
      	
      	<div class="semesterArea">
         <select class="form-control" name="semester" id="semester">
            <option value="">1학년 1학기</option>
            <option value="">1학년 2학기</option>
            <option value="">2학년 1학기</option>
            <option value="">2학년 2학기</option>
            <option value="">3학년 1학기</option>
            <option value="">3학년 2학기</option>
            <option value="">4학년 1학기</option>
            <option value="">4학년 2학기</option>
         </select>
         <button class="btn btn-xs" id="btn">조회</button>
      	</div>
      	<br>
      	
      	<table id="boardList" class="selectTuition table table-hover" style="width: 800px;" align="center">
            <tr class="topMenu">
               <th>등록연도</th>
               <th>등록학기</th>
               <th>장학금 유형</th>
               <th>등록금</th>
               <th>장학금</th>
               <th>납입금</th>
            </tr>
            <tr>
               <td>2024</td>
               <td>1학기</td>
               <td>2유형</td>
               <td>4,000,000</td>
               <td>1,500,000</td>
               <td>2,500,000</td>
            </tr>
            <tr>
               <td>2024</td>
               <td>1학기</td>
               <td>2유형</td>
               <td>4,000,000</td>
               <td>1,500,000</td>
               <td>2,500,000</td>
            </tr>
         </table>
      
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>