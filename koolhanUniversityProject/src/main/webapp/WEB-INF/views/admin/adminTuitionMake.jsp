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
    }  

    #boardList{
        width: 900px;
    }

	#borderList>tr{
		border-bottom: 1px;
		border-color: rgb(75,75,75);
	}
	
	 .searchArea{
        float: right;
        padding-right: 150px;
    }
    
    .searchArea {
        display: inline-block;
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

			<h1 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">등록금 고지서 발급</h1>
			<h5 style="margin-left: 290px;">2024년도 1학기</h5>
            <hr>
			<br>
			<br>

        <div class="searchArea">
            <input type="text" name="search" id="search" placeholder="전체 또는 학번을 입력해주세요">
            <button class="btn" id="btn">검색</button>
        </div>
			<br><br>
<!-- 		<form action="tuitionMakeSelect.ad"> -->
			<input type="hidden" name="search" value="${ search.val() }">
			<input type="hidden" name="studentId" value="${ loginStudent.studentId }">
			<table id="boardList" class="table table-hover" align="center">
				<tr>
					<th>학부(과)</th>
					<td colspan="3">컴퓨터공학과</td>
				</tr>

				<tr>
					<th>학번</th>
					<td>
						<div id="studentId">${ atList.studentId }</div>
					</td>
					<th>성명</th>
					<td>
						<div id="studentName">${ atList.studentName }</div>
					</td>
				</tr>

                <tr>
					<th>등록금</th>
					<td>
						<input type="number" name="tbPrice" min="0">
					</td>
					<th>학기</th>
					<td>3학년 1학기</td>
				</tr>

				<tr>
					<th>납부 금액</th>
					<td>
						<input type="number" name="totalPrice" min="0">
					</td>
					<th>장학금</th>
					<td id="scholarship" name="scholarship">
						${ atList.scholarship }
					</td>
				</tr>

				<tr>
					<th>납부기간</th>
					<td colspan="3" align="right">
						<input type="date" name="tbDue" value="tbDue">
						까지 납부
					</td>
				</tr>
			</table>

			<br>

			<div class="billBtn" style="display: flex">
				<button class="btn btn-xs" id="btn">고지서 생성</button>
			</div>
<!-- 		</form> -->
		</div>
		
		<script>
			$(function(){
				$("#search").click(function(){
					$.ajax({
						url:"tuitionMake.ad",
						data:{
 							id:${"#studentId"}.val(),
							name:${"#studentName"}.val(),
							price:${"#tbPrice"}.val(),
							scholarship:${"#scholarship"}.val()
							date:${"#tbDue"}.val()
						}, success:function(result){
							console.log("ajax : " + result);
						}, error:function(){
							console.log("ajax통신 실패!");
						}
					})
				})
			})
			
		</script>
		
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>