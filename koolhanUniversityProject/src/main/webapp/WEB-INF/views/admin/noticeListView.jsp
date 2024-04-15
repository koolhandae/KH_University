<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
                    h1{
        margin: 0 !important;
        color: rgb(32, 56, 100);
        /* padding: 20px; */
    }
    #footerH3>div{
        padding: 50px 10px 20px 100px;
        margin: 0 !important;
        font-size: 18px;
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
    .form-group{
        /* padding-top: 50px; */
        padding-right: 100px;
        padding-bottom: 30px;
        padding-left: 100px
    }
    th,td {
        text-align: center !important;
        width: 275px;
    }
    thead *{
        background-color: #1c4587;
        color: white;
    }

    .btns{
        padding-bottom: 50px;
    }
    #footerDiv{
        padding:  0px 100px 50px 100px;
    }
    #footerH3{
        display: flex;
        flex-direction: row;
        align-items: baseline;
        float: right;
    }
    .input-group{
        padding-right: 100px;
    }
    
    </style>
</head>
<body>
    <jsp:include page="../common/header_with_sidebar.jsp"/>
    <div class="content">
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">공지사항</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li> 소식 </li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li style="font-weight: bold;"> 공지사항 </li>
                </ul>
            </div>



        </div>
        <br><br>
        <!-- <form action="" id="noticeSearchForm" class="">
            <input type="text">
        </form> -->
        
        <div id="footerH3"class="bg-white">
            <div id="searchDiv" style="color: rgb(32, 56, 100);">검색</div>
            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div id="footerDiv" class="bg-white">
    
            
    
    
            <table class="table" id="footerTable">
                <thead>
                    <tr>
                        <th style="width: 80%;" >제목</th>
                        <th style="width: 20%;">날짜</th>
                    </tr>
                </thead>
    
                <tbody>
                    <tr>
                        <td>김뫄뫄</td>
                        <td>132958392</td>
                    </tr>
    
                    <tr>
                        <td>차은우</td>
                        <td>489513249</td>
                    </tr>
                </tbody>
            </table>




    </div>   
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>