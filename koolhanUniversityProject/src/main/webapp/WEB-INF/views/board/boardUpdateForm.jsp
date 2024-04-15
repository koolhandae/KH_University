<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #updateForm>table {
        width: 90%;
    }
    
    #updateForm>table * {
        margin: 5px;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>커뮤니티 게시판 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
            	<input type="hidden" name="noticeNo" value="${n.noticeNo}">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle}" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" name="noticeWriter" value="${n.noticeWriter}"  readonly></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="noticeContent" id="content" rows="10" style="resize:none;">${n.noticeContent }</textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>