<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #boardList {
        text-align: center;
    }
    
    #boardList>tbody>tr:hover {
        cursor: pointer;
    }
    
    #pagingArea {
        width: fit-content;
        margin: auto;
    }
    
    #searchForm {
        width: 80%;
        margin: auto;
    }
    
    #searchForm>* {
        float: left;
        margin: 5px;
    }
    
    .select {
        width: 20%;
    }
    
    .text {
        width: 53%;
    }
    
    .searchBtn {
        Width: 20%;
    }
    </style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
	   <div class="content">
	      <br><br>
	      <div class="innerOuter" style="padding:5% 10%;">
	      	<h2>중앙도서관 검색</h2>
	        <br>
	            
            <form id="searchForm" action="search.lib" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="total" selected>통합</option>
                        <option value="title">제목</option>
                        <option value="author">저작자</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyWord">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
            <br></br>
   		</div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>