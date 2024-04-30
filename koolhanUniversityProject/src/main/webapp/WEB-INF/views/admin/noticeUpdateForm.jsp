<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #enrollForm>table {
        width: 100%;
    }
    
    
    /*
    #enrollForm>table * {
        padding: 5px;
    }
    */
    th,td,input{
    	padding: 5px;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <jsp:include page="../common/datePickerNsummernote.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>공지사항 수정하기</h2>
            <br>
				<div id="enrollForm">
           
            	<input type="hidden" name="noticeNo" id="noticeNo" value="${n.noticeNo}">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle}" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" name="noticeWriter" value="${n.noticeWriter}"  readonly></td>
                    	<input type="hidden" id="writerNo" value="${loginUser.memberNo}" name="noticeWriter">
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                       
                    	 <th colspan="2"><textarea id="summernote" name="noticeContent"  class="form-control summernote" style="resize:none;">${n.noticeContent } </textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button class="btn btn-primary" onclick="updateNotice();">수정하기</button>
                    <button type="button" class="btn btn-danger">이전으로</button>
                </div>
        	</div>
        </div>
        <br><br>
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
                                        ['insert',['link','video']],
                                        ['view', ['help']]
                                    ],
                                    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

	                });
	        });
	   </script>
	   
	   <script>
						function updateNotice(){ 
			     		//전역변수 설정
			     		let noticeTitle = $("#title").val();
			     		let noticeWriter = $("#writerNo").val();
			     		let noticeContent = $('#summernote').summernote('code');
			     		let noticeNo = $("#noticeNo").val();
			     		console.log(noticeTitle);
			     		console.log(noticeWriter);
			     		console.log(noticeContent);
			     		
                        $.ajax({
                            url:"noticeUpdate.no",
			     			data: {noticeTitle:noticeTitle,
			     				   noticeWriter:noticeWriter,
			     				   noticeContent:noticeContent,
			     				   noticeNo:noticeNo
			     				  },
			     			success: function(result){
	                        	
			     					if(result>0){
			     						noticeRedirectDetailgogoPage();
			     						
			     					}
			     				}
			     			,error: function(){
			     				console.log("실패");	
			     			}    
                        })

                        function noticeRedirectDetailgogoPage(noticeNo){
                            

                            location.href = "detail.no?nno=" + $("#noticeNo").val();
                        	
                        }
                   
                    }
			     		

			     		
			     	
         	
         
         </script>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>