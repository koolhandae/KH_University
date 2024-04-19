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
    </style>
</head>
<body>
    <jsp:include page="../common/header_with_sidebar.jsp"/>
    <div class="content">
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">성적 등록</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li>강의 목록</li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li> 성적 등록</li>
                </ul>
            </div>
            

        </div>

        <div style="padding: 15px;">

        </div>

        <div id="contentDiv" class="bg-white">
            <div>
                <h3>수강생 리스트 | <span>강의명</span></h3>
            </div>
            <div style="float: right; padding-right: 100px; padding-bottom: 10px;">
                <button class="btn btn-primary">등록</button>
                <button class="btn btn-danger">취소</button>
                <button class="btn btn-secondary">목록가기</button>
            </div>
        

            <div class="form-group">
                <table class="table" >
                    <thead>
                        <tr>
                            <th>학번</th>
                            <th>학과</th>
                            <th>이름</th>
                            <th>학년</th>
                            <th>중간</th>
                            <th>기말</th>
                            <th>과제</th>
                            <th>출석</th>
                            <th>총점</th>
                            <th>학점</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td>1236532</td>
                            <td>컴퓨터공학과</td>
                            <td>김뫄뫄</td>
                            <td>2학년</td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <span></span>
                            </td>
                            <td><span>A+</span></td>
                        </tr>
                        <tr>
                            <td>1236532</td>
                            <td>컴퓨터공학과</td>
                            <td>김뫄뫄</td>
                            <td>2학년</td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <input type="text" class="form-control">
                            </td>
                            <td>
                                <span></span>
                            </td>
                            <td><span>A+</span></td>
                        </tr>
                    </tbody>


                </table>
            </div>
        </div>

    </div>
    <jsp:include page="../common/footer.jsp"/>    
</body>
</html>