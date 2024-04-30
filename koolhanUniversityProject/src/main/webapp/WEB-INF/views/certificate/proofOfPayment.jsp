<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <jsp:include page="../common/header_with_sidebar.jsp"/>

	<br>
	<br>
	<div align="center">
	<button onclick="printPDF();" class="btn btn-primary">pdf다운로드</button>
	</div>
	<br>
	<br>
	<br>
   <div id="pdfDiv" class="content" style="padding:10px; background-color: white; color: black; margin:auto; padding:40px;" align="center">
		<div class="innerContnent">
			<div id="schoolName" style="text-align: center;">
				<h1>쿨한대학교 등록금 납부 영수증</h1>
			</div>
			<br>
	<br>
	<br>
			<div id="studentNo">
				<span>학생 번호 : </span> <span>${loginStudent.studentId}</span>
			</div>
			<div id="studentName">
				<span>이름 : </span> <span>${loginStudent.studentName}</span>
			</div>
			<div>
				<span>학과 : </span> <span>컴퓨터 공학과</span>
			</div>
			<table style="margin: 150px 0" border="1">
				<thead>
					<tr>
						<td colspan="4">등록금</td>
						<td>금액</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">수업료 (A)</td>
						<td>${t.tuition}</td>
					</tr>
					<tr>
						<td colspan="4">감면액 (B)</td>
						<td>${t.scholarship}</td>
					</tr>
					<tr>
						<th colspan="4">합계 (A - B)</th>
						<td>${t.tuition - t.scholarship}</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<div id="date" style="text-align:center;">
				<h3>위와 같이 등록을 필하였음을 확인합니다.</h3>
				<h3><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일"/></h3>
			</div>
			<br>
	<br>
	<br>
			<div id="signature" style="display:flex; justify-content: flex-end;" >
			<div style="width:280px"> </div>
				<div style="height: 150px;  margin: 0 15px">
					<img alt="" src="resources/images/logo.png" style="height:100%">
				</div>
				<div id="stamp" style="position:relative;padding-left: 10px; margin-right: 15px; width:280px">
					<img alt="" src="resources/images/KHU_Stamp.png" style="position: absolute; right:-15px; height:100px"><br>
					<img alt="" src="resources/images/KHU_Signature.png"><br>
					<br>
					<span>쿨한대학교 총장</span><br>
					<span>대한쿨</span>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
        async function printPDF() {
            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF();

            const element = document.getElementById('pdfDiv');
            const canvas = await html2canvas(element);
            const imgData = canvas.toDataURL('image/png');

            const imgProps = pdf.getImageProperties(imgData);
            const pdfWidth = pdf.internal.pageSize.getWidth();
            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            pdf.save('${loginStudent.studentName} 등록금 납부 영수증.pdf');
        }
    </script>
	
	
</body>
</html>