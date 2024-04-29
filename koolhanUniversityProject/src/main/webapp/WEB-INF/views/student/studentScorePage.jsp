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
      margin-right: 1450px;
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
   #lecture-year{
      font-size: middle;
      font-weight: 600;
      padding-left: 20px;
      padding-right: 10px;
      color: gray;
   }
   #lecture-semester{
   	  font-size: middle;
      font-weight: 600;
      padding-right: 10px;
      color: gray;
   }
   .form-select, .form-select-2{
      border-color: rgb(214, 214, 214);
      border-radius: 5px;
      height: 80%;
      display: block;
      line-height: 80%;
      margin-top: 3px;
      padding-left: 5px;
      margin-right: 10px;
      width: 80px;
   }
   .lList-area{
      background-color: white;
      margin-top: 15px;
      width: 100%;
      height: 500px;
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
	#calResult{
		display: flex;
	    justify-content: center;
	    align-items:  baseline;
	}
	#calResult>dl{
		font-weight:500;
		font-size: larger;
	}
	#calResult>dd{
		color:#e61000; 
		font-weight:700;
		font-size: x-large;
	}
	#calResult>*{
		padding-right:15px;
	}

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	  <input type="hidden" id="studentNo" value="${loginStudent.studentNo}">
      <div class="title-area">
         <div id="title">성적조회</div>
         <div id="mid-title">강의관리 > 성적조회 </div>
      </div>
      <div class="lecture-area">
         <div id="lecture-year">수강년도</div>
         <select class="form-select" aria-label="Default select example">
         </select>
         
         <div id="lecture-semester">학기</div>
         <select class="form-select-2" aria-label="Default select example">
         </select>
         <button type="button" id="chooseBtn" class="btn btn-primary" style="margin: 3px; background-color: #1c4587; border: none;">조회</button>
      </div>
      <div class="lList-area">
         <div class="list-content">
            <div class="list-title" style="margin-bottom: 15px;">성적정보</div>
            <table id="boardList" class="table table-hover" align="center">
               <thead style="height: 40px;  color: #858796;">
                  <tr>
                     <th>강의번호</th>
                     <th>강의이름</th>
                     <th>구분</th>
                     <th>학점</th>
                     <th>중간</th>
                     <th>기말</th>
                     <th>과제</th>
                     <th>출석</th>
                     <th>총점</th>
                     <th>학점</th>
                     <th>성적</th>
                   </tr>
               </thead>
               <tbody>
               </tbody>
            </table>
            <br>
            <div id="calResult">
            </div>
         </div>

      </div>
      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>

