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

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <jsp:include page="../common/datePickerNsummernote.jsp"/>
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
                <li class="homework_li_class" style="background-color: white;">과제 현황</li>
            </ul>
            
        </div>

        <div id="contentDiv" class="bg-white">
            <div>
                <h3>과제 등록</h3>
    
                <form action="insert.me" method="post" id="enrollForm">
                    <div class="form-group">
                        
                        <label for="lectureSelect">강의 선택 </label>
                        <select name="lectureSelect" id="lectureSelect" class="form-control ">
                            <option>자바기초</option>
                            <option>컴퓨터프로그래밍</option>
                            <option>이산수학</option>
                            <option>공학수학1</option>
                        </select>

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
                    <div class="btns" align="center">
                        <button id="enrollBtn" type="submit" class="btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-danger">취소</button>
                    </div>
                </form>
            </div>
            
   	
      
   </div>




<script>
       $(function() {
        //여기 아래 부분
            $('#summernote').summernote({
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '한글한글~~',	//placeholder 설정
                toolbar: [
                                        // [groupName, [list of button]]
                                        ['fontname', ['fontname']],
                                        ['fontsize', ['fontsize']],
                                        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                        ['color', ['forecolor','color']],
                                        ['table', ['table']],
                                        ['para', ['ul', 'ol', 'paragraph']],
                                        ['height', ['height']],
                                        ['insert',['picture','link','video']],
                                        ['view', ['help']]
                                    ],
                                    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

                });
        });
   </script>





   <jsp:include page="../common/footer.jsp"/>

</body>
</html>