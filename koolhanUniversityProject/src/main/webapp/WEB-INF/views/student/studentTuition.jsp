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
		padding-left: 150px;
	}
	
	hr{
		width: 1000px;
	}

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content" >
       <div class="innerOuter">
      
    	<div class="tuitionBtn" align="center";>
	   		<a class="btn btn-primary btn-lg"  href="tuitionBill.do" roll="button" style="background-color:rgb(48, 76, 121)">등록금 납부 고지서</a>
	   		   <span style="margin-left: 40px; margin-right: 40px;"></span>
	   		<a class="btn btn-primary btn-lg"  href="tuitionPay.do" roll="button" style="background-color:rgb(48, 76, 121)">등록금 내역 조회</a>  	
	    </div>
		<br><br><br>
      <h2 style="margin-left: 150px; font-weight:900; color: rgb(75,75,75);">등록금 납부 내역 조회</h2>
      <hr>
      <br>
      	
<!--       	<div class="semesterArea">
         <select class="form-control" name="termNo" id="semester">
         	<option value="total">전체</option>
            <option value="1_1">1학년 1학기</option>
            <option value="1_2">1학년 2학기</option>
            <option value="2_1">2학년 1학기</option>
            <option value="2_2">2학년 2학기</option>
            <option value="3_1">3학년 1학기</option>
            <option value="3_2">3학년 2학기</option>
            <option value="4_1">4학년 1학기</option>
            <option value="4_2">4학년 2학기</option>
         </select>
         <button class="btn btn-xs" id="btn">조회</button>
      	</div>
      	<br> -->
      	
      		<input type="hidden" name="studentId" value="${ loginStudent.studentId }" >
      	<table id="boardList" class="selectTuition table table-hover" style="width: 900px;" align="center">
            <tr class="topMenu">
               <th>등록연도</th>
               <th>등록학기</th>
               <th>등록금</th>
               <th>장학금</th>
               <th>납부금</th>
               <th>납부구분</th>
               <th>납부일자</th>
            </tr>
             <tr>
               <td>2024년</td>
               <td>1학기</td>
               <td>1,234,567</td>
               <td>617,283</td>
               <td>617,283</td>
               <td>납부완료</td>
               <td>2024-05-02</td>
            </tr>
            <tr>
               <td>2023년</td>
               <td>2학기</td>
               <td>3,800,000</td>
               <td>0</td>
               <td>3,800,000</td>
               <td>납부완료</td>
               <td>2023-08-29</td>
            </tr>
         </table>
      
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>