<script>
	$(function(){
		$.ajax({
			url:"selectScore.st",
			data:{stuNo:$("#studentNo").val()},
			success:function(result){

				let cList = result.cList;
				let gList = result.gList;
				
				console.log(cList);
				console.log(gList);
				
				console.log("ajax성공");
			
				let gradeYearType = "";
				let gradeTermType = "";
				let value = "";
				let sum = ""; 
				let sumScore = 0; // 총이수학점
				let sumGrade = 0; // 총학점
				
				if(cList != null){
					for(let c in cList){
						gradeYearType += `<option value=\${cList[c].courseYear}>\${cList[c].courseYear}</option>`
						gradeTermType += `<option value=\${cList[c].courseSemester}>\${cList[c].courseSemester}학기</option>`	
					}
				}
				
				if(gList.length == 0){
					value += "<tr>"
				  	         + "<td colspan='11'>등록된 성적이 없습니다.</td>"
					         + "</tr>" 
					 $("#calResult").hide();     
				}else{
					for(let g in gList){
						
						// 이수학점 구하기(문자열이면 계산안되므로 정수형으로바꿔주기)
						sumScore += parseInt(gList[g].classScore);
						console.log("이수학점 : " + sumScore);
						
						 // 학점으로 바꿔주기위함
						 let gradeValue = gList[g].totalPoint;
						 let grade;
						 
						 switch (true) {
					        case gradeValue >= 95:
					            grade = 4.5;
					            break;
					        case gradeValue >= 90:
					            grade = 4.0;
					            break;
					        case gradeValue >= 85:
					            grade = 3.5;
					            break;
					        case gradeValue >= 80:
					            grade = 3.0;
					            break;
					        case gradeValue >= 75:
					            grade = 2.5;
					            break;
					        case gradeValue >= 70:
					            grade = 2.0;
					            break;
					        case gradeValue >= 65:
					            grade = 1.5;
					            break;
					        case gradeValue >= 60:
					            grade = 1.0;
					            break;
					        // Handle default case if needed
					        default:
					            grade = 0;
					            break;
					    }
						 
						// 이수학점*학점
						let gradeScore = parseFloat(gList[g].classScore)*grade;
						console.log("이수학점*학점 : " + gradeScore);
						
						sumGrade += gradeScore;
						console.log("총평점 : " + sumGrade);
						
						
						value +=  "<tr>"
					               + "<td>" + gList[g].classNum + "</td>"
					               + "<td>" + gList[g].className + "</td>"
					               + "<td>" + gList[g].classTypeName + "</td>"
					               + "<td>" + gList[g].classScore + "</td>"
					               + "<td>" + gList[g].midPoint + "</td>"
					               + "<td>" + gList[g].finPoint + "</td>"
					               + "<td>" + gList[g].projectPoint + "</td>"
					               + "<td>" + gList[g].attenPoint + "</td>"
					               + "<td>" + gList[g].totalPoint + "</td>"
					               + "<td>" + grade + "</td>"
					               + "<td style='color:#e61000; font-weight:700;'>" + gList[g].grade + "</td>"
					               + "</tr>"            
						}
						
						sum += "<dl>이수학점</dl>"
			            	+ "<dd>" + sumScore + "</dd>"
			            	+ "<dl>총 평점</dl>"
			            	+ "<dd style='padding-right:20px;'>" + (sumGrade/sumScore).toFixed(1) + "</dd>"
					       		
			            	//toFixed(1):자스에서 소수점 첫째짜리 반올림
			            	console.log(sumGrade/sumScore);     
				}
					
				$(".form-select").html(gradeYearType);
				$(".form-select-2").html(gradeTermType);
				$("#boardList tbody").html(value);
				$("#calResult").show();
				$("#calResult").html(sum);
			
			}, error:function(){
				console.log("ajax실패");
			}
		});
		
		$("#chooseBtn").click(function(){
			const year = $('select.form-select').val();
			const term = $('select.form-select-2').val();
			console.log(year);
			console.log(term);
			let sumScore = 0; // 총이수학점
			let sumGrade = 0; // 총학점
			let sum = "";
			
			$.ajax({
				url:"chooseScore.st",
				data:{year:year,
					  term:term,
					  stuNo:$("#studentNo").val()
					  },
			    success:function(list){
			    	console.log("ajax성공");
			    	console.log(list);
			    	
			    	let value = "";
			    	
			    	if(list.length == 0){
						value += "<tr>"
					  	         + "<td colspan='11'>등록된 성적이 없습니다.</td>"
						         + "</tr>" 
						         
						$("#calResult").hide();
						  
					}else{
						for(let g in list){	

							// 이수학점 구하기(문자열이면 계산안되므로 정수형으로바꿔주기)
							sumScore += parseInt(list[g].classScore);
							console.log("이수학점 : " + sumScore);
							
							 // 학점으로 바꿔주기위함
							 let gradeValue = list[g].totalPoint;
							 let grade;
							 
							 switch (true) {
						        case gradeValue >= 95:
						            grade = 4.5;
						            break;
						        case gradeValue >= 90:
						            grade = 4.0;
						            break;
						        case gradeValue >= 85:
						            grade = 3.5;
						            break;
						        case gradeValue >= 80:
						            grade = 3.0;
						            break;
						        case gradeValue >= 75:
						            grade = 2.5;
						            break;
						        case gradeValue >= 70:
						            grade = 2.0;
						            break;
						        case gradeValue >= 65:
						            grade = 1.5;
						            break;
						        case gradeValue >= 60:
						            grade = 1.0;
						            break;
						        // Handle default case if needed
						        default:
						            grade = 0;
						            break;
						    }
							 
							// 이수학점*학점
							let gradeScore = parseFloat(list[g].classScore)*grade;
							console.log("이수학점*학점 : " + gradeScore);
							
							sumGrade += gradeScore;
							console.log("총평점 : " + sumGrade);
							
							
							value +=  "<tr>"
						               + "<td>" + list[g].classNum + "</td>"
						               + "<td>" + list[g].className + "</td>"
						               + "<td>" + list[g].classTypeName + "</td>"
						               + "<td>" + list[g].classScore + "</td>"
						               + "<td>" + list[g].midPoint + "</td>"
						               + "<td>" + list[g].finPoint + "</td>"
						               + "<td>" + list[g].projectPoint + "</td>"
						               + "<td>" + list[g].attenPoint + "</td>"
						               + "<td>" + list[g].totalPoint + "</td>"
						               + "<td>" + grade + "</td>"
						               + "<td style='color:#e61000; font-weight:700;'>" + list[g].grade + "</td>"
						               + "</tr>"            
							}
							
							sum += "<dl>이수학점</dl>"
				            	+ "<dd>" + sumScore + "</dd>"
				            	+ "<dl>총 평점</dl>"
				            	+ "<dd style='padding-right:20px;'>" + (sumGrade/sumScore).toFixed(1) + "</dd>"
						       		
				            	//toFixed(1):자스에서 소수점 첫째짜리 반올림
				            	console.log(sumGrade/sumScore);  
					}

					$("#boardList tbody").html(value);
					$("#calResult").show();
					$("#calResult").html(sum);
			    	
			    }, error:function(){
			    	console.log("ajax실패");
			    }
				
			})
			
		})
		
	})
</script>
</html>