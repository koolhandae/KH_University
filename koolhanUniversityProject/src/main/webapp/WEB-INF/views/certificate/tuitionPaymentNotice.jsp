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
   <div id="pdfDiv" class="content" style="padding:10px; background-color: white; color: black; margin:auto; padding:40px;">
		<div class="innerContnent">
			<div id="schoolName" style="text-align: center;">
				<h1>쿨한대학교 등록금 고지서</h1>
			</div>
			<br><br>
			<div id="studentNo">
				<span>학생 번호 : </span> <span>${loginStudent.studentId}</span>
			</div>
			<br>
			<div id="studentName">
				<span>이름 : </span> <span>${loginStudent.studentName }</span>
			</div>
			<br>
			<table border="1">
				<thead>
					<tr>
						<td>학부</td>
						<td>등록금</td>
						<td>국가장학금</td>
						<td>성적장학금</td>
						<td>기타장학금</td>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>컴퓨터공학과</td>
							<td>${t.tuition }</td>
							<td>0</td>
							<td>${t.scholarship}</td>
							<td>0</td>
						</tr>
						<tr>
							<td colspan="4">납부액</td>
							<td>${t.tuition - t.scholarship}</td>
						</tr>
						
				</tbody>
			</table>
			<br>
			<br>
			<div id="date" style="text-align:center;">
				<h3>위와 같이 납부하여 주시기 바랍니다.</h3>
				<h3><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일"/></h3>
			</div>
			<br><br><br>
			<div id="signature" style="display:flex; justify-content: flex-end;" >
			<div style="width:280px"> </div>
			<br><br><br>
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
            pdf.save('${loginStudent.studentName} 등록금 고지서.pdf');
        }
    </script>
	
	
</body>
</html>