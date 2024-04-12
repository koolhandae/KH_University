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
        padding: 0;
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
        height: 66px;
        border: 2.5px solid #858796;;
        font-size: 20px;
        line-height: 67px;
        display: inline-block;
        cursor:pointer;
        text-align:center;
    }

    #HomeworkLiDiv{
        display: flex;
        justify-content: center;
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
    <button id="confirmAlert">알림창</button>
    <script>
    $("#confirmAlert").click(function () {
        Swal.fire({
      icon: 'success',
      title: 'Alert가 실행되었습니다.',
      text: '이곳은 내용이 나타나는 곳입니다.',
    })
              });
          
        </script>
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">과제</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li>과제 </li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li style="font-weight: bold;"> 과제 등록</li>
                </ul>
            </div>

        </div>
        <div style="padding: 15px;" id="HomeworkLiDiv">
            <ul style="height: 66px; margin: 0;" >
                <li class="homework_li_class" style="background-color: #1c4587; color: white; margin-right: 0.5px;">과제 등록</li>
                <li class="homework_li_class">과제 현황</li>
            </ul>
            
        </div>

        <div id="contentDiv" class="bg-white">
            <div>
                <h3>강의 등록</h3>
    
                <form action="insert.me" method="post" id="enrollForm">
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
    
   	
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>