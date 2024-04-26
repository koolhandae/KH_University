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
    
    #enrollForm>table * {
        margin: 5px;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>

   <div class="content">
      <br><br>
         <div class="innerOuter">
             <h2>공지사항 작성하기</h2>
             <br>
 
             <!-- <form id="enrollForm" method="post" action="insert.no"> -->
             	<div id="enrollForm">
                 <table align="center">
                     <tr>
                         <th><label for="title">제목</label></th>
                         <td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                     </tr>
                     <tr>
                         <th><label for="writer">작성자</label></th>
                         <td>
                         <input type="text" id="writer" class="form-control" value="${loginUser.memberName}" readonly>
                         <input type="hidden" id="writerNo" value="${loginUser.memberNo}" name="noticeWriter">
                         </td>
                     </tr>
                     <tr>
                         <th colspan="2"><label for="content">내용</label></th>
                     </tr>
                     <tr>
                         <th colspan="2">
                             <textarea class="form-control" required name="noticeContent" id="noticeContent" rows="10" style="resize:none;"></textarea>
                         </th>
                     </tr>
                 </table>
                 <br>

                 <div align="center">
                     <button type="submit" class="btn btn-primary" onclick="insertNotice()">등록하기</button>
                     <button type="reset" class="btn btn-danger">취소하기</button>
                 </div>
                 </div>
             <!--</form>-->
         </div>
         <br><br>
         
         <script>

	     	
			     	function insertNotice(){ 
			     		//전역변수 설정
			     		let noticeTitle = $("#title").val();
			     		let noticeWriter = $("#writerNo").val();
			     		let noticeContent = document.getElementById("noticeContent").value;//$("#content").val();
			     		console.log(noticeTitle);
			     		console.log(noticeWriter);
			     		console.log(noticeContent);
			     		
			     		
			     		
			     		$.ajax({
			     			url:"insert.no",
			     			data: {noticeTitle:noticeTitle,
			     				   noticeWriter:noticeWriter,
			     				   noticeContent:noticeContent,
			     				  },
			     			success: function(result){
			     				if(result>0){
			     					//게시글 등록 성공
			     					 console.debug("공지등록폼.js::socket>>",socket)
			     					 if (socket && socket.readyState === 1) {
			   							// 소켓 객체가 존재하고, 웹 소켓 연결이 OPEN 상태일 때 실행될 코드
			                        	// webSocket에 보내기!!(NT,글제목,게시글작성자,글번호)
			                        	let socketMsg = "NT," + noticeTitle + "," + noticeWriter + "," + noticeContent;
			                        	console.debug("NTsssmsg>>", socketMsg);
			                        	socket.send(socketMsg);
			                        }
			     					location.href = "adminNTenrollSuccess.do";
			     				}

			     			},
			     			error: function(){
			     				console.log("실패");	
			     			}
			     		});
			     	}
         	
         
         </script>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>