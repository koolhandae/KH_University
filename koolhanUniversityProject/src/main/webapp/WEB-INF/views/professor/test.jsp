<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> -->



<script>
    var j = jQuery.noConflict();
</script>
<body>
    <jsp:include page="../common/header_with_sidebar.jsp"/>


    <!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->
<form method="post">
    <textarea id="summernote" name="editordata" class="summernote"></textarea>
  </form>
  
  
<!--   
   div에 에디터를 사용하는 경우
  <div id="summernote">Hello Summernote</div> -->

</body>
<script>

j(function() {
	//여기 아래 부분
	j('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '한글한글~~'	//placeholder 설정
          
	});
});
</script>

</html>