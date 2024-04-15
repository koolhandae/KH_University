<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        border: 1px solid red;
    }
    #topDiv{
        padding-top: 100px;
    }
    #topDiv>div{
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    #calendar{
        padding-right: 50px;
        padding-left: 50px;
    }
    #notice{
        padding-right: 50px;
        padding-left: 50px;
        padding-bottom: 30px;
        color: rgb(39, 39, 39);
        
    }
    td{
        /* border: solid 1px red; */
        padding: 10px;
    }
    .icon{
        width: 44px;
        height: 44px;
        /* background-image: url(resources/images/unnamed.png);
        background-size: 444px 434px;
        background-position: 0px -128px;
        background-repeat: no-repeat; */
    }
    #noticeTitle{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
    #noticeTitle2{
        padding-right: 160px;
    }
    ul,li{
        list-style: none;
        padding: 0px;
    }
    li{
        float: left;
        padding: 2px;
        width: 100px;
        text-align : center;
    }
    a{
        color: inherit;
        text-decoration: none;
    }
    

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">

            <div id="topDiv" class="bg-white" style="height: 450px;">
                <div id="calendar">달력자리
                </div>
                <div id="notice">
                    <div id="noticeTitle">
                        <div>
                            <h3 style="font-weight: 600;padding-bottom: 10px;">공지사항</h3> <!--최대 5~6개만 보이게-->
                        </div>
                        <div id="noticeTitle2">
                            더 보기  <i class="fa-regular fa-plus"></i>
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td style="width: 500px;">모바일 신분증 이용 안내 제목 들어가는 자리</td>
                            <td>4/15(월)</td>
                        </tr>
                        <tr>
                            <td>2024년도 대학생 청소년교육지원 사업 학생 신청 안내  </td>
                            <td>4/13(토)</td>
                        </tr>
                        <tr>
                            <td>대충 제목 들어가는자리</td>
                            <td>4/12(금)</td>
                        </tr>
                        <tr>
                            <td>제목이들어가요</td>
                            <td>4/11(목)</td>
                        </tr>
                        <tr>
                            <td>제목넣기</td>
                            <td>4/10(수)</td>
                        </tr>
                        <tr>
                            <td>제목넣기</td>
                            <td>4/10(수)</td>
                        </tr>
                    </table>
                </div>
            </div>
    
            <div style="display: flex; justify-content: center;">
                <ul>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>버스</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail" style="width: 100px; height: 100px;"></span>
                            <span>도서관</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>취업관련</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;"> 
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>커뮤니티</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>학사일정</span>
                        </a>
                    </li>
                <ul>
            </div>
        
    </div>

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>