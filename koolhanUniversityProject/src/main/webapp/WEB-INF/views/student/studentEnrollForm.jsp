<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>학생 등록</h2>
            <br>

            <form action="insert.stu" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userName">* 이름 :</label>
                    <input type="text" class="form-control" id="studentName" name="studentName" placeholder="이름을 입력하세요" required><br>
                    
                    <label for="email"> &nbsp; * 이메일 :</label>
                    <div style="display:flex;">
                    <input type="email" class="form-control" id="email" name="stEmail" placeholder="이메일을 입력하세요" required>
                    &nbsp;
                    <input id="emailCheck" type="button" class="btn btn-secondary" value="이메일 확인">
                    </div>
                    <br>
                    
                    <label for="age"> &nbsp; * 주민등록번호 :</label>
                    <input type="text" class="form-control" id="memberSsn" name="studentSsn" placeholder="주민등록번호를 입력하세요( - 포함)" required><br>
                    
                    <label for="phone"> &nbsp; * 전화번호 :</label>
                    <input type="text" class="form-control" id="phone" name="stPhone" placeholder="전화번호를 입력하세요(- 포함)" required><br>
                    
                    <label for="address"> &nbsp; * 주소 :</label>
                    <div style="display:flex;">
	                    <input type="text" class="form-control" onclick="execDaumPostcode()" id="postcode" name="postcode" placeholder="우편번호" readonly>
						<input type="button" class="btn btn-secondary" onclick="execDaumPostcode()" value="우편번호 찾기" readonly>
                    </div>
					<input type="text" class="form-control" onclick="execDaumPostcode()" id="address" name="address" placeholder="주소" readonly>
                    <div style="display:flex;">
						<input type="text" class="form-control" id="detailAddress" name="detailAddress"placeholder="상세주소">
						<input type="text" class="form-control" onclick="execDaumPostcode()" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly>
                    </div>
					
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:470px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
					    // 우편번호 찾기 찾기 화면을 넣을 element
					    var element_wrap = document.getElementById('wrap');
					
					    function foldDaumPostcode() {
					        // iframe을 넣은 element를 안보이게 한다.
					        element_wrap.style.display = 'none';
					    }
					
					    function execDaumPostcode() {
					        // 현재 scroll 위치를 저장해놓는다.
					        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var addr = ''; // 주소 변수
					                var extraAddr = ''; // 참고항목 변수
					
					                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                    addr = data.roadAddress;
					                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                    addr = data.jibunAddress;
					                }
					
					                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					                if(data.userSelectedType === 'R'){
					                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있고, 공동주택일 경우 추가한다.
					                    if(data.buildingName !== '' && data.apartment === 'Y'){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                    if(extraAddr !== ''){
					                        extraAddr = ' (' + extraAddr + ')';
					                    }
					                    // 조합된 참고항목을 해당 필드에 넣는다.
					                    document.getElementById("extraAddress").value = extraAddr;
					                
					                } else {
					                    document.getElementById("extraAddress").value = '';
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('postcode').value = data.zonecode;
					                document.getElementById("address").value = addr;
					                // 커서를 상세주소 필드로 이동한다.
					                document.getElementById("detailAddress").focus();
					
					                // iframe을 넣은 element를 안보이게 한다.
					                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					                element_wrap.style.display = 'none';
					
					                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					                document.body.scrollTop = currentScroll;
					            },
					            width : '100%',
					            height : '100%'
					        }).embed(element_wrap);
					
					        // iframe을 넣은 element를 보이게 한다.
					        element_wrap.style.display = 'block';
					    }
					    
					    $("#emailCheck").click(function(){
					    	$.ajax({
					    		url:"verifyEmail.stu",
					    		data:{email:$("#email").val()},
					    		success:function(response){
					    			if(response === "NNNNY"){
					    				Swal.fire({
					    		    		icon: "success",
					    		    		title: "이메일 사용 가능",
					    		    		text: "사용 가능한 이메일 입니다.",
					    		    	});
					    				$("#enrollBtn").removeAttr("disabled");
					    				$("#email").attr("readonly", true);
					    				$("#emailCheck").val("이메일 수정하기");
					    			}else{
					    				Swal.fire({
					    		    		icon: "error",
					    		    		title: "이메일 사용 불가",
					    		    		text: "중복된 이메일 입니다.",
					    		    	});
					    				$("#email").select();
					    			}
					    		},
					    		error:function(){
					    			console.log($("#email").val());
					    			console.log("ajax tongsin silpae")
					    		},
					    	});
					    });
					</script>
					<br>
					
					<div class="btns" align="center">
	                    <button id="enrollBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
	                    <button type="reset" class="btn btn-danger"> 초기화</button>
	                </div>
        		</div>
	            </form>
	        </div>
	        
	      
	        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>