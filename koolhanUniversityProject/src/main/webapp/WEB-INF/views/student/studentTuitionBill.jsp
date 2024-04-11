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

     #btn:hover{ 
 	  background-color: rgb(18, 46, 81); 
      color : white; 
    }

    .billBtn>button{
        margin: auto;
    }
    
    .selectTuitionbtn{ 
   		height:70px; 
   		width:250px; 
   		margin-right: 100px; 
    }
   
    .paymentTuition{ 
   		height:70px; 
   		width:250px; 
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

    #boardList th{
        background-color: rgb(48, 76, 121);
        color: white;
        text-align: center;
    }

    #boardList td{
        padding-left: 30px;
        pointer-events: none;
    }

    #boardList{
        width: 800px;
        pointer-events: none;
    }


</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
	<div class="content">
		<div class="innerOuter">
			<div class="tuitionBtn" align="center";>
				<button class="selectTuitionbtn btn">등록금 내역 조회</button>
				<button class="paymentTuition btn" id="">등록금 납부 고지서</button>
			</div>
			<br><br><br>
			<h1 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">등록금 고지서</h1>
			<h5 style="margin-left: 45px;">2024년도 1학기</h5>
            <hr>
			<br>
			<br>
			<table id="boardList" class="table table-hover" align="center" border="1" black>
				<tr>
					<th>학부(과)</th>
					<td colspan="3">컴퓨터공학과</td>
				</tr>

				<tr>
					<th>학번</th>
					<td>2402020</td>
					<th>성명</th>
					<td>김뫄뫄</td>
				</tr>

                <tr>
					<th>등록금</th>
					<td colspan="3">4,000,000</td>
				</tr>

				<tr>
					<th>납입 금액</th>
					<td>2,500,000</td>
					<th>장학금</th>
					<td>1,500,000</td>
				</tr>

				<tr>
					<th>납부기간</th>
					<td colspan="3" align="center">24.04.11 (목) ~ 24.05.02 (목)</td>
				</tr>
			</table>

			<br>

			<div class="billBtn" style="display: flex">
				<button class="btn btn-xs" id="btn">납부하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>