<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <!-- datepicker -->

    <!-- summernote api-->
    <script src="resources/js/summernote/summernote-lite.js"></script>
    <script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <!-- summernote api-->




    <!-- from ~ to 쓸수있음-->
    <!-- 예시로 써보고싶다면 -->
    <!--
        <input type="text" id="datepicker" >
        <input type="text" id="datepicker2" >
    -->
                <script>
                    $(function() {
                        //모든 datepicker에 대한 공통 옵션 설정
                        $.datepicker.setDefaults({
                            dateFormat: 'yy-mm-dd' //Input Display Format 변경
                            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                            ,changeYear: true //콤보박스에서 년 선택 가능
                            ,changeMonth: true //콤보박스에서 월 선택 가능                
                            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
                        });
            
                        //input을 datepicker로 선언
                        $("#datepicker").datepicker();                    
                        $("#datepicker2").datepicker();
                        
                        //From의 초기값을 오늘 날짜로 설정
                        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                        //To의 초기값을 내일로 설정
                        $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                    });
                    </script>
        <!-- from ~ to 쓸수있음-->




        <!-- summernote 예시 -->
        <!-- 
            <body>
                <textarea id="summernote" name="editordata" cols="30" rows="10" class="form-control summernote" style="resize:none;"> </textarea>
            </body>
            <script>
                $(function() {
                    //여기 아래 부분
                        $('#summernote').summernote({
                            height: 300,                 // 에디터 높이
                            minHeight: null,             // 최소 높이
                            maxHeight: null,             // 최대 높이
                            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                            lang: "ko-KR",					// 한글 설정
                            placeholder: '한글한글~~'	//placeholder 설정

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
                                        ['view', ['fullscreen', 'help']]
                                    ],
                                    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

                            });
                    });
             </script>


        -->



</head>
<body>
    
</body>
</html>