<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#studentList, #memberList {
	text-align: center;
	width: 500px;
}

#studentList>tbody>tr:hover, #memberList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#studentSearchForm, #memberSearchForm {
	width: 90%;
	margin: auto;
	display: flex;
}

#studentSearchForm>*, #memberSearchForm>* {
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: auto;
	min-width: 250px;
}

.searchBtn {
	width: auto;
}

#studentPaging li:hover, #memberPaging li:hover {
	cursor: pointer;
}

[class$="-nav-item"]{
	border : none; 
}
[class$="-navigator"]{
	display: flex;
	justify-content: space-around;
}
</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
		<br>
		<br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>전체 회원 조회</h2>
			<br> <br>
			<div id="userOuter"
				style="display: flex; justify-content: space-between;">
				<div id="students">
					<div id="studentSearchForm" style="display:flex; justify-content: space-around;">
						<div class="text">
							<input type="text" id="studentSearchInput" class="form-control"
								placeholder="검색할 학생의 이름을 입력하세요">
						</div>
						<button type="button" class="searchBtn btn btn-secondary" onclick="loadStudentPage(1)">검색</button>
						<input id="statusIdentifier" type="hidden" value="all"/>
   						<button type="button" id="draw" class="btn btn-primary">통계 그래프</button>
					</div>
					<canvas id="myChart" width="400" height="400" style="display:none; padding: 20px;"></canvas>
					<div class="student-navigator">
						<button id="allStudent" class="stu-nav-item btn" onclick="changeStudentStatus('all');"
							style="background-color: #1c4587; color: white;">전체</button>
						<button id="attendingStudent" class="stu-nav-item btn" onclick="changeStudentStatus('Y');">재학</button>
						<button id="dropOut" class="stu-nav-item btn" onclick="changeStudentStatus('N');">자퇴</button>
						<button id="absence" class="stu-nav-item btn" onclick="changeStudentStatus('H');">휴학</button>
						<button id="expelled" class="stu-nav-item btn" onclick="changeStudentStatus('Z');">제적</button>
						<button id="grad" class="stu-nav-item btn" onclick="changeStudentStatus('J');">졸업</button>
					</div>
					
					<table id="studentList" class="table table-hover" align="center">
					<div style="display:flex; justify-content: space-between;">
						<div id="studentSearchName" align="left" style="margin-right:20px"></div>
						<div id="studentSearchCount" align="right" style="margin-right:20px"></div>
					</div>
					
						<thead>
							<tr>
								<th>이름</th>
								<th>ID</th>
								<th>연락처</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="s" items="${sList}">
								<tr>
									<td>${s.studentName}</td>
									<td>${s.studentId}</td>
									<td>${s.stPhone}</td>
									<td>${s.stStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<br>

					<div id="pagingArea">
						<ul id="studentPaging"
							class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
							<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							<c:forEach var="sp" begin="${spi.startPage}" end="${spi.endPage}">
								<c:choose>
									<c:when test="${spi.currentPage eq sp}">
										<li class="page-item disabled"><a
											class="page-link active">${sp}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link"
											onclick="loadStudentPage('${sp}');">${sp}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${spi.currentPage ne spi.maxPage }">
								<li class="page-item"><a class="page-link" onclick="loadStudentPage('${spi.currentPage + 1}')">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>


				<div id="members">
					<div id="memberSearchForm"  style="display:flex; justify-content: space-around;">
						<div class="text">
							<input type="text" class="form-control" id="memberSearchInput"
								placeholder="검색할 교직원의 이름을 입력하세요.">
						</div>
						<button type="submit" class="searchBtn btn btn-secondary" onclick="loadMemberPage(1)">검색</button>
					</div>
					
					<div class="member-navigator">
						<button id="allMember" class="mem-nav-item btn"
							style="background-color: #1c4587; color: white;" onclick="changeMemberStatus('all');">전체</button>
						<button id="prof" class="mem-nav-item btn" onclick="changeMemberStatus('P');">교수</button>
						<button id="admin" class="mem-nav-item btn" onclick="changeMemberStatus('A');">교직원</button>
					</div>
					<input id="positionIdentifier" type="hidden" value="all"/>
					<table id="memberList" class="table table-hover" align="center">
						<div style="display:flex; justify-content: space-between;">
							<div id="memberSearchName" align="left" style="margin-right:20px"></div>
							<div id="memberSearchCount" align="right" style="margin-right:20px"></div>
						</div>
						<thead>
							<tr>
								<th>이름</th>
								<th>ID</th>
								<th>연락처</th>
								<th>직무</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${mList}">
								<tr>
									<td>${m.memberName}</td>
									<td>${m.memberId}</td>
									<td>${m.mePhone}</td>
									<td>${m.meType}</td>
									<td>${m.meStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<br>

					<div id="pagingAreaMe">
						<ul id="memberPaging"
							class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
							<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							<c:forEach var="mp" begin="${mpi.startPage}" end="${mpi.endPage}">
								<c:choose>
									<c:when test="${mpi.currentPage eq mp}">
										<li class="page-item disabled"><a
											class="page-link active">${mp}</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link" onclick="loadMemberPage('${mp}');">${mp}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
								<li class="page-item"><a class="page-link" onclick="loadMemberPage('${mpi.currentPage + 1}')">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
			<br clear="both">
			<br>
		</div>
	</div>

	<script>
	
		function changeStudentStatus(status){
			$("#studentSearchInput").empty;
			$("#statusIdentifier").val(status);
			loadStudentPage(1);
		}

		function changeMemberStatus(status){
			$("#memberSearchInput").empty;
			$("#positionIdentifier").val(status);
			loadMemberPage(1);
		}
	
	
   		function loadStudentPage(cpage){
   			$.ajax({
   				url:"userList.stu",
   				data:{
   					cpage: cpage,
   					stStatus: $("#statusIdentifier").val(),
   					studentName: $("#studentSearchInput").val(),
   				},
   				success:function(response){
   					if(response.sList.length === 0){
   						$("#studentList tbody").html("<tr><td colspan='4'>조건에 부합하는 학생이 없습니다.</td></tr>");
   						$("#studentPaging").empty(); 
   						$("#studentSearchInput").val("");
   						$("#studentSearchName").html("검색 : " + response.searchName);
   						$("#studentSearchCount").html(response.listCount + "개의 검색결과");
   					}else{
   						
	   				 	let studentTableValue = "";
	   				 	for(let s of response.sList){
	   				 		studentTableValue += "<tr>"
	   			                  +  "<td>" + s.studentName + "</td>"
	   			                  +  "<td>" + s.studentId + "</td>"
	   			                  +  "<td>" + s.stPhone + "</td>"
	   			                  +  "<td>" + s.stStatus + "</td>"
	   			                  +  "</tr>";
	   				 	}
	   				 	$("#studentList tbody").html(studentTableValue);
	   				 	
	   				 	let studentPagination = "";
	    	            let pageSize = 3;
	    	            let totalPage = response.spi.maxPage;
	    	            let currentGroup = Math.floor((response.spi.currentPage - 1) / pageSize);
	    	            let groupStart = currentGroup * pageSize + 1;
	    	            let groupEnd = Math.min(groupStart + pageSize - 1, totalPage);
	
	    	            if (response.spi.currentPage > 1) {
	    	            	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (response.spi.currentPage - 1) + ')">&laquo;</a></li>';
	    	            }else {
	 	   					studentPagination += '<li class="page-item disabled"><a class="page-link">&laquo;</a></li>';
	       				}
	
	    	            for (let i = groupStart; i <= groupEnd; i++) {
	    	                if (i === response.spi.currentPage) {
	    	                	studentPagination += '<li class="page-item"><a class="page-link active">' + i + '</a></li>';
	    	                } else {
	    	                	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + i + ')">' + i + '</a></li>';
	    	                }
	    	            }
	
	    	            if (response.spi.currentPage < totalPage) {
	    	            	studentPagination += '<li class="page-item"><a class="page-link" onclick="loadStudentPage(' + (response.spi.currentPage + 1) + ')">&raquo;</a></li>';
	    	            }else {
	 	   					studentPagination += '<li class="page-item disabled"><a class="page-link">&raquo;</a></li>';
	       				}
	
	    	            $("#studentPaging").html(studentPagination);
	    	            $("#studentSearchInput").val("");
	    	            $("#studentSearchName").html("검색 : " + response.searchName);
	    	            $("#studentSearchCount").html(response.listCount + "개 검색결과");
   					}
   				},
   				error:function(){
   					console.log("ajax tongsinsilpae")
   				},
   			})
   		}
   		
   		function loadMemberPage(cpage){
   			$.ajax({
   				url:"userList.me",
   				data:{
   					cpage: cpage,
   					meType: $("#positionIdentifier").val(),
   					memberName: $("#memberSearchInput").val(),
   				},
   				success:function(response){
   					if(response.mList.length === 0){
   						$("#memberList tbody").html("<tr><td colspan='5'>조건에 부합하는 교수 / 교직원이 없습니다.</td></tr>");
   						$("#memberPaging").empty(); 
   						$("#memberSearchInput").val("");
   						$("#memberSearchName").html("검색 : " + response.searchName);
   						$("#memberSearchCount").html(response.listCount + "개의 검색결과");
   					}else{
	   						
	   					let memberTableValue = "";
	   				 	for(let m of response.mList){
	   				 		memberTableValue += "<tr>"
	   			                  +  "<td>" + m.memberName + "</td>"
	   			                  +  "<td>" + m.memberId + "</td>"
	   			                  +  "<td>" + m.mePhone + "</td>"
	   			                  +  "<td>" + m.meStatus + "</td>"
	   			                  +  "<td>" + m.meType + "</td>"
	   			                  +  "</tr>";
	   				 	}
	   				 	$("#memberList tbody").html(memberTableValue);
   				 	
		   				let memberPagination = "";
		   	            let pageSize = 3;
		   	            let totalPage = response.mpi.maxPage;
		   	            let currentGroup = Math.floor((response.mpi.currentPage - 1) / pageSize);
		   	            let groupStart = currentGroup * pageSize + 1;
		   	            let groupEnd = Math.min(groupStart + pageSize - 1, totalPage);

		   	            if (response.mpi.currentPage > 1) {
		   	                memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (response.mpi.currentPage - 1) + ')">&laquo;</a></li>';
		   	            }else{
		   	            	memberPagination += '<li class="page-item disabled"><a class="page-link" >&laquo;</a></li>';
		   	            }
		
		   	            for (let i = groupStart; i <= groupEnd; i++) {
		   	                if (i === response.mpi.currentPage) {
		   	                    memberPagination += '<li class="page-item"><a class="page-link active">' + i + '</a></li>';
		   	                } else {
		   	                    memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + i + ')">' + i + '</a></li>';
		   	                }
		   	            }
		
		   	            if (response.mpi.currentPage < totalPage) {
		   	                memberPagination += '<li class="page-item"><a class="page-link" onclick="loadMemberPage(' + (response.mpi.currentPage + 1) + ')">&raquo;</a></li>';
		   	            }else{
		   	                memberPagination += '<li class="page-item disabled"><a class="page-link" >&raquo;</a></li>';
		   	            	
		   	            }
		
		   	            $("#memberPaging").html(memberPagination);
		   	         	$("#memberSearchInput").val("");
   						$("#memberSearchName").html("검색 : " + response.searchName);
   						$("#memberSearchCount").html(response.listCount + "개의 검색결과");
   					}
   				},
   				error:function(){
   					console.log("ajax tongsinsilpae")
   				},
   			})
   		}
   		
		$(".stu-nav-item").click(function() {
			$(".stu-nav-item").not(this).css({
				"background-color" : "white",
				"color" : "black"
			});
			$(this).css({
				"background-color" : "#1c4587",
				"color" : "white"
			})
		});
		$(".mem-nav-item").click(function() {
			$(".mem-nav-item").not(this).css({
				"background-color" : "white",
				"color" : "black"
			});
			$(this).css({
				"background-color" : "#1c4587",
				"color" : "white"
			})
		});

		$("#draw").click(function(){
    		$.ajax({
    			url:"statistic.stu",
    			success:function(response){
    				$("#myChart").css("display", "block");
    				var ctx = document.getElementById('myChart').getContext('2d');
    		        var myChart = new Chart(ctx, {
    		            type: 'pie',
    		            data: {
    		                labels: ['재학생', '휴학생', '제적생', '졸업생', '자퇴생'],
    		                datasets: [{
    		                    label: '학생 통계',
    		                    data: [response.attendStu, response.absenceStu, response.expelledStu, response.gradStu, response.leaveStu],
    		                    backgroundColor: [
    		                    	'rgba(255, 99, 132, 0.5)',
    		                        'rgba(54, 162, 235, 0.5)',
    		                        'rgba(255, 206, 86, 0.5)',
    		                        'rgba(75, 192, 192, 0.5)',
    		                        'rgba(153, 102, 255, 0.5)'
    		                    ],
    		                    borderColor: [
    		                        'rgba(255, 99, 132, 1)',
    		                        'rgba(54, 162, 235, 1)',
    		                        'rgba(255, 206, 86, 1)',
    		                        'rgba(75, 192, 192, 1)',
    		                        'rgba(153, 102, 255, 1)'
    		                        ],
    		                    borderWidth: 1,
    		                    options: {
    		                        
    		                    }
    		                }]
    		            },
    		        });	
    			},
    			error:function(){
    				console.log("sdsdsd")
    			},
    		});
    	});
    </script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>