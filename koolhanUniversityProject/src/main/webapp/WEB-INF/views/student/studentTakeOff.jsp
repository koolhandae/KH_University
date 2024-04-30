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
 	  background-color: rgb(48, 76, 121); 
      color : white; 
    }

    .selectTuitionbtn{ 
   		height:70px; 
   		width:200px; 
   		margin-right: 100px; 
    }
   

    #takeOffDay{
      text-align: right;
    }
    
     hr{
      width: 1000px;
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">	
   	<div class="innerOuter">
   	
   	<div class="tuitionBtn" align="center">
   		<a class="btn btn-primary btn-lg"  href="takeOff.do" roll="button" style="background-color:rgb(48, 76, 121)">휴학 신청</a>
   		   <span style="margin-left: 40px; margin-right: 40px;"></span>
   		<a class="btn btn-primary btn-lg"  href="returnSchool.do" roll="button" style="background-color:rgb(48, 76, 121)">복학 신청</a>
    </div>
      <br><br><br>
   	
   		<h2 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">휴학 신청서</h2>
   		<hr><br>
	
	<form action="takeOffForm.do">
	  
      <input type="hidden" name="absNo" value="${ loginStudent.studentNo }">
      <input type="hidden" name="absId" value="${ loginStudent.studentId }">
      <table id="boardList" class="selectTuition table" style="width: 900px; margin: auto;">
        <tr>
          <th>학부(과)</th>
          <td>컴퓨터 공학과</td>
          <th>학번</th>
          <td>${ loginStudent.studentId }</td>
        </tr>
        

        <tr>
          <th>학년</th>
          <td>3
          	<input type="hidden" name="absStart" value="1" />
          	<input type="hidden" name="absEnd" value="2" />
          </td>
          <th>성명</th>
          <td>${ loginStudent.studentName }</td>
        </tr>

        <tr>
          <th>전화번호</th>
          <td colspan="3">${ loginStudent.stPhone }</td>
        </tr>
        
        <tr>
          <th>주소</th>
          <td colspan="3">${ loginStudent.stAddress }</td>
        </tr>
        
        <tr>
          <th>기간</th>
          <td id="takeOffDay" colspan="3">2024년도 1학기부터
            <select name="absSemester">
              <option>2024</option>
              <option>2025</option>
              <option>2026</option>
            </select>년도 
            <select name="absGrade">
              <option>1</option>
              <option>2</option>
            </select>학기까지
          </td>
        </tr>

        <tr>
          <th>휴학구분</th>
          <td colspan="3">
              <input type="radio" name="absSort" id="normalRadio" value="a1"> 
              <label for="normalRadio">일반</label>
              
              <input type="radio" name="absSort" id="illnessRadio" value="a2"> 
              <label for="illnessRadio">질병</label>
              
              <input type="radio" name="absSort" id="childbirthRadio" value="a3"> 
              <label for="childbirthRadio">출산 및 육아</label>
              
              <input type="radio" name="absSort" id="militaryRadio" value="a4"> 
              <label for="militaryRadio">군입대</label>
          </td>
        </tr>
      
        <tr>
          <td colspan="4">
              <div style="text-align: right;">
                <span>위와 같이 휴학하고자 하오니 허가하여 주시길 바랍니다.</span>
              </div>
              <div style="margin-top: 10px; text-align: right;">
                 <% 
				    // 현재 날짜를 가져오는 코드
				    java.util.Date today = new java.util.Date();
				    
				    // 날짜를 원하는 형식으로 포맷팅
				    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy년 MM월 dd일");
				    String formattedDate = sdf.format(today);
				    
				    // 포맷팅된 날짜를 출력
				    out.print(formattedDate);
				  %>
              </div>
              </div>
          </td>
        </tr>
      </table>
      <div class="btnbtn" align="center">
		<button type="submit" class="btn btn-m" id="btn">신청하기</button>
	  </div>
    </form>

   	
   	
   	</div>  
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>