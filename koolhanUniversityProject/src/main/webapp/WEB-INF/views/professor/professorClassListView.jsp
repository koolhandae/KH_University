<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        padding: 20px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv{
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
        padding-bottom: 100px;
        padding-left: 100px
    }
    th,td {
        text-align: center !important;
        width: 214px;
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
                    <h1 style="font-weight: 900;">강의 관리</h1>
                </div>
                <div id="liGroup">
                    <ul>
                        <li>나의 강의 목록 </li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li style="font-weight: bold;"> 강의 목록</li>
                    </ul>
                </div>

            </div>
            <!-- <hr> -->
        </div>

        <div style="padding: 15px;">

        </div>



        <div id="contentDiv" class="bg-white">
            <div>
                <h3>강의 목록</h3>
            </div>
        

            <div class="form-group">
                <table class="table" >
                    <thead>
                        <tr>
                            <th>강의번호</th>
                            <th>년도</th>
                            <th>학년</th>
                            <th>학기</th>
                            <th>강의명</th>
                            <th>구분</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td>11</td>
                            <td>2024</td>
                            <td>2학년</td>
                            <td>2학기</td>
                            <td>강좌명</td>
                            <td>전공</td>
                            <td>
                                <button class="btn btn-warning" data-toggle="modal" data-target="#staticBackdrop">수정</button>
                                <button class="btn btn-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>2024</td>
                            <td>2학년</td>
                            <td>2학기</td>
                            <td>강좌명</td>
                            <td>전공</td>
                            <td>
                                <button class="btn btn-warning">수정</button>
                                <button class="btn btn-danger">삭제</button>
                            </td>
                        </tr>
                    </tbody>


                </table>
            </div>
        </div>

                
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable"> <!-- 대형모달 설정 -->
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <form action="#" method="post" id="enrollForm">
                                <div class="form-group">
                                    
                                    <label for="lectureNo">강의번호 :</label>
                                    <input type="text" class="form-control" id="lectureNo" name="lectureNo" placeholder="Please Enter Number" required><br>
                                    
                                    <label for="lectureNm"> &nbsp;강의이름 :</label>
                                    <input type="text" class="form-control" id="lectureNm" name="lectureNm" placeholder="강의명을 입력해주세요"><br>
                                    
                
                                    <table>
                                        <tr>
                                            <td >
                                                <label for="student_Grade"> &nbsp;대상학년 :</label>
                                                <select name="student_Grade" id="student_Grade" class="form-control dropdown">
                                                    <option value="">1학년</option>
                                                    <option value="">2학년</option>
                                                    <option value="">3학년</option>
                                                    <option value="">4학년</option>
                                                </select><br> 
                                            </td> 
                                            <td >
                                                <label for="lectureSemester"> &nbsp;강의학기 :</label>
                                                <select name="lectureSemester" id="lectureSemester" class="form-control">
                                                    <option value="">1학기</option>
                                                    <option value="">2학기</option>
                                                    <option value="">여름계절학기</option>
                                                    <option value="">겨울계절학기</option>
                                                </select><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="lectureRoom"> &nbsp;강의실 :</label>
                                                <input type="text" class="form-control" id="lectureRoom" name="lectureRoom" placeholder="예) 000관 000호"><br>
                                            </td>
                
                                            <td>
                                                <label for="lectureTime"> &nbsp;강의시간 :</label>
                                                <input type="text" class="form-control" id="lectureTime" name="lectureTime" placeholder="예) 수 1,2,3"><br>
                                            </td>
                                        </tr> 
                                    </table>
                                    
                                    
                                    <label for="lectureGrade"> &nbsp;학점 :</label>
                                    <input type="text" class="form-control" id="lectureGrade" name="lectureGrade" maxlength="1" placeholder="예) 1" onchange="onlyNumber();"><br>
                                    
                                    <label for="lectureType"> &nbsp;구분 :</label><br>
                                    <select name="lectureType" id="lectureType" class="form-control">
                                        <option value="">전공</option>
                                        <option value="">교양</option>
                                        <option value="">전공기초</option>
                                        <option value="">기타</option>
                                    </select><br>
                
                                    <label for="headCount"> &nbsp;수강정원 :</label>
                                    <input type="text" class="form-control" id="headCount" name="headCount" placeholder="숫자만 입력해주세요" maxlength="3" onchange="onlyNumber2();"><br>
                                   
                                    <label for="etc"> &nbsp;기타사항 :</label>
                                    <input type="text" class="form-control" id="etc" name="etc" placeholder="기타사항을 입력해주세요"><br>
                
                                    <label for="fileUpload"> &nbsp;강의계획서 업로드 : </label>
                                    <input type="file" id="fileUpload" name="fileUpload" accept=".pdf, .hwp, .docx, .doc"><br>
                                    <div style="font-size: 0.8em; color: rgb(248, 123, 123);" >.pdf, .hwp, .docx, .doc 파일만 첨부 가능합니다.</div>
                                    <div></div>
                                   
                
                
                                </div>
                                <br>
                                <div class="btns" align="center">
                                    <button id="enrollBtn" type="submit" class="btn btn-primary">등록</button>
                                    <button type="reset" class="btn btn-danger">취소</button>
                                    <button type="button" class="btn btn-secondary">목록</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                        </div>
                    </div>
                    </div>
                </div>







        
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>