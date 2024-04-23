<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
	 .content{
	      padding: 50px;
	   }
	   .title-area{
	      /*
	      width: 100%;
	      height: 50px;
	      background-color: white;      
	      display: flex;
	      line-height: 50px;
	      justify-content: space-between;
	      */
	      width: 100%;
	      height: 50px;
	      background-color: white;
	      display: flex;
	      line-height: 50px;
	      justify-content: flex-start;
	   }
	   .title-area .home{
	      font-size: 0;
	      width: 37px;
	      height: 54px;
	      display: inline-block;
	      position: relative;
	   }
	   #title{
	      font-size: x-large;
	      font-weight: 600;
	      color: #1c4587;
	      padding-left: 20px;
	      margin-right: 1200px;
	   }
	   #mid-title{
	      font-size:small;
	      padding-right: 20px;
	   }
	   #fin-title{
	      padding-left: 20px;
	      font-size:small;
	   }
	    .lecture-area{
	        width: 100%;
	        height: 40px;
	        background-color: white;    
	        display: flex;
	        line-height: 40px;
	        margin-top: 15px;
	     }
	     #lecture-main-title{
	        font-size: middle;
	        font-weight: 600;
	        padding-left: 20px;
	        padding-right: 10px;
	        color: #1c4587;
	     }
	     #lecture-mid-title{
	        font-size: middle;
	        font-weight: 600;
	        padding-right: 10px;
	        color: gray;
	     }
	     
	   .lList-area{
	      background-color: white;
	      margin-top: 15px;
	      width: 100%;
	      height: auto;
	   }
	   .lecture-navigator{
	      height: 55px;
	      display: flex;
	      margin-top: 15px;
	   }
	   .list-title{
	      font-weight: 600;
	      font-size: larger;
	      color: rgb(82, 81, 81);
	      padding-left: 20px;
	   }
	   .lecture-navigator div{
	      border: 1px solid rgb(201, 201, 201);
	      background-color: white;
	      font-weight: 600;
	      color: gray;
	      text-align: center;
	      vertical-align: middle;
	      width: 100%;
	      margin: 1px;
	      line-height: 53px;
	      cursor: pointer;
	   }
	   #notice:hover, #classPlan:hover, #board:hover, #project:hover{
	      background-color: #1c4587;
	      color: white;
	   }
	   #boardList, #planList *{
			text-align: center;
			vertical-align: middle;
		}
	   #boardList{
	      margin-block-end: auto;
	   }
	   #notice-area{
	      padding-left: 100px;
	      padding-right: 100px;
	      padding-top: 30px;
	      padding-bottom: 30px;
	   }
	   #planList{
	      border-bottom: 1px solid rgb(156, 155, 155);
	   }
	   #planList thead{
	      background-color: #1c4587;
	      color: white;
	   }
	   .project-area{
	      padding-top: 30px;
	      padding-left: 100px;
	      padding-right: 100px;
	      padding-bottom: 30px;
	      display: flex;
	   }
	   .project-area div{
	      border: 2px solid rgb(231, 231, 231);
	      border-radius: 10px;
	      width: 100%;
	      height: 200px;
	      margin: 10px;
	      text-align: center;
	      font-size: x-large;
	      color: rgb(82, 81, 81);
	      font-weight: 600;
	   }
	   #ing-project, #miss-project, #done-project{
	    display: flex;
	    flex-direction: column;
	    flex-wrap: wrap;
	    align-content: space-around;
	    justify-content: space-evenly;
	    align-items: center;
	   }
	   #ing-project:hover, #miss-project:hover, #done-project:hover{
	   	cursor: pointer;
	   }
	   .project-btn, .projectShow-btn{
	      box-sizing: border-box;
	      padding-top: 8px;
	      cursor: pointer;
	   }
	   .fa-solid{
	      font-size: small;
	      margin-right: 18px;
	   } 
	   .input-file-button{
	      padding: 5px;
	      border-color:rgb(61, 61, 61);
	      border: 2px dashed;
	      border-radius: 4px;
	      cursor: pointer;
	      width:300px;
	    margin-top: -5px;
	   }
	   #img-notice{
	      color: rgb(233, 0, 0);
	      font-size: small;
	      padding: 10px;
	      text-align: right;
	   }
	   .list-main-title{
	      display: flex;
	      justify-content: space-between;
	   }
	   .pagenation{
	      justify-content: center;
	   }
	
	   .pagination.pagination-rounded-flat .page-item .page-link, a {
	      border: none;
	      border-radius: 50px;
	   }
	
	   .page-link.active {
	    background-color: #1c4587 !important;
	    color: white !important;
	  }
	 #title:hover{
	   cursor: pointer;
	 }
	 #tablearea{
	   padding-left: 100px;
	   padding-right: 100px;
	 }
	 #ing-project{
		border: 4px solid #777777;
	 }
	 
