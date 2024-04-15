<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Forgot Password</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
    
    <!-- google rechapcha-->
	<script src="https://www.google.com/recaptcha/api.js"></script>

<title>Insert title here</title>
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
    .bg-password-image {
        background: url(https://source.unsplash.com/oWTW-jNGl9I/600x800);
        background-position: center;
        background-size: cover;
    }
    .h4{
        margin-top: 15px;
    }
       
    .user a{
        text-decoration: none;
    }
    #back-btn{
        margin-top: 30px;
        text-align: center;
        font-size: small;
    }
    #back-btn a{
        color: gray;
    }
    .bg-password-image {
        background: url(resources/images/forgotPassword.png);
        background-position: center;
        background-size: cover;
    }
    #g-recaptcha{
        margin: auto;
        display: table;
    }

	
</style>
</head>
<body class="bg-gradient-primary">

    <div class="container" style="min-width: 800px;">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">                    
                            <div class="col-lg-6">
                                <!--
                                <div class="p-5">
                                    <br><br>
                                    <div class="text-center">
                                        <img width="26" height="26" src="https://img.icons8.com/metro/26/737373/lock.png" alt="lock"/>
                                        <h1 class="h4 text-gray-900 mb-2">임시비밀번호 발급</h1>
                                        <p class="mb-4">메일로 임시비밀번호를 발송해드립니다</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="아이디(학번)을 입력해주세요">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이메일을 입력해주세요">
                                        </div>
                                      
                                        <div id="g-recaptcha" class="g-recaptcha" data-sitekey="6LcIX7opAAAAAMfUU33mcaDP-7AbkuQPTYu_ES15" data-callback="callBackRecaptcha"></div>
                                        <br>
                                        <a href="login.html" id="forgot-btn" class="btn btn-facebook btn-user btn-block">
                                            인증번호 전송
                                        </a>
                                        <div id="back-btn">
                                            <a href="#" onclick="history.back();" >이전으로</a>
                                        </div>

                                    </form>
                                    <br><br>
                                </div>
                                -->
                               
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">이메일을 성공적으로 보냈습니다!!</h1>
                                        <p class="mb-4">khuniversity@gmail.com</p>
                                        <p class="mb-4">메일을 확인해주세요</p>
                                        <img width="26" height="26" src="https://img.icons8.com/ios-filled/50/737373/secured-letter--v1.png" style="margin-top:-30px"/>
                                        <div id="back-btn">
                                            <a href="login.me">로그인페이지</a>
                                        </div> 
                                    </div>                              
                                </div>
                                

                            </div>
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script>
		function callBackRecaptcha(){
		    reCAPTCHA();
		}
	</script>	
		
		
	<script>
	$(function() {
		function reCAPTCHA() {
				$.ajax({
		            url: "rechapcha.do",
		            type: 'post',
		            data: {
		                recaptcha: $("#g-recaptcha-response").val()
		            },
		            success: function(data) {
		                switch (data) {
		                    case 0:
		                        console.log("자동 가입 방지 봇 통과");
		                        captcha = 0;
		                		break;
		                    case 1:
		                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
		                        break;
		                    default:
		                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
		                   		break;
		                }
		            }
		        });
				if(captcha != 0) {
					return false;
				} 
		}
	});
	</script>
</body>
</html>