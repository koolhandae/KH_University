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
        padding-top: 50px;
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
    .homework_li_class{

        width: 250px;
        height: 65px;
        border: 2.5px solid #858796;;
        font-size: 20px;
        line-height: 60px;
        display: inline-block;
        cursor:pointer;
        text-align:center;
    }
    #HomeworkLiDiv{
        display: flex;
        justify-content: center;
    }
    #wave{
        width: 50px;
    }
    .ui-datepicker-trigger{
        display: none;
    }
    .btns{
        padding-bottom: 50px;
    }
    #footerDiv{
        padding:  50px 100px 50px 100px;
    }

    </style>
</head>
<body>
    <jsp:include page="../common/header_with_sidebar.jsp"/>
    <jsp:include page="../common/datePickerNsummernote.jsp"/>
    <div class="content">

    <div id="topdiv"class="bg-white">

        <div id="h1Div">
            <h1 style="font-weight: 900;">과제</h1>
        </div>
        <div id="liGroup">
            <ul>
                <li>과제 </li>
                <li><i class="fa-solid fa-chevron-right"></i></li>
                <li> 과제 현황</li>
                <li><i class="fa-solid fa-chevron-right"></i></li>
                <li style="font-weight: bold;"> 과제 현황 상세보기 </li>
            </ul>
        </div>

    </div>
    <div style="padding: 15px;" id="HomeworkLiDiv">
        <ul style="height: 66px; margin: 0;" >
            <li class="homework_li_class" style="background-color: white;" onclick="location.href = 'professorPJEnrollForm.do'">과제 등록</li>
            <li class="homework_li_class" style="background-color: #1c4587; color: white; margin-right: 0.5px;">과제 현황</li>
        </ul>
        
    </div>
    
    
    <div id="contentDiv" class="bg-white">
        <div>
            <h3>과제 현황 상세보기</h3>

 
                <div class="form-group">
                    
                    <label for="lectureSelect">강의 명 </label>
                    <input type="text" class="form-control" id="lectureSelect" name="lectureSelect" required><br>

                    <br>

                    <label for="lectureTitle">제목 </label>
                    <input type="text" class="form-control" id="lectureTitle" name="lectureTitle" required><br>
                
                    
                    <label for="lectureNm"> &nbsp;마감기한 :</label>
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="datepicker" class="form-control">
                            </td>
                            <td id="wave">
                                ~
                            </td>
                            <td>
                                <input type="text" id="datepicker2" class="form-control">
                            </td>
                        </tr>
                    </table>

                    <br>

                    
                    <label for="content"> &nbsp;내용 </label>
                    <textarea id="summernote" name="editordata" cols="30" rows="10" class="form-control summernote" style="resize:none;"> </textarea>
                   


                </div>
                <br>
        </div>
        <br>

    </div>


    <br><br>


    <div id="footerH3"class="bg-white">
        <h3>제출 현황</h3>
    </div>
    <div id="footerDiv" class="bg-white">

        


        <table class="table" id="footerTable">
            <thead>
                <tr>
                    <th >학생이름</th>
                    <th>학번</th>
                    <th >현황</th>
                    <th >파일첨부</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>김뫄뫄</td>
                    <td>132958392</td>
                    <td>미제출</td>
                    <td>
                        <a href="리소스 내의 파일경로" download class="btn btn-outline-primary">다운로드</a>
                    </td>
                </tr>

                <tr>
                    <td>차은우</td>
                    <td>489513249</td>
                    <td>제출완료</td>
                    <td>
                        <a href="리소스 내의 파일경로" download class="btn btn-outline-primary">다운로드</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>