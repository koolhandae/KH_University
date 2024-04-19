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
        padding: 50px 50px 0 50px;
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
    td{
        width: 750px;
    }
    .btns{
        padding-bottom: 50px;
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	
       
    
    	<div id="topdiv"class="bg-white">

                <div id="h1Div">
                <h1 style="font-weight: 900;">강의 등록</h1>
                </div>
                <div id="liGroup">
                    <ul>
                        <li>나의 강의실 </li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li style="font-weight: bold;"> 강의등록</li>
                    </ul>
                </div>

            <div></div>
			<!-- <hr> -->
        </div>

        <div style="padding: 15px;">

        </div>


        
        <div id="contentDiv" class="bg-white">
        <div>
            <h3>강의 등록</h3>

            <form action="insertClass.do" method="post" id="enrollForm"  enctype="multipart/form-data">
                <div class="form-group">
                    
                    <input type="hidden" value="${loginUser.memberNo}" name="profNo">
                    
                    <label for="lectureNo">강의번호 :</label>
                    <input type="text" class="form-control" id="lectureNo" name="classNum" placeholder="" required><br>
                    
                    <label for="lectureNm"> &nbsp;강의이름 :</label>
                    <input type="text" class="form-control" id="lectureNm" name="className" placeholder="강의명을 입력해주세요"><br>
                    

                    <table>
                        <tr>
                            <td >
                                <label for="student_Grade"> &nbsp;대상학년 :</label>
                                <select name="classGrade" id="student_Grade" class="form-control dropdown">
                                    <option >1학년</option>
                                    <option >2학년</option>
                                    <option >3학년</option>
                                    <option >4학년</option>
                                </select><br> 
                            </td> 
                            <td >
                                <label for="lectureSemester"> &nbsp;강의학기 :</label>
                                <select name="classSemester" id="lectureSemester" class="form-control">
                                    <option >1학기</option>
                                    <option >2학기</option>
                                    <option >여름계절학기</option>
                                    <option >겨울계절학기</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="lectureRoom"> &nbsp;강의실 :</label>
                                <input type="text" class="form-control" id="lectureRoom" name="classRoom" placeholder="예) 000관 000호"><br>
                            </td>

                            <td>
                                <label for="lectureTime"> &nbsp;강의시간 :</label>
                                <input type="text" class="form-control" id="lectureTime" name="classTime" placeholder="예) 수 1,2,3"><br>
                            </td>
                        </tr> 
                    </table>
                    
                    
                    <label for="lectureGrade"> &nbsp;학점 :</label>
                    <input type="number" class="form-control" id="lectureGrade" name="classScore" maxlength="1" placeholder="예) 1" onchange="onlyNumber();"><br>
                    
                    <label for="lectureType"> &nbsp;구분 :</label><br>
                    <select name="classType" id="lectureType" class="form-control">
                        <option value="C1" >전공필수</option>
                        <option value="C2" >전공선택</option>
                        <option value="C3" >교양필수</option>
                        <option value="C4" >교양선택</option>
                    </select><br>

                    <label for="headCount"> &nbsp;수강정원 :</label>
                    <input type="text" class="form-control" id="headCount" name="classPeople" placeholder="숫자만 입력해주세요" maxlength="3" onchange="onlyNumber2();"><br>
                   
                    <label for="etc"> &nbsp;기타사항 :</label>
                    <input type="text" class="form-control" id="etc" name="classEtc" placeholder="기타사항을 입력해주세요"><br>

                    <label for="classPlan"> &nbsp;강의계획서 업로드 : </label>
                    <input type="file" id="classPlan" name="fileupload" accept=".pdf, .hwp, .docx, .doc"><br>
                    <div style="font-size: 0.8em; color: rgb(248, 123, 123);" >.pdf, .hwp, .docx, .doc 파일만 첨부 가능합니다.</div>
                    <div></div> 
                   


                </div>
                <br>
                <div class="btns" align="center">
                    <button id="enrollBtn" type="submit" class="btn btn-primary">등록</button>
                    <button type="reset" class="btn btn-danger">취소</button>
                    <!-- <button type="button" class="btn btn-secondary">목록</button> -->
                </div>
            </form>
        </div>



        <script>
				

                function onlyNumber(){ //학점에 숫자만 입력되게 하는 거..!
                    let lectureGradeVal = $("#lectureGrade").val();
                    console.log(lectureGradeVal);
                    if(!/^[0-9]+$/.test(lectureGradeVal)){
                       let newVal = lectureGradeVal.replace(/\D/g, '');
                       $("#lectureGrade").val(newVal);
                    }
                }

                function onlyNumber2(){ //수강인원에 숫자만 입력되게
                    let headCount = $("#headCount").val();
                    if(!/^[0-9]+$/.test(headCount)){
                       let newVal = headCount.replace(/\D/g, '');
                       $("#headCount").val(newVal);
                    }
                }
        

        </script>
        

        

    

      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>