<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <button class="btn btn-xs" id="btn"  onclick="requestPay()">결제하기</button>
      </div>
     <!-- </form> -->
     
     <script>
	    
	     
	     var IMP = window.IMP; // 생략가능
	     IMP.init('imp65641437');
	     
	  // IMP.request_pay(param, callback) 결제창 호출
	     IMP.request_pay({
	       pg: 'html5_inicis.INIpayTest',
	       pay_method: 'vbank',
	       merchant_uid: 'tpNo' + new Date().getTime(),   // 주문번호
	       name: '쿨한대학교',
	       amount: tuition,                         // 숫자 타입
	       buyer_email: ${loginStudent.stEmail},
	       buyer_name: ${loginStudent.studentName},
	       buyer_tel: ${loginStudent.stPhone},
	       buyer_addr: ${loginStudent.stAddress},
	       vbank_due: "YYYYMMDD",
	     },
	    	 period: {
			     from : "20240501",
			     to : "20240508",
	     },
	     function (rsp) { // callback
	       console.log(rsp);
	       if ( rsp.success ) { //결제 성공시
	         var msg = '등록금 납부가 완료 되었습니다.';
	         var result = {
	           "studentId" :${loginStudent.studentId}, //회원번호
	           "tuition": rsp.tuition, // 결제금액
	           "payDay" : new Date().toISOString().slice(0, 10), //결제일
	           "mpaytime" : "",
	           "trainername":"",
	         }
	         console.log(result);

	         $.ajax({
	           url:'tuitionPay.do',
	           type:'POST',
	           contentType: 'application/json',
	           data:JSON.stringify(result),
	           success: function (res) {
	             console.log(res);
	             location.href=res;
	           },
	           error: function (err) {
	             console.log(err);
	           }
	         }); //ajax
	       } else {
	           var msg = '결제 실패';
	           msg += '\n에러내용 : ' + rsp.error_msg;
	         }
	       alert(msg);
	     });
	  	
  		}
	  
	     /* //결제 데이터 전달
	     var selectedPrice = element.querySelector("p").innerText;
	     var priceElement = document.getElementById("selectedPrice").querySelector("span");
	     priceElement.innerText = selectedPrice;

	     var selectedProduct = element.querySelector("h5").innerText;
	     var productElement = document.getElementById("selectedProduct").querySelector("span");
	     productElement.innerText = selectedProduct; */
	   
	     	
	 </script>
     
   </div>  
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>