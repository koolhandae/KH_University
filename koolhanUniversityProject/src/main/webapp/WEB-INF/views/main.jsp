<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
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
    <script
      src="https://kit.fontawesome.com/12b80a3a82.js"
      crossorigin="anonymous"
    ></script>
    <style>
      .container {
        padding-top: 8%;
      }
      .custom-control {
        padding-left: 4rem;
      }
      .bg-gradient-primary {
        background-image: linear-gradient(180deg, #1c4587 10%, #1c4587 100%);
        background-size: cover;
      }
      .p-5 .h5 {
        font-weight: 1000;
        font-size: medium;
      }
      .find-area {
        padding-left: 35px;
      }
      .find-area .find_login {
        text-decoration: none;
        font-weight: 500;
        font-size: small;
        color: gray;
        text-align: right;
      }
    </style>
  </head>
  <body class="bg-gradient-primary">
    <div class="container" style="min-width: 912px">
      <!-- Outer Row -->
      <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
          <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
              <!-- Nested Row within Card Body -->
              <div class="row">
                <div class="col-lg-6">
                  <img src="resources/images/login.png" />
                </div>
                <div class="col-lg-6">
                  <div class="p-5">
                    <div class="text-center">
                      <div class="h5_logo">
                        <img
                          src="resources/images/logo.png"
                          style="width: 100px"
                        />
                      </div>
                      <br />
                      <h5 class="h5 text-gray-800 mb-2">쿨한대학교</h5>
                      <h5 class="h5 text-gray-800 mb-3">
                        컴퓨터공학과 학사정보시스템
                      </h5>
                    </div>
                    <form class="user">
                      <div class="form-group">
                        <input
                          type="email"
                          class="form-control form-control-user"
                          id="exampleInputEmail"
                          aria-describedby="emailHelp"
                          placeholder="학번을 입력해주세요"
                        />
                      </div>
                      <div class="form-group">
                        <input
                          type="password"
                          class="form-control form-control-user"
                          id="exampleInputPassword"
                          placeholder="비밀번호를 입력해주세요"
                        />
                      </div>
                      <div class="form-group" style="display: flex">
                        <div class="custom-control custom-checkbox small">
                          <input
                            type="checkbox"
                            class="custom-control-input"
                            id="customCheck"
                          />
                          <label class="custom-control-label" for="customCheck"
                            >Remember Me</label
                          >
                        </div>
                        <div class="find-area">
                          <i class="fa-solid fa-key"></i>
                          <a class="find_login" href="forgot-password.html"
                            >학번/비밀번호 찾기</a
                          >
                        </div>
                      </div>
                      <a
                        href="index.html"
                        class="btn btn-facebook btn-user btn-block"
                      >
                        Login
                      </a>
                    </form>
                    <hr />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:forward page="student/certificateIssuingPage.jsp" />
    <jsp:include page="common/header_with_sidebar.jsp" />
    <jsp:include page="common/test.jsp" />
    <jsp:include page="common/footer.jsp" />
  </body>
</html>
