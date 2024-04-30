<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#btn {
	border: 2px solid rgb(48, 76, 121);
	color: rgb(48, 76, 121);
	border-radius: 5px;
}

#btn:hover {
	background-color: rgb(18, 46, 81);
	color: white;
}

.billBtn>button {
	margin: auto;
}

.selectTuitionbtn {
	height: 70px;
	width: 250px;
	margin-right: 100px;
}

.paymentTuition {
	height: 70px;
	width: 250px;
}

.tuitionBtn>button {
	display: flexbox;
	font-size: 20px;
	border-radius: 13px;
	border: 2px solid rgb(48, 76, 121);
	color: rgb(48, 76, 121);

	/* background-color: rgb(48, 76, 121);  */
}

.tuitionBtn>button:hover {
	background-color: rgb(18, 46, 81);
	color: white;
}

#boardList th {
	background-color: rgb(48, 76, 121);
	color: white;
	text-align: center;
}

#boardList td {
	padding-left: 30px;
	pointer-events: none;
}

#boardList {
	width: 900px;
	pointer-events: none;
}

#borderList>tr {
	border-bottom: 1px;
	border-color: rgb(75, 75, 75);
}

hr {
	width: 1000px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
		<div class="innerOuter">
			<div class="tuitionBtn" align="center";>
				<a class="btn btn-primary btn-lg" href="tuitionBill.do"
					roll="button" style="background-color: rgb(48, 76, 121)">등록금 납부
					고지서</a> <span style="margin-left: 40px; margin-right: 40px;"></span> <a
					class="btn btn-primary btn-lg" href="tuitionPay.do" roll="button"
					style="background-color: rgb(48, 76, 121)">등록금 내역 조회</a>
			</div>
			<br>
			<br>
			<br>
			<h1
				style="margin-left: 150px; font-weight: 900; color: rgb(75, 75, 75);">등록금
				고지서</h1>
			<h5 style="margin-left: 150px;">2024년도 1학기</h5>
			<hr>
			<br>
			<form action="tuitionPayForm.do" method="post">
				<input type="hidden" name="studentId"
					value="${ loginStudent.studentId }">


				<table id="boardList" class="table table-hover" align="center">
					<tr>
						<th>학부(과)</th>
						<td>컴퓨터공학과</td>
						<th>학번</th>
						<td>${ loginStudent.studentId }</td>
					</tr>

					<tr>
						<th>성명</th>
						<td>${ loginStudent.studentName }</td>
						<th>학기</th>
						<td>3학년 1학기</td>
					</tr>

					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="4" align="center"><h2>납부할 등록금이 없습니다.</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="li" items="${ list }">
								<tr>
									<th>등록금</th>
									<td>${ li.tuition }</td>
									<th>장학금</th>
									<td>${ li.scholarship }
									<td>
								</tr>

								<tr>
									<th>납부 금액</th>
									<td colspan="3" align="center" style="font-size: 20px";>${ li.tuition - li.scholarship }</td>
								</tr>
								<tr>
									<th>납부기간</th>
									<td colspan="3" align="center"><fmt:parseDate
											value="${li.tbOpen}" pattern="yyyy-MM-dd" var="openDate" />
										<fmt:parseDate value="${li.tbClose}" pattern="yyyy-MM-dd"
											var="closeDate" /> <fmt:formatDate value="${openDate}"
											pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
											value="${closeDate}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>

					</c:choose>
				</table>

				<br>
				<c:if test="${not empty list}">
					<div class="billBtn" style="display: flex">
						<button class="btn btn-xs" id="btn">납부하기</button>
					</div>
				</c:if>
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>