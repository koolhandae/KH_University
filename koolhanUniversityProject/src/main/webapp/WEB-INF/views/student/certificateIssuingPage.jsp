<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardList *{
		text-align: center;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp"/>
	<div class="innerOuter">
		<div class="text-left" style="">
			<h1 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">증명서 발급</h1>
			<hr>
		</div>
		<table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>증명서 번호</th>
                    <th>
                    	제목
                    </th>
                    <th>
                    	PDF / 인쇄 
                    	<i class="fa-solid fa-file-pdf"></i>
                    </th>
                  </tr>
                </thead>
                <tbody>
	                    <tr>
	                        <td class="bno">1</td>
	                        <td>성적 증명서</td>
	                        <td>
	                        	<button class="btn btn-primary"  onclick="location.href='transcript.certificate'">PDF 파일 / 인쇄</button>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="bno">2</td>
	                        <td>졸업 증명서</td>
	                        <td>
	                        	<button class="btn btn-primary" onclick="location.href='grad.certificate'">PDF 파일 / 인쇄</button>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="bno">3</td>
	                        <td>등록금 납부 영수증</td>
	                        <td>
	                        	<button class="btn btn-primary" onclick="location.href='tuition.reciept'">PDF 파일 / 인쇄</button>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="bno">4</td>
	                        <td>등록금 고지서</td>
	                        <td>
	                        	<button class="btn btn-primary" onclick="location.href='tuition.notice'">PDF 파일 / 인쇄</button>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="bno">5</td>
	                        <td>재학 증명서</td>
	                        <td>
	                        	<button class="btn btn-primary"  onclick="location.href='attending.certificate'">PDF 파일 / 인쇄</button>
	                        </td>
	                    </tr>
                </tbody>
            </table>
		
		 
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>