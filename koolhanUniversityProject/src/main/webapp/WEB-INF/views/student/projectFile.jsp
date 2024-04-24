<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<span>
	 		${file}
		</span>
	</div>
   <iframe src="${file}" width="100%", height="700">
  		<p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
	</iframe>
</body>

</html>