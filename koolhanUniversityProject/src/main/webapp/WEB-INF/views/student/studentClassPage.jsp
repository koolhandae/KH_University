<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .content{
      padding: 30px;
   }
   .title-area{
      width: 100%;
      height: 50px;
      background-color: white;      
      display: flex;
      line-height: 50px;
      justify-content: space-between;
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
   .lecture-area{
      width: 100%;
      height: 40px;
      background-color: white;    
      display: flex;
      line-height: 40px;
      margin-top: 15px;
   }
   #lecture-title{
      font-size: middle;
      font-weight: 600;
      padding-left: 20px;
      padding-right: 10px;
      color: gray;
   }
   .form-select{
      border-color: rgb(214, 214, 214);
      border-radius: 5px;
      height: 80%;
      display: block;
      line-height: 80%;
      margin-top: 3px;
      padding-left: 5px;
      margin-right: 10px;
      width: 180px;
   }
   .lList-area{
      background-color: white;
      margin-top: 15px;
      width: 100%;
      height: auto;
   }
   .list-content{
      padding: 20px;
   }
   .list-title{
      font-weight: 600;
      color: gray;
   }
   #boardList *{
		text-align: center;
		vertical-align: middle;
	}
   .fa-solid{
      font-size: small;
      margin-right: 18px;
   } 

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	  <input type="hidden" id="studentId" name="studentId" value="${ loginStudent.studentId }">
      <div class="title-area">
         <div id="title">나의 수강 조회</div>
         <div id="mid-title">강의관리 > 나의수강조회 </div>
      </div>
      <div class="lecture-area">
         <div id="lecture-title">강의명</div>
         <select class="form-select" aria-label="Default select example">
         </select>
         <button id="searchCourse" type="button" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">조회</button>
      </div>
      <div class="lList-area">
         <div class="list-content">
            <div class="list-title" style="margin-bottom: 15px;">수강내역</div>
            <table id="boardList" class="table table-hover" align="center">
               <thead style="height: 40px;  color: #858796;">
                  <tr>
                     <th>강의번호</th>
                     <th>유형</th>
                     <th>학점</th>
                     <th>학년</th>
                     <th>학기</th>
                     <th>강의명</th>
                     <th>강의실</th>
                     <th>강의시간</th>
                     <th>수강인원</th>
                     <th>강의실 입장</th>
                   </tr>
               </thead>
               <tbody>
              
               </tbody>
            </table>
         	
         </div>
      </div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
	
	<script>
	$(function(){
		$.ajax({
			url:"selectCourse.st",
			data:{studentId:$("#studentId").val()},
			success:function(list){

				let course = "";
				let value ="";
				
				
				//console.log(list[0].classNum);
				
				for(let c in list){
					
					let courseValue = list[c].classNum;
					let className = list[c].className;

					course += `<option value='' disabled selected hidden>강의명을 선택하세요</option>
		                       <option value=\${courseValue}>\${className}</option>`
		                   
					value += "<tr class='detail'>"
						  + "<td>" + list[c].classNum +"</td>"
						  + "<td>" + list[c].classTypeName +"</td>"
						  + "<td>" + list[c].classScore +"</td>"
						  + "<td>" + list[c].classGrade + "</td>"
						  + "<td>" + list[c].courseSemester +"학기</td>"
						  + "<td>" + list[c].className +"</td>"
						  + "<td>" + list[c].classRoom +"</td>"
						  + "<td>" + list[c].classTime +"</td>"
						  + "<td>" + list[c].classPeople +"</td>"
						  + "<td><button type='button' class='btn btn-primary' style='margin: 3px; background-color: #1c4587; border: none;' >"
						      + "상세보기" + "</button>"
		                      + "</td>"
					      + "<tr>"
				}
				
		           
	            console.log(course);    
				$(".form-select").html(course);
				$("#boardList tbody").html(value);	
	
			}, error:function(){
				console.log("ajax 실패")
			}
		});
		
		$(".form-select").change(function(){
			var selectedValue = $(this).val();
			console.log(selectedValue);
			
			$("#searchCourse").click(function(){
				$.ajax({
					url:"searchCourse.st",
					data:{courseValue:selectedValue},
					success:function(course){
						console.log("ajax성공");
						
						let value = "";
						
						value += "<tr class='detail'>"
							  + "<td>" + course.classNum +"</td>"
							  + "<td>" + course.classTypeName +"</td>"
							  + "<td>" + course.classScore +"</td>"
							  + "<td>" + course.classGrade + "</td>"
							  + "<td>" + course.courseSemester +"학기</td>"
							  + "<td>" + course.className +"</td>"
							  + "<td>" + course.classRoom +"</td>"
							  + "<td>" + course.classTime +"</td>"
							  + "<td>" + course.classPeople +"</td>"
							  + "<td><button type='button' class='btn btn-primary detail' style='margin: 3px; background-color: #1c4587; border: none;' >"
							      + "상세보기" + "</button>"
			                      + "</td>"
						      + "<tr>"
						
						      $("#boardList tbody").html(value);	
						      
					}, error:function(){
						console.log("ajax실패");
					}
				});
			});
		});
		

	});
	
	$(document).on("click", ".detail", function(){
		const classNum = $(this).children().eq(0).text();
		location.href = "notice.co?classNum=" + classNum;
	})
   
	</script>
</body>
</html>