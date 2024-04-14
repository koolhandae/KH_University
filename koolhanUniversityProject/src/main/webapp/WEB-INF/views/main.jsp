<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <title>Insert title here</title>
    <!-- Custom fonts for this template-->
    
    <link
      href="resources/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet" />
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- icon -->
    <script src="https://kit.fontawesome.com/12b80a3a82.js" crossorigin="anonymous"></script>

	
<style>
	@font-face {
    font-family: 'KIMM_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	.container{
        padding-top: 8%;
		font-family: 'Pretendard-Regular';
    }
	.custom-control{
		padding-left: 4rem;
	}
    .bg-gradient-primary {
        background-image: linear-gradient(180deg, #1c4587 10%, #1c4587 100%);
        background-size: cover;
    }   
    .p-5 .h5{
        font-weight: 500;
        font-size:large;
    }
    .find-area{
    	padding-left: 35px;
    }
    .find-area .find_login{
		text-decoration: none;
        font-weight: 500;
        font-size: small;
        color: gray;
		text-align: right;
    }
	
</style>
</head>

<body class="bg-gradient-primary">

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
			<c:remove var="alertMsg" scope="session"/>
		</script>
	</c:if>
	
		<div class="container" style="min-width: 912px;">
			<!-- Outer Row -->
			<div class="row justify-content-center">
				<div class="col-xl-10 col-lg-12 col-md-9">
				  <div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-6">
									<img src="resources/images/login.png">
								</div>
								<div class="col-lg-6">
									<div class="p-5">
										<div class="text-center" style="font-family: 'KIMM_Bold'";>
											<div class="h5_logo">
												<img src="resources/images/logo.png" style="width:100px;">
											</div>
											<br>
											<h5 class="h5 text-gray-800 mb-2">쿨한대학교</h5>
											<h5 class="h5 text-gray-800 mb-4">컴퓨터공학과 학사정보시스템</h5>
										</div>
										<form class="user" action="login.me" method="post" id="loginForm">
											<div class="form-group">
												<input type="text" name="userId" class="form-control form-control-user"
													id="userId" aria-describedby="emailHelp"
													placeholder="학번을 입력해주세요" required>
											</div>
											<div class="form-group">
												<input type="password" name="userPwd" class="form-control form-control-user"
													id="userPwd" placeholder="비밀번호를 입력해주세요" required>
											</div>
											<div class="form-group" style="display: flex;">
												<div class="custom-control custom-checkbox small">
													<input type="checkbox" class="custom-control-input" id="customCheck">
													<label class="custom-control-label" for="customCheck">아이디/비밀번호 저장</label>
												</div>
												<div class="find-area">
													<i class="fa-solid fa-key"></i>
													<a class="find_login" href="forgot.me">학번/비밀번호 찾기</a>
												</div>
											</div>
											<button type="button" id="login-btn" onclick="loginProcess();" class="btn btn-facebook btn-user btn-block" >
												Login
											</button>
										</form>
										<hr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<script>
		
		// 페이지 로드시 저장된 쿠키값 읽어오기
		$(function(){
			  // 쿠키값 읽어오기
			  var cId = getCookie("cookie_id");
			  var cPwd = getCookie("cookie_pwd");
	
			  if(cId){
			    $("#userId").val(cId);
			    $("#userPwd").val(cPwd);
			    $("#customCheck").attr("checked", true);
			  }
		});

		function loginProcess(){
			var id = $("#userId").val();
			var pwd = $("#userPwd").val();
			var check = $("#customCheck").is(":checked"); // 체크박스가 체크되었는지확인 (true/false)
			
			if(id == ""){ // 아이디가 입력이 안된 채 로그인 버튼을 누른 경우
			    return false; // 서버이동을 막음
			    
			  }else if(pwd ==""){
			    return false;
			    
			  }else if(check){	// 아이디, 비밀번호 저장 체크박스가 체크 된 경우 (true)
			    setCookie("cookie_id", id, 7);	// 쿠키에 저장하는 이벤트 호출 , Cookie_mail 이름으로 id가 7일동안 저장
			    setCookie("cookie_pwd", pwd, 7);		
			  }else{ // 체크가 해제 된 경우 (false)
			    deleteCookie("cookie_id"); // 쿠키 정보를 지우는 이벤트 호출
			    deleteCookie("cookie_pwd");
			  }
			$("#loginForm").submit();		
			
		};
		
		
		// 쿠키값 저장하는 이벤트
		function setCookie(cookieName, value, exdays){
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + exdays);	// 쿠키 저장 기간
		  var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		  document.cookie = cookieName + "=" + cookieValue;
		}

		// 쿠키값 조회하는 이벤트
		function getCookie(cookieName) {
		  cookieName = cookieName + '=';
		  var cookieData = document.cookie;
		  var start = cookieData.indexOf(cookieName);
		  var cookieValue = '';
		  
		  if(start != -1){
		    start += cookieName.length;
		    var end = cookieData.indexOf(';', start);
		  if(end == -1)end = cookieData.length;
		  	cookieValue = cookieData.substring(start, end);
		  }
		  return unescape(cookieValue);
		}

		// 쿠키값 지우는 이벤트
		function deleteCookie(cookieName){
		  var expireDate = new Date();
		  expireDate.setDate(expireDate.getDate() - 1);
		  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		
		
	</script>

</body>
</html>
