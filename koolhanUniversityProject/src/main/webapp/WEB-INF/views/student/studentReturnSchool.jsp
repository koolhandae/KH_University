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
    }

    #boardList td{
        padding-left: 20px;
    }

    #btn {
    	border: 2px solid rgb(48, 76, 121); 
    	color: rgb(48, 76, 121);
    }

     #btn:hover{ 
 	  background-color: rgb(18, 46, 81); 
      color : white; 
    }

    .selectTuitionbtn{ 
   		height:70px; 
   		width:200px; 
   		margin-right: 100px; 
    }
   
    .paymentTuition{ 
   		height:70px; 
   		width:200px; 
    } 
    
    .tuitionBtn>button{ 
       display: flexbox; 
       font-size: 20px; 
	     border-radius: 13px;
       border: 2px solid rgb(48, 76, 121); 
       color: rgb(48, 76, 121);
    } 
    
    .tuitionBtn>button:hover{ 
 	  background-color: rgb(18, 46, 81); 
    	  color : white; 
    } 

    #takeOffDay{
      text-align: right;
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">	
   	<div class="innerOuter">
   	
   	<div class="tuitionBtn" align="center";>
         <button class="selectTuitionbtn btn">휴학 신청</button>
         <button class="paymentTuition btn" id="">복학 신청</button>
    </div>
      <br><br><br>
   	
   		<h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">휴학 신청서</h2>
   		<hr><br>

      <table id="boardList" class="selectTuition table" style="width: 900px;">
        <tr>
          <th>학부(과)</th>
          <td>컴퓨터 공학과</td>
          <th>학번</th>
          <td>2401010</td>
        </tr>

        <tr>
          <th>학년</th>
          <td>2</td>
          <th>성명</th>
          <td>김뫄뫄</td>
        </tr>

        <tr>
          <th>전화번호</th>
          <td colspan="3">010-1234-1234</td>
        </tr>
        
        <tr>
          <th>기간</th>
          <td id="takeOffDay" colspan="4">2024년도
            <select name="" id="">
              <option value="">1</option>
              <option value="">2</option>
            </select>학기부터
          </td>
        </tr>

        <tr>
          <td colspan="4">
              <div style="text-align: right;">
                <span>위와 같이 복학하고자 하오니 허가하여 주시길 바랍니다.</span>
              </div>
              <div style="margin-top: 10px; text-align: right;">
                2024년 4월 15일
              </div>
          </td>
        </tr>
      </table>
      
    
      <div class="btnbtn" align="center">
				<button class="btn btn-m" id="btn">조회</button>
	  </div>
   	
   	</div>  
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>