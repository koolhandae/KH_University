<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- calender용  -->
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script> -->

<!--부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	margin: 0 auto;
	background-color: white;
	width: 100%;
	padding-left: 100px;
	padding-right: 100px;
	padding-top: 50px;
	padding-bottom: 50px;
}

.content {
	padding-left: 50px;
	padding-right: 40px;
	padding-top: 30px;
	padding-bottom: 30px;
}

.title-area {
	width: 100%;
	height: 50px;
	background-color: white;
	display: flex;
	line-height: 30px;
	justify-content: flex-start;
	margin-bottom:15px;
}

.title-area div {
	padding-top: 10px;
}

#title {
	font-size: x-large;
	font-weight: 600;
	color: #1c4587;
	padding-left: 30px;
	margin-right: 1400px;
  padding-top: revert-layer;
}

#mid-title {
	font-size: small;
	padding-right: 20px;
  padding-top: revert-layer;
}

#fin-title {
	padding-left: 20px;
	font-size: small;
  padding-top: revert-layer;
}

/* 달력 스타일 변경 (테두리)*/
.fc-button-group .fc-next-button, .fc-button-group .fc-prev-button {
	border: 0px;
}

.fc-theme-standard th {
	padding: 5px;
}

.fc-scrollgrid-section>td {
	padding: 5px;
}

.fc .fc-daygrid-day-frame {
	padding: 5px;
}

.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child) {
	border: 0px;
}

.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child) {
	border: 0px;
}

/*제목*/
.fc .fc-toolbar-title {
	color: #4d4d4d;
	font-weight: 900;
	font-size: xx-large;
}

.fc-toolbar-chunk {
    display: flex;     
    align-items: center; 
}

.fc .fc-scrollgrid-liquid {
	border-top: 5px solid #676767;;
}
/*요일*/
.fc-col-header-cell-cushion {
	color: #000;
}

.fc-col-header-cell-cushion:hover {
	text-decoration: none;
	color: #000;
}
/*일자*/
.fc-daygrid-day-number {
	color: #000;
	font-size: 1em;
}

/*종일제목*/
.fc-event-title.fc-sticky {
	
}
/*more버튼*/
.fc-daygrid-more-link.fc-more-link {
	color: #000;
}
/*일정시간*/
.fc-daygrid-event>.fc-event-time {
	color: #000;
}
/*시간제목*/
.fc-daygrid-dot-event>.fc-event-title {
	color: #000 !important;
}

/*month/week/day*/
.fc-button-active {
	background-color: white !important;
	font-weight: bold !important;
	font-size: x-large !important;
	color: #1c4587 !important;
	outline: none !important;
	box-shadow: none !important;
}
/* today 버튼*/
.fc-today-button {
	border: 0px !important;
	background-color: #f27474 !important;
	border-radius: 5px !important;
	border-radius: 150px !important;
	outline: none !important;
	box-shadow: none !important;
}
/* 추가버튼 */
.fc-addBtn-button {
	background-color: #f6c23e !important;
	border-color: #f6c23e !important;
	border-radius: 100px !important;
	color: white !important;
	width: 38px !important;
	margin-right: 5px !important;
	outline: none !important;
	box-shadow: none !important;
}
/*기본버튼색상*/
.fc .fc-button-group>.fc-button, .fc-today-button {
	background-color: white;
	color: #464646;
	font-weight: bold;
	outline: none !important;
	box-shadow: none !important;
}
.fc-prev-button, .fc-next-button {
	background-color: white !important;
  border: none !important;
}
.fc-icon{
  color: #464646;
}
/*일요일 색상*/
.fc-day-sun a {
	color: red;
	font-weight: 600;
}
/*토요일 색상*/
.fc-day-sat a {
	color: rgb(0, 0, 147);
}

.fc-day {
	font-weight: 400;
}

/*모달 푸터*/
.modal-footer {
	display: inline-block;
}
/* 모달 스타일변경 */
.modal-body {
	margin-left: 20px;
}

.modal-body>td * {
	margin-bottom: 10px;
	border: 1px solid #cdcdcd;
	border-radius: 5px;
	height: 30px;
}

#modaltable tbody * {
	padding-right: 15px;
	margin-bottom: 4px !important;
	margin-top: 4px !important;
}

#modaltable tbody td * {
	border: 1px solid #cdcdcd;
	border-radius: 5px;
	height: 30px;
	padding-left: 5px;
	padding-right: 5px;
	width: -webkit-fill-available;
}

