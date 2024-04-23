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

    input[type="date"]::-webkit-calendar-picker-indicator,/*역삼각형 모양의 datepicker 드롭다운 시키는 버튼 선택자*/
    input[type="date"]::-webkit-inner-spin-button { /*1일씩 올리거나 내리는 위아래 버튼 선택자이다.*/
     display: none;
     appearance: none; /*platform-native 스타일링을 제거*/
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <jsp:include page="../common/datePickerNsummernote.jsp"/>
   <div class="content">
          
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
                <li class="homework_li_class" style="background-color: white;" onclick="location.href = 'professorPJStateList.do'" >과제 현황</li>
            </ul>

        </div>

        <div id="contentDiv" class="bg-white">
            <div>
                <h3>과제 등록</h3>
    
                    <div class="form-group">
                        
                        <input type="hidden" value="" id="classNo">
                        <input type="hidden" value="${loginUser.memberId }" id="pjProfessor"name="pjProfessor">
                        <label for="lectureSelect">강의 선택 </label>
						<select name="pjClassName" id="lectureSelect" class="form-control">
						    <option></option>
						</select>
						<br>
                        
                       

                        <label for="lectureTitle">제목 </label>
                        <input type="text" class="form-control" id="lectureTitle" name="pjTitle" required><br>
                    
                        
                        <label for="lectureNm"> &nbsp;마감기한 :</label>
                        <table>
                            <tr>
                                <td>
                                    <input type="date" id="datepicker" name="pjDeadline" class="form-control">
                                </td>
                            </tr>
                        </table>

                        <br>
    
                        
                        <label for="content"> &nbsp;내용 </label>
                        <textarea id="summernote" name="pjContent"  class="form-control summernote" style="resize:none;"> </textarea>
                       <!-- 원래값 name="editordata" -->
    
    
                    </div>
                    <br>
                    <div class="btns" align="center">
                        <button id="enrollBtn" type="button" class="btn btn-primary" onclick="submit()">등록</button>
                        <!-- <button type="reset" class="btn btn-danger">취소</button> -->
                    </div>
            </div>
            
   	
      
   </div>
	

	
	<input type="hidden" id="userId" value="${loginUser.memberId}">
	<!-- select option에 들어가는 값 -->
	<script>
		$(function() {
			$.ajax({
				url:"classSelectAjax.do",
				data:{memberId:$("#userId").val()},
			    success:function(list){
			    	console.log(list);
			    	
			    	let value = "";

			    	if(list != ""){
                        for(let i in list){                       	
                            value += "<option value='" + list[i].classNo + "'>" + list[i].className + "</option>";
    
                        }
                    }else{
			    		value += "<option>" + "개설된 강좌가 없습니다."+"</option>"
                        $("#enrollBtn").attr("disabled",true);
                        $("#lectureTitle").attr("readonly",true);

			    	}
                    
			    	
			    	$("#lectureSelect").html(value);
			    	$("#classNo").val(classNo);
			    	
			    },error:function(){
			    	console.log("ajax다 터져서왓다고요")
			    }
			});
			
			 // 선택됐을때 강의번호를 classNo에 숨겨서 담아옴
			 $(document).on('change', '#lectureSelect', function() {
		        let selectedOption = $(this).val();
		       	 console.log(selectedOption);
		       	 
		        $("#classNo").val(selectedOption);
			 });
        });
	</script>
	

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
   
   
   <script>
   	  // 등록버튼 눌렀을때 submit의 함수
      function submit(){

        //강의명, 마감기한, 제목 가져오기
        let pjClassName = $('#lectureSelect option:selected').text()
        let pjDeadline = $('#datepicker').val()
        let pjTitle =$('#lectureTitle').val()
        let pjContent=$('#summernote').summernote('code')
        let pjProfessor=$('#pjProfessor').val()
        
        let classNo=$('#classNo').val()

        console.log($('#summernote').summernote('code'))
        console.log(pjClassName);
        console.log(pjDeadline);
        console.log(pjTitle);
        console.log("이게되나?" + classNo);
		
        
        
        $.ajax({
				url:"professorProjectEnrollForm.do",
				data:{pjClassName:pjClassName
                    , pjDeadline:pjDeadline
                    , pjTitle:pjTitle
                    , pjContent:pjContent
                    , pjProfessor:pjProfessor
                    , classNo:classNo},
			    success:function(result){
					if (result > 0) {
                        // 성공적으로 처리된 경우
                        location.href = "professorPJenrollSuccess.do"; // 페이지 리디렉션
                    } else {
                        // 처리 실패 또는 조건에 맞지 않는 경우
                        console.log("게시글 등록 실패");
                        // 필요한 에러 처리를 진행할 수 있습니다.
                    }
			    },error:function(){
			    	console.log("ajax다 터져서왓다고요")
			    }
			})

      }
   </script>







   <jsp:include page="../common/footer.jsp"/>

</body>
</html>