</style>
</head>
<body>
<jsp:include page="../common/header_with_sidebar.jsp"/>
    <c:if test="${not empty alertMsg}">
				<script>
					$(function () {
						Swal.fire({
							icon: '${alertMsg.icon}',
							title: '${alertMsg.title}',
							text: '${alertMsg.text}',
						})
					});
				</script>
				<c:remove var="alertMsg" scope="session" />
	</c:if>
	
    <div class="content">
		<input type="hidden" value="${ classNum }" id="classNum">
        <div class="title-area">
			<div id="title" onclick="location.href='showCourse.st'">나의 수강 조회</div>
			
			<div id="mid-title">나의강의실</div>
			<div>></div>
			<div id="fin-title">나의수강조회</div>
        </div>
		<div class="lecture-area">
			<div id="lecture-main-title">${className}</div>
			<div id="lecture-mid-title">강의실</div>
		</div>
		<div class="lecture-navigator">
			<div id="notice" class="lec-nav-item">공지사항</div>
			<div id="classPlan" class="lec-nav-item">강의계획서</div>
			<div id="board" class="lec-nav-item">자유게시판</div>
			<div id="project" class="lec-nav-item" style="background-color: #1c4587; color: white;">과제게시판</div>
		</div>
        
      	<div class="lList-area">
      	
		    <div class="project-area">
		    	<input type="hidden" id="classNum" value="${classNum}">
		    	<input type="hidden" id="studentNo" value="${studentNo}">
			
				<div id="ing-project">
					<img width="80" height="80" src="https://img.icons8.com/material-outlined/96/FCA819/no-entry.png" alt="no-entry"/>
					<span>미완료 과제 ${pjCount}건</span>
				</div>
				<div id="miss-project">
					<img width="100" height="100" src="https://img.icons8.com/sf-regular/100/BB0505/cancel.png" alt="cancel"/>
					<span style="padding-bottom: 10px";>누락된 과제 ${pjCountMiss}건</span>
				</div>
				<div id="done-project">
					<img width="75" height="75" src="https://img.icons8.com/metro/80/64A11F/checked.png" alt="checked"/>
					<span>제출완료 ${pjCountDone}건</span>
				</div>
			</div>
			<div id="tablearea">
				<table id="boardList" class="table" align="center">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>과제안내</th>
							<th>첨부파일</th>
							<th>진행상황</th>
							<th>제출</th>
							<th>마감일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${ empty spList }">
							<tr colspan="7" style="text-align: center !important;">
								<td colspan="7" style="text-align: center !important;">등록된 과제가 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="sp" items="${ spList }">
							<tr>
								<td>${sp.rnum}</td>
								<input type="hidden" class="stp_pj_no" value="${sp.stpPjNo}">
								<td>${sp.pjTitle}</td>
								<td class="projectShow-btn" id="projectShow-btn">
									<img width='30' height='30' src='https://img.icons8.com/pastel-glyph/128/737373/search--v2.png'>
								</td>
								<td>
									<label class="input-file-button" for="input-file-${sp.rnum}">
										upload-file
									<input type="file" class="input-file" id="input-file-${sp.rnum}" style="display:none">
									</label>
								</td>
								<td style="color: rgb(252 168 25); font-weight: 800;">진행중</td>
								<td id="project-btn" class="project-btn">
									<img width="30" height="30" src="https://img.icons8.com/fluency-systems-regular/30/1C4587/nui2.png" alt="nui2"/>
								</td>
								<td>${sp.pjDeadline}</td>
							</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
					
				</table>
				<div id="img-notice">
					<span>* 첨부파일 제출시 제목은 "학번_과제 제목" 형식 으로 제출바랍니다</span>
				</div>
			</div>
        	<br>
        </div>
   </div>

   <script>
   	$(document).ready(function(){
 		  $(".projectShow-btn").click(function(){
  		  var pjno = $(this).siblings("input[type='hidden']").val();
  		   
  		  console.log(pjno);
 			  location.href='projectView.st?pjno=' + pjno;
 		  })
   	})
   </script>
   
   
   <!-- 누락과제 페이지로 이동 -->
   <script>
   $(document).ready(function(){
       $("#miss-project").click(function(){
   			location.href="projectNone.st";
   		})
   })
   </script>

	<!-- 완료 과제 페이지로 이동 -->
   <script>
   		$(document).ready(function(){
   			$("#done-project").click(function(){
   				location.href="projectDone.st";
   			})
   		})
   </script>
   
   <!-- 진행 과제 페이지로 이동 -->
   
   <script>
   		$(document).ready(function(){
   			$("#ing-project").click(function(){
   				location.href="project.st";
   			})
   		})
   </script>
    

	<!--  과제 제출시 첨부파일 이름 담기-->
   <script>
 	$(document).ready(function(){
 		

	   $(document).on("change", ".input-file", function(){
		    // 파일 값 얻어오기
		     var files = $(this).prop('files');
		    
		    console.log("files" + files);
		    console.log($(".project-btn")[0]);
		    
		    // 갖고갈 데이터값 
		    var pjno = $(this).closest("tr").find(".stp_pj_no").val();
		    var inputFile = files[0]; 
		    
		    console.log(inputFile);
		    console.log(files[0].name);

		    console.log("files[0].name: " + files[0].name);
		    console.log("Text inside label found using closest(): " + $(this).closest("label").text());

		    // 등록시 파일 이름 변경
	    	$(this).closest("label").text(files[0].name);
	    	
		    
	    	$(document).on("click", ".project-btn", function() {    
		    	
			    if(inputFile != null || inputFile != ""){
			    		console.log("첨부성공");
			    		
			    		var formData = new FormData();
			    		
			    		// 파일 및 값 담아서 가져감
				        //ajax로 파일 처리시 formData 사용
				        formData.append("file", inputFile);
				        formData.append("pjno", pjno);
			    			
				    
				        $.ajax({
				            url: "enrollProject.st",
				            type: "POST",
				            data: formData,
				            processData: false,
				            contentType: false,
				            success: function(response){

				            	if(response != null){
				            		 location.href = "projectDoneView.st";
				       				       
									}else {
				                	
					                	Swal.fire({
					 			            icon: 'warning',
					 			            text: "과제 제출에 실패하셨습니다!" 
				 			        	});
									}
				            	
				            },
				            error: function(){
				                console.log("ajax실패");

				            }
				        });
			    } else {		       
			        Swal.fire({
			            icon: 'warning',
			            text: '첨부파일 등록은 필수입니다. 첨부파일을 업로드해주세요' 
			        });
			    }
			    		   
		    });
		});
 	})

   </script> 

	<script>
		$(document).on("click", ".project-btn", function() {  
		    
			// 동적으로 선택한 버튼의 형제요소인 inputFile을 가져옴 
		    var inputFile = $(this).closest("tr").find(".input-file");

		    // Check if any file is selected
		    if (inputFile.val() == "") {

				console.log("없다");
				 Swal.fire({
			            icon: 'warning',
			            text: '첨부파일 등록은 필수입니다. 첨부파일을 업로드해주세요' 
			        });
			}else{
				console.log("있다");
			}
	})

	</script>
	
	<!-- 다시 공지사항으로 이동 -->
   <script>
      $(document).ready(function(){
         $("#notice").click(function(){
            var classNum = $("#classNum").val(); // classNum 값을 가져옴
            location.href = "notice.co?classNum=" + classNum;
         })
      })
   </script>
   
   	<!-- 자유게시판 클릭시 이동 -->
   	<script>
   	$(document).on("click","#board",function(){ 		
          location.href = "board.co";
   	})
   	</script>
   	
   	<!-- 과제게시판 클릭시 이동 -->
   	<script>
   	$(document).on("click","#project",function(){ 		
          console.log("되냐?")
          location.href = "project.st";
   	})
   	</script>
   
   <!-- 강의계획서 div로 이동 -->
   <script>
	   	$(document).ready(function(){
   			$("#classPlan").click(function(){
  				var classNum = $(".content").find("#classNum").val();  	
  				
   				console.log(classNum); 			
   			 $.ajax({
   				 url:"classPlan.co",
   				 data:{classNum:classNum},
   				 success:function(c){ 
   					 console.log("ajax통신성공");
					 var c = c;
					 var value ="";
					 
					 var originName = c.originName;
					 var changeName = c.changeName;
					 
					 
					 value += "<div class='list-title' style='margin-bottom: 20px;'>강의계획서</div>" +
				                 "<table id='planList' class='table' align='center'>" +
				                 "<thead>" +
				                 "<tr>" +
				                 "<th>학점</th>" +
				                 "<th>강의실</th>" +
				                 "<th>강의시간</th>" +
				                 "<th>대표교수</th>" +
				                 "<th>강의계획서</th>" +
				                 "</tr>" +
				                 "</thead>" +
				                 "<tbody>" +
				                 "<tr>" +
				                 "<td>" + c.classScore + "</td>" +
				                 "<td>" + c.classRoom + "</td>" +
				                 "<td>" + c.classTime + "</td>" +
				                 "<td>" + c.memberName + "</td>";
			
                             if (changeName) {
						            value += "<td id='fileTag'>" +
						                     "<img width='30' height='30' src='https://img.icons8.com/pastel-glyph/128/737373/search--v2.png'>" +
						                     "</td>";
						        } else {
						            value += "<td>X</td>";
						        }
					
						        value += "</tr>" +
						                 "</tbody>" +
						                 "</table>" +
						                 "</div>" +
                                   "<br>" +
                                   "<div class='card-body' style='display:none;'>" +
                                   "<div>"
   					 
   					 $("#notice-area").html(value);
						      
   					 
   				 }, error:function(){
   					 console.log("ajax통신실패");
   				 }
   			 });
   			})
   		})
   </script>
   
   <script>
   $(document).ready(function(){
	   
	   $(document).on("click", "#fileTag", function(){
           var classNum = $(".content").find("#classNum").val();  	

           $.ajax({
   			 url:"classPlanView.st",
   			 data:{classNum:classNum},
   			 success:function(file){
   				 console.log("되냐고");
   				 console.log(file);
   				 console.log()
   				 value = "";
   				 
   				 value += "<iframe src='" +  file + "'style='width:100%; height:700px;'></iframe>"	   				 

   				$(".card-body").html(value);
   				$(".card-body").show();
   			    
   			 }, error:function(){
   				 console.log("안되냐고");
   			 }
   		 })	 
        })
   })
   </script>
	
	

   
<jsp:include page="../common/footer.jsp"/>
</body>
</html>