#testTitle {
	font-size: small;
	color: #3b3b3b;
	border: none;
	display: flex;
	justify-content: right;
	height: 15px;
	margin-top: 5px;
}

/* color 태그 스타일 변경 */
#modaltable tbody #selectColor {
	width: 38px;
	height: 30px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: transparent;
	border: none;
	border-radius: 30px;
	padding-left: 0px !important;
}

#selectColor::-webkit-color-swatch {
	border-radius: 30px;
	border: 2px solid rgb(174, 174, 174);
}

#modaltable {
	border: none !important;
}
.navbar, .navbar-nav{
	display:flex !important;
}
</style>
</head>
<body>	
<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
    	<input type="hidden" id="studentNo" value="${loginStudent.studentNo}">
		<div class="title-area">
			<div id="title" onclick="location.href=''">나의 캘린더</div>
			<div id="mid-title">마이페이지</div>
			<div style="padding-top: 0px;">></div>
			<div id="fin-title">나의 캘린더</div>
		</div>

	
	<div id='calendar'>

	</div>
</div>

	<!-- 부트스트랩 모달 일정추가 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 등록하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table id="modaltable">
						<tr>
							<th>일정제목 :</th>
							<td><input type="text" id="modal_title"></td>
						</tr>
						<tr>
							<th>시작날짜 :</th>
							<td><input type="date" id="start"></td>
						</tr>
						<tr>
							<th>종료날짜 :</th>
							<td><input type="date" id="end"></td>
						</tr>
						<tr>
							<th>배경색상 :</th>
							<td><input type="color" id="selectColor"></td>
						</tr>
					</table>
					<br> <span id="testTitle">🔔 자격증일정을 확인하고 일정에 등록해보세요!</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBtn">취소</button>
					<button type="button" class="btn btn-primary" id="addSch"
						style="background-color: #1c4587; border-color: #1c4587;">
						추가</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
