<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

		<head>


			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
			<!-- 다음 주소 -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<!-- 구글 제이쿼리 스니펫 -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
			<!-- 부트스트랩 JS CSS -->
			<!-- Popper JS -->
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
				integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
				crossorigin="anonymous"></script>

			<script src="https://kit.fontawesome.com/12b80a3a82.js" crossorigin="anonymous"></script>
			<!-- Custom styles for this template-->
			<link href="resources/css/sb-admin-2.css" rel="stylesheet">

			<!-- sweetalert2 -->
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.all.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.min.css" rel="stylesheet">

<style>
	/* 폰트 */
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

	body {
		font-family: 'Pretendard-Regular';
	}

	.bg-gradient-primary {
		/* background-color:#4e73df; */
		background-image: linear-gradient(180deg, #1c4587 10%, #1c4587 100%);
		background-size: cover;
	}
</style>
</head>

<body id="page-top">

			<c:if test="${not empty alertMsg}">
				<script>
					$(function () {
						Swal.fire({
							icon: '${alertMsg.icon}',
							title: '${alertMsg.title}',
							text: '${alertMsg.text}',
						})
					});
				</script>
				<c:remove var="alertMsg" scope="session" />
			</c:if>


	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" style="height: 150px"
				href="mainPage.me">
				<div class="sidebar-brand-icon">
					<img style="width:100px;" src="resources/images/logo.png" alt="">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="mainPage.me">
						<div class="sidebar-brand-text mx-3">KH University<sup></sup></div>
					</a>
					<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="mypage.go">
								<i class="fa-solid fa-user"></i>
								<span>회원 정보 조회</span></a>
						</li>
					
					<c:if test="${ not empty loginStudent }">
						<!-- Divider -->
						<hr class="sidebar-divider">

						<!-- Nav Item - Pages Collapse Menu -->
						<li class="nav-item">
							<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<i class="fa-solid fa-book-open-reader"></i>
								<span>나의 강의실</span>
							</a>
							<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
								data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<a class="collapse-item" href="#">나의 시간표</a>
									<a class="collapse-item" href="showCourse.st">나의 수강 조회</a>
									<a class="collapse-item" href="#">이전 수강 내역 조회</a>
								</div>
							</div>
						</li>
						<!-- Nav Item - Utilities Collapse Menu -->
						<li class="nav-item">
							<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="true" aria-controls="collapseTwo">
								<i class="fa-solid fa-id-card"></i>
								<span>마이페이지</span>
							</a>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
								data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<a class="collapse-item" href="update.stu">개인 정보 수정</a>
									<a class="collapse-item" href="#">나의 캘린더</a>
									<a class="collapse-item" href="tuitionBill.do">등록금 납부 신청</a>
									<a class="collapse-item" href="">등록금 납부 내역 조회</a>
									<a class="collapse-item" href="#">학점 / 성적 조회</a>
									<a class="collapse-item" href="takeOff.do">휴 · 복학 신청</a>
									<a class="collapse-item" href="takeOffSelect.do">휴 · 복학 신청 조회</a>
									<a class="collapse-item" href="certificate.issue">증명서 발급</a>
								</div>
							</div>
						</li>
					</c:if>

			<c:if test="${ not empty loginUser and loginUser.meType eq 'A' }">
				<!-- Divider -->
				<hr class="sidebar-divider">
	
						<!-- Nav Item - Pages Collapse Menu -->
						<li class="nav-item">
							<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse2"
								aria-expanded="true" aria-controls="collapse2">
								<i class="fa-solid fa-address-book"></i>
								<span>교직원 / 학생 등록</span>
							</a>
							<div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
								<div class="bg-white py-2 collapse-inner rounded">
									<a class="collapse-item" href="insertForm.stu">학생 등록</a>
									<a class="collapse-item" href="insertForm.me">교직원 등록</a>
								</div>
							</div>
						</li>
	
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="insertForm.no">
								<i class="fa-solid fa-bullhorn"></i>
								<span>공지사항 등록</span></a>
						</li>
						
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="tuitionMake.ad">
								<i class="fa-solid fa-bullhorn"></i>
								<span>등록금 고지서 생성</span></a>
						</li>	
						
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="tuitionIssu.ad">
								<i class="fa-solid fa-bullhorn"></i>
								<span>등록금 고지서 발급</span></a>
						</li>	
						
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="admintakeOffSelect.me">
								<i class="fa-solid fa-bullhorn"></i>
								<span>휴학 신청서 조회</span></a>
						</li>
	
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
						aria-expanded="true" aria-controls="collapsePages">
						<i class="fa-solid fa-chart-line"></i>
						<span>통계</span>
					</a>
					<div id="collapsePages" class="collapse" aria-labelledby="headingPages"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="#">학생 통계</a>
							<a class="collapse-item" href="#">교직원 통계</a>
						</div>
					</div>
				</li>
			</c:if>
		  <c:if test="${ not empty loginUser and loginUser.meType eq 'P' }">
          <!-- Divider -->
          <hr class="sidebar-divider d-none d-md-block">
          
          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
                  aria-expanded="true" aria-controls="collapseFour">
                  <i class="fa-solid fa-book-open-reader"></i>
                  <span>나의 강의실</span>
              </a>
              <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                      <a class="collapse-item" href="classEnroll.co">강의 등록</a>
                      <a class="collapse-item" href="classList.bo">강의 관리</a>
                  </div>
              </div>
          </li>

	<!-- Nav Item - Charts -->
		<li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSeven"
                  aria-expanded="true" aria-controls="collapseFour">
                  <i class="fa-solid fa-check-to-slot"></i>
                  <span>과제</span>
              </a>
              <div id="collapseSeven" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                      <a class="collapse-item" href="professorPJEnrollForm.do">과제 등록</a>
                      <a class="collapse-item" href="professorPJStateList.do">과제 현황</a>
                  </div>
              </div>
          </li>
          
          <!-- Nav Item - Charts -->
          <li class="nav-item">
              <a class="nav-link" href="professorGDEnroll.do">
                  <i class="fa-solid fa-file-pen"></i>
                  <span>성적 등록</span></a>
          </li>
		  </c:if>
          
          <!-- Divider -->
          <hr class="sidebar-divider">
          
          <!-- Heading -->
          <div class="sidebar-heading">
              <h4>공통사항</h4>
          </div>
          
          <!-- Nav Item - Charts -->
          <li class="nav-item">
              <a class="nav-link" href="#">
                  <i class="fa-solid fa-users"></i>
                  <span>커뮤니티 게시판</span></a>
          </li>
          
          <!-- Nav Item - Charts -->
          <li class="nav-item">
              <a class="nav-link" href="library.go">
                  <i class="fa-solid fa-book-bookmark" ></i>
                  <span>중앙 도서관</span></a>
          </li>
          
          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
                  aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fa-solid fa-paper-plane"></i>
                  <span>쪽지함</span>
              </a>
              <div id="collapseFive" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                      <a class="collapse-item" href="#">쪽지 보내기</a>
                      <a class="collapse-item" href="#">받은 쪽지함</a>
                  </div>
              </div>
          </li>
          
          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix"
                  aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fa-solid fa-dove"></i>
                  <span>소식</span>
              </a>
              <div id="collapseSix" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                      <a class="collapse-item" href="list.no">공지사항</a>
                      <a class="collapse-item" href="#">학사일정</a>
                      <a class="collapse-item" href="busApiForm.do">셔틀버스 안내</a>
                      <a class="collapse-item" href="#">관련 취업 정보</a>
                  </div>
              </div>
          </li>
          
          
          
          <!-- Sidebar Toggler (Sidebar) -->
          <div class="text-center d-none d-md-inline">
              <button class="rounded-circle border-0" id="sidebarToggle"></button>
          </div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="궁금한걸 검색하세요! ⌕ " aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none">
							<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-search fa-fw"></i>
							</a>
							<!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-bell fa-fw"></i>
								<!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">543+</span>
							</a>
							<!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">
									Alerts Center
								</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is ready to
											download!</span>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your account.
									</div>
								</a>
								<a class="dropdown-item text-center small text-gray-500" href="#">Show All
									Alerts</a>
							</div>
						</li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages -->
								<span class="badge badge-danger badge-counter">7</span>
							</a>
							<!-- Dropdown - Messages -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">
									Message Center
								</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="resources/images/undraw_profile_1.svg"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if you can help me
											with a
											problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="resources/images/undraw_profile_2.svg"
											alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you ordered last
											month, how
											would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="resources/images/undraw_profile_3.svg"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks great, I am very
											happy with
											the progress so far, keep up the good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I ask is because
											someone
											told me that people say this to all dogs, even if they aren't
											good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a>
								<a class="dropdown-item text-center small text-gray-500" href="#">Read More
									Messages</a>
							</div>
						</li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<c:if test="${not empty loginUser or not empty loginStudent}">

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<c:choose>
										<c:when
											test="${ not empty loginUser and loginUser.memberId ne 'admin'}">
											<span class="mr-2 d-none d-lg-inline text-gray-600 small">${
												loginUser.memberName } 교수</span>
										</c:when>
										<c:when
											test="${ not empty loginUser and loginUser.memberName eq 'admin'}">
											<span class="mr-2 d-none d-lg-inline text-gray-600 small">${
												loginUser.memberName }님</span>
										</c:when>
										<c:when test="${ not empty loginStudent and empty loginUser }">
											<span class="mr-2 d-none d-lg-inline text-gray-600 small">${
												loginStudent.studentName }님</span>
										</c:when>
									</c:choose>
									<img class="img-profile rounded-circle"
										src="resources/images/undraw_profile.svg">
								</a>
								<!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="mypage.go"> <!-- 여기에 마이페이지 링크 걸기-->
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
										마이페이지
									</a>
									<a class="dropdown-item updateInfo" href="#">
										<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										회원 정보 수정
									</a>
<!-- 									<a class="dropdown-item" href="#"> -->
<!-- 										<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> -->
<!-- 										마찬가지로 다른 무엇인가 넣을 수 있다. -->
<!-- 									</a> -->
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal"
										data-target="#logoutModal">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										로그아웃
									</a>
								</div>
							</li>
						</c:if>

					</ul>

				</nav>
				<!-- End of Topbar -->


				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top">
					<i class="fas fa-angle-up"></i>
				</a>

				<!-- Logout Modal-->
				<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
								<button class="close" type="button" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">아래 로그아웃 버튼을 누르면 로그아웃 됩니다.</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button"
									data-dismiss="modal">Cancel</button>
								<a class="btn btn-primary" href="logout.me">로그아웃</a>
							</div>
						</div>
					</div>
				</div>


				<!-- Bootstrap core JavaScript-->
				<script src="resources/js/jquery.js"></script>
				<script src="resources/js/bootstrap.bundle.js"></script>



				<!-- Custom scripts for all pages-->
				<script src="resources/js/sb-admin-2.js"></script>

				<!-- Core plugin JavaScript-->
				<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

			<script>
            	$(function(){
            		let type = '${loginUser.meType}';
            		$(".updateInfo").click(function(){
            			switch(type){
            			case "" : 
            				location.href="update.stu";
            				break;
           				default: 
           					location.href="update.me";
           					break;
            			}
            		})
            	})
            </script>


</body>

</html>