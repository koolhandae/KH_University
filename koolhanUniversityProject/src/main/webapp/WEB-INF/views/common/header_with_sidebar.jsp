<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>


			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

			<!-- sockjs -->
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<style>
				.pagination {
					justify-content: center;
				}

				.pagination.pagination-rounded-flat .page-item .page-link,
				a {
					border: none;
					border-radius: 50px;
				}

				.page-link:active {
					background-color: #1c4587 !important;
					color: white !important;
				}

				.active {
					background-color: #1c4587 !important;
					color: white !important;
				}

				li {
					margin: 3px
				}

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
			<div id="socketAlert" class="alert alert alert-success" role="alert" style="display:none;"></div>

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
					<c:if test="${loginUser.meType eq 'A' }">
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="userList.go">
								<i class="fa-solid fa-user"></i>
								<span>전체 회원 정보 조회</span></a>
						</li>
					</c:if>

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
									<a class="collapse-item" href="myCalender.st">나의 시간표</a>
									<a class="collapse-item" href="showCourse.st">나의 수강 조회</a>
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
									<a class="collapse-item" href="myCalender.do">나의 캘린더</a>
									<a class="collapse-item" href="tuitionBill.do">등록금 납부 신청</a>
									<a class="collapse-item" href="tuitionPay.do">등록금 납부 내역 조회</a>
									<a class="collapse-item" href="courseScore.st">학점 / 성적 조회</a>
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
							<div id="collapse2" class="collapse" aria-labelledby="heading2"
								data-parent="#accordionSidebar">
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
							<div id="collapseFour" class="collapse" aria-labelledby="headingFour"
								data-parent="#accordionSidebar">
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
							<div id="collapseSeven" class="collapse" aria-labelledby="headingFour"
								data-parent="#accordionSidebar">
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

					<c:if test="${not empty loginStudent}">
						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="list.bo">
								<i class="fa-solid fa-users"></i>
								<span>커뮤니티 게시판</span></a>
						</li>

						<!-- Nav Item - Charts -->
						<li class="nav-item">
							<a class="nav-link" href="library.go">
								<i class="fa-solid fa-book-bookmark"></i>
								<span>중앙 도서관</span></a>
						</li>
					</c:if>

					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item">
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix"
							aria-expanded="true" aria-controls="collapseTwo">
							<i class="fa-solid fa-dove"></i>
							<span>소식</span>
						</a>
						<div id="collapseSix" class="collapse" aria-labelledby="headingTwo"
							data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<a class="collapse-item" href="list.no">공지사항</a>
								<a class="collapse-item" href="busApiForm.do">셔틀버스 안내</a>
								<a class="collapse-item" href="job.do">관련 취업 정보</a>
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
										placeholder="궁금한걸 검색하세요! ⌕ " aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>

							<!-- 날씨정보 div -->
							<div>
								<div id="weatherDiv" style="display:flex;flex-direction: row; align-items: center;">
									<input type="hidden" id="seoul" value="서울">

									<div style="padding-left:500px;">

									</div>
									<div>
										<h5 style="margin:2px; font-size: 15px;">강남구</h5>
										<span style="margin:2px" id="ondo"></span>
									</div>

									<div>
										ㅣ
									</div>

									<div>
										<table>
											<thead>
												<tr>
													<td><span style="font-size: 13px;  line-height:0;">미세먼지</span></td>
													<td><span id="mise"
															style="font-size: 13px;  line-height:none;"></span></td>
												</tr>
												<tr>
													<td><span style="font-size: 13px;  line-height:0;">대기환경지수</span>
													</td>
													<td><span id="daegi"
															style="font-size: 13px;  line-height:none;"></span></td>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
							<!-- 날씨정보 div -->

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

								<div class="topbar-divider d-none d-sm-block"></div>

								<c:if test="${not empty loginUser or not empty loginStudent}">

									<!-- Nav Item - User Information -->
									<li class="nav-item dropdown no-arrow">
										<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
											data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<c:choose>
												<c:when
													test="${ not empty loginUser and loginUser.memberId ne 'admin'}">
													<span
														class="mr-2 d-none d-lg-inline text-gray-600 small">${loginUser.memberName
														} 교수</span>
													<c:choose>
														<c:when test="${empty loginUser.changeName}">
															<img class="img-profile rounded-circle"
																src="resources/images/default_user.png">
														</c:when>
														<c:otherwise>
															<img class="img-profile rounded-circle"
																src="${loginUser.changeName}">
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when
													test="${ not empty loginUser and loginUser.memberName eq 'admin'}">
													<span
														class="mr-2 d-none d-lg-inline text-gray-600 small">${loginUser.memberName
														}님</span>
													<c:choose>
														<c:when test="${empty loginUser.changeName}">
															<img class="img-profile rounded-circle"
																src="resources/images/default_user.png">
														</c:when>
														<c:otherwise>
															<img class="img-profile rounded-circle"
																src="${loginUser.changeName}">
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${ not empty loginStudent and empty loginUser }">
													<span
														class="mr-2 d-none d-lg-inline text-gray-600 small">${loginStudent.studentName
														}님</span>
													<c:choose>
														<c:when test="${empty loginStudent.changeName}">
															<img class="img-profile rounded-circle"
																src="resources/images/default_user.png">
														</c:when>
														<c:otherwise>
															<img class="img-profile rounded-circle"
																src="${loginStudent.changeName}">
														</c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
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


						<script>
							var socket = null;

							$(function () {
								connectWS();
							})




							function connectWS() {
								//이벤트핸들러 이벤트리스너~
								//커넥션이 연결됏을때 이걸 탐
								//그래서 보통은 onmessage랑 onclose랑 onerror는 커넥션이 된 곳으로 들어가는게 좋음 여기!
								var ws = new WebSocket("ws://localhost:8808/khu/echo");
								socket = ws;
								ws.onopen = function (event) {
									console.log("WebSocket 연결 성공");

									//ws.onmessage = function(event) {
									//  console.log("서버로부터 메시지 수신: " + event.data);
									// };// 여기넣는게 원칙! 커넥션도 안됐는데 메세지를 받을 수는 없을테니까
									//이렇게 해도 되고 아까처럼 해도되고 상관은 없음
								};

								ws.onmessage = function (event) {
									console.log(event);
									console.log("서버로부터 메시지 수신: " + event.data);
									//let socketAlert = $("#socketAlert".val());
									let $socketAlert = $("#socketAlert");
									$socketAlert.html(event.data);
									$socketAlert.css('display', 'block');
									//socket.send(event.data);
								};



								ws.onclose = function (event) {
									console.log("WebSocket 연결 종료");
								};
								ws.onerror = function (err) { console.log('Error:', err); };


							}
							// 필요에 따라 메시지를 서버로 전송할 수 있습니다.
							function sendMessage(message) {
								ws.send(message);
							}
						</script>


						<!-- 날씨받는 script -->
						<script>
							$(function () {
								let seoul = $("#seoul").val();
								//json형식으로 응답받기
								$.ajax({
									url: "air.do",
									data: { seoul: seoul },
									success: function (data) {
										//console.log(data)
										//console.log(data.response.body.items)
										const itemArr = data.response.body.items

										const filteredItems = itemArr.filter(item => item.stationName === "강남구"); //강남구인것만 뽑아오게 필터링
										let item = (filteredItems[0]);
										let mise = Number(item.khaiValue);
										let daegi = Number(item.pm10Value);

										if (mise >= 0 && mise <= 30) {
											$("#mise").text("좋음").css("color", "#32a1ff");
										} else if (mise >= 31 && mise <= 80) {
											$("#mise").text("보통").css("color", "#00c73c");
										} else if (mise >= 81 && mise <= 150) {
											$("#mise").text("나쁨").css("color", "#fd9b5a");
										} else if (mise >= 151) {
											$("#mise").text("매우나쁨").css("color", "#ff5959");
										}

										if (daegi >= 0 && daegi <= 30) {
											$("#daegi").text("좋음").css("color", "#32a1ff");
										} else if (daegi >= 31 && daegi <= 80) {
											$("#daegi").text("보통").css("color", "#00c73c");
										} else if (daegi >= 81 && daegi <= 150) {
											$("#daegi").text("나쁨").css("color", "#fd9b5a");
										} else if (daegi >= 151) {
											$("#daegi").text("매우나쁨").css("color", "#ff5959");
										}
									}, error: function () {

									}
								})
							})
						</script>
						<!-- 날씨받는 script -->

						<script>


							$(function () {

								let today = new Date();
								//console.log(today);
								// 결과 : Thu Apr 25 2024 21:42:20 GMT+0900 (한국 표준시)
								let year = today.getFullYear();
								let month = ('0' + (today.getMonth() + 1)).slice(-2);
								let day = ('0' + today.getDate()).slice(-2);

								var dateString = year + month + day;
								console.log(dateString);
								// 결과 : 20240425

								let hours = ('0' + today.getHours()).slice(-2);
								let minutes = ('0' + today.getMinutes()).slice(-2);
								let hoursMin = hours + minutes;
								let baseTime = "";
								// 결과 : 21
								// Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
								if (hoursMin >= 2300 && hoursMin <= 159) {
									baseTime = "2300";
								} else if (hoursMin >= 200 && hoursMin <= 459) {
									baseTime = "0200";
								} else if (hoursMin >= 500 && hoursMin <= 759) {
									baseTime = "0500";
								} else if (hoursMin >= 800 && hoursMin <= 1059) {
									baseTime = "0800";
								} else if (hoursMin >= 1100 && hoursMin <= 1359) {
									baseTime = "1100";
								} else if (hoursMin >= 1400 && hoursMin <= 1659) {
									baseTime = "1400";
								} else if (hoursMin >= 1700 && hoursMin <= 1959) {
									baseTime = "1700";
								} else if (hoursMin >= 2000 && hoursMin <= 2259) {
									baseTime = "2000";
								}
								console.log(baseTime)
								$.ajax({
									url: "ondo.do",
									data: {
										dateString: dateString,
										baseTime: baseTime
									},
									success: function (ondo) {

										let item = ondo.response.body.items.item;
										//console.log(item);
										let tmp = "";


										for (let i = 0; i < item.length; i++) {
											//console.log(item[i]);
											if (item[i].category === "TMP") {
												tmp = item[i].fcstValue;
												break; // category가 "TMP"인 경우를 찾으면 반복문을 종료합니다.
											}
										}
										//console.log("TMP value:", tmp); // TMP 값 확인
										$("#ondo").html(tmp + "도");
									}, error: function () {

									}
								})
							})

						</script>



						<!-- Bootstrap core JavaScript-->
						<script src="resources/js/jquery.js"></script>
						<script src="resources/js/bootstrap.bundle.js"></script>



						<!-- Custom scripts for all pages-->
						<script src="resources/js/sb-admin-2.js"></script>

						<!-- Core plugin JavaScript-->
						<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

						<script>
							$(function () {
								let type = '${loginUser.meType}';
								$(".updateInfo").click(function () {
									switch (type) {
										case "":
											location.href = "update.stu";
											break;
										default:
											location.href = "update.me";
											break;
									}
								})
							})
						</script>


		</body>

		</html>