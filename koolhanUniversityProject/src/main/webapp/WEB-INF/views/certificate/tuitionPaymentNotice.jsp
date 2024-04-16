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
</style>

</head>
<body>
   <div class="content" style="padding:10px;">
		<div class="innerContnent">
			<div id="schoolName" style="text-align: center;">
				<h1>쿨한대학교 등록금 고지서</h1>
			</div>
			<div id="studentNo">
				<span>학생 번호 : </span> <span>12345645</span>
			</div>
			<br>
			<div id="studentName">
				<span>이름 : </span> <span>김아무개</span>
			</div>
			<br>
			<table>
				<thead>
					<tr>
						<td>학부</td>
						<td>등록금</td>
						<td>국가장학금</td>
						<td>교내장학금</td>
						<td>기타장학금</td>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>컴퓨터공학과</td>
							<td>4,200,000</td>
							<td>1,200,000</td>
							<td>500,000</td>
							<td>0</td>
						</tr>
						<tr>
							<td colspan="4">납부액</td>
							<td>2,500,000</td>
						</tr>
						
				</tbody>
			</table>
			<br>
			<br>
			<div id="date" style="text-align:center;">
				<h3>위와 같이 납부하여 주시기 바랍니다.</h3>
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