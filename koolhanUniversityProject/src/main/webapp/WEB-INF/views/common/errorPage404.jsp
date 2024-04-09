<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </head>
  <body>
    <jsp:include page="header_with_sidebar.jsp" />

    <br />
    <div align="center">
      <br /><br /><br />
      <img src="resources/images/free-icon-404-error-7486789.png" />
      <br /><br />

      <p style="font-size: 25px">
        죄송합니다. 해당 페이지를 찾을 수 없습니다. <br />
        요청하신 페이지가 사라졌거나 잘못된 경로를 이용하셨습니다. <br />
      </p>
      <br /><br /><br />

      <button class="btn btn-primary" onclick="#">홈으로 돌아가기</button>
    </div>

    <br />

    <jsp:include page="footer.jsp" /> 
  </body>
</html>
