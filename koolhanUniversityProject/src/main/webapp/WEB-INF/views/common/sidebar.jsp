<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 제이쿼리 스니펫 -->
<script src="https://ajax.googleapis.com/ajax/libs/cesiumjs/1.78/Build/Cesium/Cesium.js"></script>
<!-- 부트스트랩 JS CSS -->
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
<!-- 부트 스트랩 템플릿 -->
	<!-- Custom fonts for this template-->
    <link href="resources/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <script src="https://kit.fontawesome.com/12b80a3a82.js" crossorigin="anonymous"></script>
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap.bundle.js"></script>

<style>

.bg-gradient-primary {
    /* background-color:#4e73df; */
    background-image: linear-gradient(180deg,#1c4587 10%,#1c4587 100%);
    background-size: cover;
}
</style>
</head>
<body style="display:flex">
	<!-- Sidebar -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">
		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
			<div class="sidebar-brand-icon">
				<img style="width: 60px" src="resources/images/logo.png" alt="" />
			</div>
			<div class="sidebar-brand-text mx-3">
				KH University<sup></sup>
			</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0" />

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="index.html">
				<span>쿨한대학교 학사 정보 시스템</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider" />

		<!-- Heading -->
		<div class="sidebar-heading">Interface</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-fw fa-cog"></i> <span>학생</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">가나다라</h6>
					<a class="collapse-item" href="buttons.html">하이</a> <a
						class="collapse-item" href="cards.html">바이</a>
				</div>
			</div></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Custom Utilities:</h6>
					<a class="collapse-item" href="utilities-color.html">Colors</a> <a
						class="collapse-item" href="utilities-border.html">Borders</a> <a
						class="collapse-item" href="utilities-animation.html">Animations</a>
					<a class="collapse-item" href="utilities-other.html">Other</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider" />

		<!-- Heading -->
		<div class="sidebar-heading">Addons</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"> 
			<i class="fas fa-fw fa-folder"></i> <span>Pages</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Login Screens:</h6>
					<a class="collapse-item" href="login.html">Login</a> 
					<a class="collapse-item" href="register.html">Register</a> 
					<a class="collapse-item" href="forgot-password.html">Forgot	Password</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Other Pages:</h6>
					<a class="collapse-item" href="404.html">404 Page</a> 
					<a class="collapse-item" href="blank.html">Blank Page</a>
				</div>
			</div></li>

		<!-- Nav Item - Charts -->
		<li class="nav-item"><a class="nav-link" href="charts.html">
				<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
		</a></li>

		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="tables.html">
				<i class="fas fa-fw fa-table"></i> <span>Tables</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block" />

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
		<!-- Sidebar Message -->
		<div class="sidebar-card d-none d-lg-flex">
			<img class="sidebar-card-illustration mb-2"
				src="resources/images/undraw_rocket.svg" alt="..." />
			<p class="text-center mb-2">
				<strong>쿨한 대학교는</strong> 재미있다
			</p>
			<a class="btn btn-success btn-sm" href="#">재밌다</a>
		</div>
	</ul>
	<!-- End of Sidebar -->
	
	
	<!-- Bootstrap core JavaScript-->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/js/bootstrap.bundle.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.js"></script>
</body>
</html>