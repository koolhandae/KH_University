<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

.content {
	width: 794px;
	height: 1123px;
	border: 1px solid red;
}

.innerContent {
	width: 720px;
	height: 1000px;
}

table {
	width: 100%;
}

table * {
	text-align: center;
}

thead * {
	font-weight: 600;
}
#stamp img{
	height: 50px
}
.center{
	text-align:center;
	font-size: 20px;
}
</style>
</head>
<body>
   <div class="content" style="padding:10px;">
		<div class="innerContnent">
			<div id="schoolName" style="text-align: center;">
				<h1>쿨한대학교 졸업 증명서</h1>
			</div>
			<div id="studentNo">
				<span>학생 번호 : </span> <span>12345645</span>
			</div>
			<br>
			<div id="studentName">
				<span>이름 : </span> <span>김아무개</span>
			</div>
			<br>
			<div id="studentSsn">
				<span>주민등록번호 : </span> <span>930524-1234567</span>
			</div>
			<br>
			<br>
			<br>
			<div class="center">
				<span>학과 (전공) : </span>
				<span>컴퓨터 공학</span>
			</div>
			<br>
			<div class="center">
				<span>학 위 종 별 : </span>
				<span>컴퓨터 공학 학사</span>
			</div>
			<br>
			<div class="center">
				<span>수여 년 월 일 :</span>
				<span>2010년 02월 06일</span>
			</div>
			<br>
			<div style="margin:180px 0">
				<span style="font-size: 35px; line-height: 2;"> &nbsp; 학점인정 등에 관한 법률 제9조와 학칙 제 47조의 2 규정에 의하여 위의 사실을 증명함</span>
			</div>
			<div align="center">
				<h3>2024년 04월 16일</h3>
			</div>
			<div id="signature" style="display:flex; justify-content: flex-end;" >
				<div style="height: 150px;  margin: 0 15px">
					<img alt="" src="resources/images/logo.png" style="height:100%">
				</div>
				<div id="stamp" style="position:relative;padding-left: 40px; margin-right: 15px; width:310px">
					<img alt="" src="resources/images/KHU_Stamp.png" style="position: absolute; right:-15px; height:100px"><br>
					<img alt="" src="resources/images/KHU_Signature.png"><br>
					<br>
					<span>쿨한대학교 총장</span><br>
					<span>대한쿨</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>