<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학사일정</title>
    <style>
                h1{
        margin: 0 !important;
        color: rgb(32, 56, 100);
        /* padding: 20px; */
    }
    h3{
        padding: 50px 50px 0 100px;
        margin: 0 !important;
    }
    #topdiv{
        margin-top: 50px;
        margin-left: 100px;
        margin-right: 100px;  
        padding: 20px 20px 20px 50px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
        padding: 0;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv, #footerDiv, #footerH3{
        margin-left: 100px;
        margin-right: 100px;  
    }
    #h1Div{
        float: left;
    }
    #liGroup{
        float: right;
        line-height: 50px;
    }
    </style>
</head>
<body>
    <jsp:include page="../common/header_with_sidebar.jsp"/>
    <div class="content">
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">학사일정</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li> 새소식 </li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li> 학사일정</li>
                </ul>
            </div>
    
        </div>

    </div>
    <jsp:include page="../common/footer.jsp"/>       
</body>
</html>