<script>

    document.addEventListener('DOMContentLoaded', function() {
      $(".fc-dayGridYear-button").text("year");
      var calendarEl = document.getElementById('calendar');
      // 풀캘린더 생성
      var calendar = new FullCalendar.Calendar(calendarEl, {
        // 구글캘린더API 키값
        googleCalendarApiKey : 'AIzaSyC4CerWedE4ejM_0st4KefILKimQ2SPkDI',
      
        //locale: 'ko', // 로컬설정
        height:'1000px', // 높이 설정
        expandRows:true, // 화면에 맞게 높이 재설정
        slotMinTime: '00:00', // Day 캘린더에서 시작 시간        
        slotMaxTime: '24:00', // Day 캘린더에서 종료 시작
        customButtons:{ // 커스텀버튼추가
          addBtn:{
            text:" + ",
            click : function(e){
              $("#modal_title").val("");
              $("#start").val("");
              $("#end").val("");
              $("#selectColor").val("");  
              // click function 이용하여 모달열기
              $("#exampleModal").modal("show");
            }
          },
            saveBtn:{ // 저장버튼
              text:"저장"
          }
        },
        // 헤더 툴바
        headerToolbar: {
			left: 'dayGridYear,dayGridMonth,timeGridWeek',
          // left: 'prev,next today',
          center: 'prev title next',
          right: 'today addBtn'
        },
        initialView: 'dayGridMonth', // 처음 보이는 캘린더 화면 (기본설정:달)
        editable: true, // 기존에 입력된 이벤트 드래그로 움직임
        selectable: true, // 날짜 드래그
        dayMaxEvents: true, // allow "more" link when too many events
        
        // 날짜 클릭 혹은 드래그시 팝업창으로 이벤트 표시(모달로변경예정)
        select: function (e) {
            insertModalOpen(e);
        },
        
        eventAdd:function(e){

        },

        // 이벤트 클릭시 모달 호출
        eventClick:function(e){
          insertModalOpen(e);
        }, 

        // 이벤트 수정시
        eventChange:function(e){
          insertModalOpen(e);
        },

        // 이벤트 삭제시
        eventRemove:function(e){
          insertModalOpen(e);
        },

        eventSources :[ 
            {  
            	googleCalendarId:'ko.south_korea#holiday@group.v.calendar.google.com', 
                color:'white',
                textColor:'red'
            },
        ],
        
        events: [
    	   {
             title: 'All Day Event',
             start: '2024-03-01'
           },
        
        	]
        
      });
           
      function insertModalOpen(e){
          if(e.event != undefined){
        	  
        	  $("#modal_title").val(e.event.title);
        	  $("#start").val(e.event.startStr);
        	  $("#end").val(e.event.endStr);
        	  $("#selectColor").val(e.event.backgroundColor);
        	  $("#exampleModal").modal("show");
        	  
          }else{
      	  
        	  // instaneof Date(date타입이 맞는지 확인)
              // toISOString // 문자열 형식으로 변환 -> YYYY-MM-DDTHH:mm:ss.sssZ
              // split('T')[0] // T 즉 날짜 / 시간으로 배열을 만들어서 그중 0번째 배열인 날짜만 잘라줌
	          endDate = e.end instanceof Date ? e.end.toISOString().split('T')[0] : e.startStr;
			
	          $("#modal_title").val("");
	          $("#start").val(e.startStr);
	          $("#end").val(endDate);
	          $("#selectColor").val("");
	          $("#exampleModal").modal("show");
 
          }
      }

      //모달창 이벤트
      $("#addSch").on("click", function () {

         var title = $("#modal_title").val();
         var start = $("#start").val();
         var end = $("#end").val();
         var color = $("#selectColor").val();
         
         // 이벤트 추가할때는 모달에띄워준 date보다 하루 더 추가해줌
         var endDate = new Date($("#end").val());
         //YYYY-MM-DD 로 표현하기위함
         var yyyy = endDate.getFullYear();
         //padStart() -> 문자열을 항상 두자리로 만들어주기위함
         var mm = String(endDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더해줍니다.
         var dd = String(endDate.getDate() + 1).padStart(2, '0'); // 날짜에 1을 더하고, 문자열로 변환하여 두 자리로 맞춥니다.
         endDate = yyyy + '-' + mm + '-' + dd;

          //빈값입력시 오류
          if (title == ""  ||  start == "" )
             {
                Swal.fire({
                  icon: 'error',
                  text: '모든 값을 입력해주세요!'
                })
                return; // 빈값일경우 함수종료
             }
            //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
         if (start> endDate) {
            Swal.fire({
              icon: 'error',
              text: '이벤트 종료기간이 시작기간보다 작습니다!'
            });
             return;
          }

          // 이벤트 등록시 초기화
            calendar.addEvent({         
              allDay:true,
              title: title,
              start: start,
              end: endDate,
              color: color,
            });  

            // 이벤트 등록 ajax
            $.ajax({
              url:"addCalendar.st",
              data:{
                stuNo:$("#studentNo").val(),
                title:title,
                start:start,
                end:endDate,
                color:color
              },
              success:function(result){
                console.log("ajax성공");
                
                if(result > 0){
                	 Swal.fire({
                         icon: 'success',
                         text: '성공적으로 일정을 등록했습니다!'
                       })
                } else {
                	 Swal.fire({
                         icon: 'error',
                         text: '일정 등록에 실패했습니다. 재등록해주세요!'
                       })
                }
              }, error:function(){
                console.log("ajax실패")
              }
            })

          // 모달 초기화
            $("#exampleModal").modal("hide");
            $("#modal_title").val("");
            $("#start").val("");
            $("#end").val("");
            $("#selectColor").val("");      
        });
	   
       // 처음 모달창 킬때 끝나는날짜 자동으로 시작날짜로 고정
       $(document).ready(function(){
           $("#start").change(function(){
              $("#end").val($("#start").val())
            });
       });
       
       // 일정조회
       $.ajax({
    	   url:"selectCal.st",
    	   data:{stuNo:$("#studentNo").val()},
    	   success:function(data){
    		   console.log("조회ajax 성공");
    		   console.log(data);
    		   
    		   for (let i in data) {
                   calendar.addEvent({
                     id: data[i].calendarNo,
                     title: data[i].calTitle,
                     start: data[i].calStartDate,
                     allday:true,
                     end: data[i].calEndDate,
                     backgroundColor: data[i].backgroundColor,
                     borderColor: '#ffffff'
                   });
                 }
    		   
    	   }, error:function(){
    		   console.log("조회 ajax 실패");
    	   }
       });
	
	
      calendar.render(); // 딜력을 띄워줌
    });
 
 
  </script>

 <jsp:include page="../common/footer.jsp" />
</body>

</html>