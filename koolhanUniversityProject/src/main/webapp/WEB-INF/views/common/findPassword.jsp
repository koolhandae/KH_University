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
	
	<!-- sweetalert2 -->
	<script src="https://gcore.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.all.min.js"></script>
	<link href="https://gcore.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.min.css" rel="stylesheet">
	
	

<title>Insert title here</title>
<style>
    @font-face {
    font-family: 'KIMM_Bold';
    src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://gcore.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
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
    .h4{
        margin-top: 15px;
    }
       
    .user a{
        text-decoration: none;
    }
    #change-btn{
        width: -webkit-fill-available;
        display: flex;
        align-items: stretch;
        justify-content: space-evenly;
        margin: auto;
    }
    #changePwd tr> td{
        padding: 5px;
    }
    #changePwd tr>th{
        text-align: left;
        font-weight:500;
        padding-right: 30px;
    }
    #changePwd tr td input{
        border: solid 1px rgb(184, 184, 184);
        border-radius: 5px;
    }

</style>
</head>
<body class="bg-gradient-primary">

	<c:if test="${not empty alertMsg}">
		<script>
			$(function(){
		    	Swal.fire({
		    		icon: '${alertMsg.icon}',
		    		title: '${alertMsg.title}',
		    		text: '${alertMsg.text}',
		    	})
			});
	    </script>
	    <c:remove var="alertMsg" scope="session" />
	</c:if>

    <div class="container" style="min-width: 800px;">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div id="find-password">
                            <div class="text-center">
                                <br><br>
                                <h1 class="h3 text-gray-900 mb-2">비밀번호변경</h1>
                                <br>
                                <p style="font-size: small;">
                                    회원님의 개인정보를 안전하게 보호하고, 개인정보 도용으로 인한 피해를 예방하기 위해 비밀번호 변경을 권장하고 있습니다.
                                </p>
                                <br>
                                <form id="changePwdForm" action="changePwd.me">
                                    <input type="hidden" name="memberId" value="${targetId}">
                                	<table id="changePwd" style="margin: auto;">
                                        <tr>
                                            <th>* 새 비밀번호</th>
                                            <td>
                                                <input type="password" name="userPwd" id="userPwd" class="pwd">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>* 비밀번호 재확인</th>
                                            <td>
                                                <input type="password" name="userchkPwd" id="userchkPwd" class="pwd">
                                            </td>
                                        </tr>
                                        <tr style="display: none;" id="alertPwd">
                                            <td colspan=2 style="padding:10px;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 style="padding:30px;">
                                                <button type="submit" id="change-btn" class="btn btn-facebook btn-user btn-block" >
                                                변경하기
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                           </div>
                                <br><br>
                            </div>                              
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>

        $(function(){
            $('#userPwd').keyup(function(){
                 $("#alertPwd>td").text('');
            });

            $("#userchkPwd").keyup(function(){
                const userPwd = $("#userPwd").val();
                const userchkPwd = $("#userchkPwd").val();
                
                if(userPwd != "" && userchkPwd != ""){
                    if(userPwd != userchkPwd){
                        $("#alertPwd").show();
                        $("#alertPwd > td").text("바말번호가 일치하지 않습니다").css({"color":"red"});
                        $("#change-btn").attr("disabled", "disabled");

                    }else{
                        $("#alertPwd > td").text("바말번호 일치!").css({"color":"green"});
                        $("#change-btn").removeAttr("disabled");
                    }
                    
                }
            })
            
        })
       
    </script>
</body>
</html>