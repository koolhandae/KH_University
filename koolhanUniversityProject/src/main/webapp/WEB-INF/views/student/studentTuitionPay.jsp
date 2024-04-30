<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
    
  hr{
  	  width: 1000px;
    }
  
  h3{
  	margin-left: 290px;
  }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   <div class="innerOuter">
   	  <h1 style="margin-left: 290px; font-weight:900; color: rgb(75,75,75);">등록금 납부</h1>
   	  <hr><br>
   	  	
   	  <!-- <form action="tuitionPay.do"> -->
   		<h3>학생 정보</h3>
   		<table id="boardList" class="selectTuition table" style="width: 900px;" align="center">
   			
        <tr>
          <th>이름</th>
          <td>${ loginStudent.studentName }</td>
          <th>학번</th>
          <td>${ loginStudent.studentId }</td>
        </tr>
        <tr>
          <th>학부(과)</th>
          <td colspan="3" style="border-bottom: 1px solid rgb(230, 230, 230);">쿨한대학교 컴퓨터공학과</td>
        </tr>
   		</table>
   	  <br>
      <h3>등록금 납입 정보</h3>
      <table id="boardList" class="selectTuition table" style="width: 900px; border-bottom: 1px solid rgb(230, 230, 230);" align="center">
       <c:forEach var="l" items="${ list }">
        <tr>
          <th>등록금</th>
          <td>${ l.tuition }</td>
          <th>장학금</th>
          <td>${ l.scholarship }</td>
        </tr>
        <tr>
          <th style="font-size: 20px;">총 납부금</th>
          <td class="amount" colspan="3" style="font-size: 20px; font-weight: bold;">${ l.tuition - l.scholarship }</td>
        </tr>
       </c:forEach>
      </table>
      <br>
<!--       <table id="boardList" class="selectTuition table" style="width: 900px;" align="center">
        <tr>
          <td>
            <input type="radio" name="radioBtn" value="kakao"> 카카오페이
            <input type="radio" name="radioBtn" value="toss"> 토스페이
            <input type="radio" name="radioBtn" value="moo"> 무통장입금
          </td>
        </tr>
      </table>
      <br><br> -->
      <div class="billBtn" style="display: flex">
        <button class="btn btn-xs" id="btn"  onclick="requestPay();">결제하기</button>
      </div>
     <!-- </form> -->
     
      <script>
      
      	let amount = $(".amount").text();
      	// console.log(amount);

      	
        IMP.init("imp65641437"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '등록금',
                amount : amount,
                buyer_email : '${ loginStudent.stEmail }',
                buyer_name : '${ loginStudent.studentName }',
                buyer_tel : '${ loginStudent.stPhone }',
                buyer_addr : '${ loginStudent.stAddress }'
               // buyer_postcode : '123-456'
            },function(res) {
                $.ajax({
                    type : "POST",
                    url : "tuitionPay.do"
                }).done(function(data) {
                    if(res.success){
                    		Swal.fire({
          	                 icon: 'success',
          	                 text: '등록금 납부가 완료 되었습니다.'});

                        //결제 성공 시 비즈니스 로직
                        
                    } else {
                        alert("결제 실패");
                    }
                });
            });
            
        }
        
        
    </script>
     
   </div>  
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>