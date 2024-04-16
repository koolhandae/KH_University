<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h1>쿨한대학교 성적 증명서</h1>
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
						<td>구분</td>
						<td>학습과목명</td>
						<td>성적</td>
						<td>학점</td>
						<td>학기</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="classList">
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
						<tr>
							<td>교양</td>
							<td>기초 중국어</td>
							<td>92</td>
							<td>3.0</td>
							<td>2015 01</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<br>

			<table>
				<tbody>
					<tr>
						<td>총신청학점</td>
						<td>총취득학점</td>
						<td>총평점평균</td>
					</tr>
					<tr>
						<td>84</td>
						<td>84</td>
						<td>3.5/4.0</td>
					</tr>
				</tbody>
			</table>
			<div id="grade" style="font-size: 10px">
				* A+ : 4.5 (95-100), A : 4.0 (90-94), B+ : 3.5 (85-89), B : 3.0 (80-84), C+ : 2.5 (75-79), C : 2.0 (70-74), D+ : 1.5 (65-69), D = 1.0 (60-64), F : 0 (0-59)
			</div>
			
			<div id="date" style="text-align:center;">
				<h3>성적원부와 상위 없음을 증명함</h3>
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