<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
		 <script src="resources/js/jquery.min.js"></script>
	    <script src="resources/js/jspdf.min.js"></script>
	    <script src="resources/js/html2canvas.js"></script>
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
.center{
	text-align:center;
	font-size: 20px;
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
		<br>
			<div id="schoolName" style="text-align: center;">
				<h1>쿨한대학교 졸업 증명서</h1>
			</div>
			<div id="studentNo" align="left" style="margin-left:20px;">
				<span>학생 번호 : </span> <span>${loginStudent.studentId}</span>
			</div>
			<br>
			<div id="studentName" align="left" style="margin-left:20px;">
				<span>이름 : </span> <span>${loginStudent.studentName}</span>
			</div>
			<br>
			<div id="studentSsn" align="left" style="margin-left:20px;">
				<span>주민등록번호 : </span> <span>${loginStudent.studentSsn}</span>
			</div>
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
				<span>${loginStudent.gradDate}</span>
			</div>
			<br>
			<div style="margin:120px 0">
				<span style="font-size: 35px; line-height: 2;"> &nbsp; 학점인정 등에 관한 법률 제9조와 학칙 제 47조의 <br>2 규정에 의하여 위의 사실을 증명함</span>
			</div>
			<div align="center">
				<h3><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일"/></h3>
			</div>
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
            pdf.save('${loginStudent.studentName} 졸업증명서.pdf');
        }
    </script>
	
	
</body>
</html>