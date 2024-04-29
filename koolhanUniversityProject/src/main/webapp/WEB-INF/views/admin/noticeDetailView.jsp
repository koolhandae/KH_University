<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table * {
        margin: 5px;
    }
    
    table {
        width: 100%;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <jsp:include page="../common/datePickerNsummernote.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>공지사항 상세보기</h2>
            <br>
            
            <a class="btn btn-secondary" style="float:right" href="list.no">목록으로</a>
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${n.noticeTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${n.noticeWriter}</td>
                    <th>작성일</th>
                    <td>${n.createDate}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
                    <span id="SMcontentSpan">${n.noticeContent }</span></td>
                </tr>
            </table>
            <br>
				<c:if test="${loginUser.meType eq 'A'}">
				<div align="center">
					<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
					<a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
					<!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
					<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
				</div>
				<br>
				<br>
				
					<form id="postForm" method="post">
						<input type="hidden" name="nno" value="${n.noticeNo}">
					</form>
				</c:if>
		<script>
			function postFormSubmit(e){
				$.ajax({
					url: 
				})
			}
		</script>
        </div>
        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>