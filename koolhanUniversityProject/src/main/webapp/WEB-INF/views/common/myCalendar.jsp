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
	line-height: 50px;
	justify-content: flex-start;
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
}

#mid-title {
	font-size: small;
	padding-right: 20px;
}

#fin-title {
	padding-left: 20px;
	font-size: small;
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
/*
  .fc .fc-toolbar.fc-header-toolbar {
    margin-bottom: 1.5em;
    border-top: solid 5px rgb(255, 208, 0);
    padding-top: 1.5em;
  }
  */
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
</style>
</head>
<body>
	<jsp:include page="../common/header_with_sidebar.jsp" />
	<div class="content">
		<div class="title-area">
			<div id="title" onclick="location.href=''">나의 캘린더</div>
			<div id="mid-title">마이페이지</div>
			<div>></div>
			<div id="fin-title">나의 캘린더</div>
		</div>
	</div>

	<div id='calendar'></div>
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
							<td><input type="text" id="modal_title" /><br /></td>
						</tr>
						<tr>
							<th>시작시간 :</th>
							<td><input type="datetime-local" id="start" /><br /></td>
						</tr>
						<tr>
							<th>종료시간 :</th>
							<td><input type="datetime-local" id="end" /><br /></td>
						</tr>
						<tr>
							<th>자격증 일정 :</th>
							<td><select id="testDate">
									<option value="test1">sql 1차</option>
									<option value="test2">sql 2차</option>
									<option value="test3">sql 3차</option>
									<option value="test4">sql 4차</option>
							</select></td>
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
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="addSch"
						style="background-color: #1c4587; border-color: #1c4587;">
						추가</button>
				</div>
			</div>
		</div>
	</div>
	</div>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      // 풀캘린더 생성
      var calendar = new FullCalendar.Calendar(calendarEl, {

        // 구글캘린더API 키값
        googleCalendarApiKey : 'AIzaSyC4CerWedE4ejM_0st4KefILKimQ2SPkDI',
      
        //locale: 'ko', // 로컬설정
        height:'1000px', // 높이 설정
        expandRows:true, // 화면에 맞게 높이 재설정
        slotMinTime: '09:00', // Day 캘린더에서 시작 시간        
        slotMaxTime: '18:00', // Day 캘린더에서 종료 시작
        customButtons:{ // 커스텀버튼추가
          addBtn:{
            text:" + ",
            click : function(){
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
          center: 'title',
          right: 'today prev,next addBtn,saveBtn'
        },
        initialView: 'dayGridMonth', // 처음 보이는 캘린더 화면 (기본설정:달)
        editable: true, // 기존에 입력된 이벤트 드래그로 움직임
        selectable: true, // 날짜 드래그
        dayMaxEvents: true, // allow "more" link when too many events
        
        // 날짜 클릭 혹은 드래그시 팝업창으로 이벤트 표시(모달로변경예정)
        select: function (event) {
            insertModalOpen(event);
           },
        
        // 이벤트 클릭시 모달 호출
        eventClick:function(event){
          insertModalOpen(event);

        }, 

        // 이벤트 수정시
        eventChange:function(event){

        },

        // 이벤트 삭제시
        eventRemove:function(){

        },

		
        eventSources :[ 
            {  
            	googleCalendarId:'ko.south_korea#holiday@group.v.calendar.google.com', 
                color:'black',
                textColor:'red'
            },
            {  
            	googleCalendarId:'koolhandae@gmail.com', 
                color:'yellow',
                textColor:'blue'
            }
        ],
          
        
        events: [
    	   {
             title: 'All Day Event',
             start: '2024-03-01'
           },
           {
             groupId: 999,
             title: 'Repeating Event',
             start: '2024-03-09T16:00:00'
           },
           {
             groupId: 999,
             title: 'Repeating Event',
             start: '2024-01-16T16:00:00'
           },
           {
             title: 'Conference',
             start: '2024-04-11',
             end: '2024-04-11'
           },
           {
             title: 'Meeting',
             start: '2024-03-12T10:30:00',
             end: '2024-03-12T12:30:00'
           },
           {
             title: 'Lunch',
             start: '2024-03-12T12:00:00'
           },
           {
             title: 'Meeting',
             start: '2024-04-12T14:30:00',
             display:'background'
           },
           {
             title: 'Happy Hour',
             start: '2024-03-12T17:30:00'
           },
           {
             title: 'Dinner',
             start: '2024-01-12T20:00:00'
           },
           {
             title: 'Birthday Party',
             start: '2024-01-13T07:00:00'
           }

        	]
        
      });
    
      //모달창 이벤트
      $("#addSch").on("click", function () {
          var eventData = {
            title: $("#modal_title").val(),
            start: $("#start").val(),
            end: $("#end").val(),
            test: $("#testDate").val(),
            color: $("#selectColor").val(),
          };
          //빈값입력시 오류
          if (
            eventData.title == "" ||
            eventData.start == "" ||
            eventData.end == "" ||
            eventData.test == "" ||
            eventData.color == ""
          ) {
            Swal.fire({
            icon: 'error',
            text: '모든 값을 입력해주세요!'
            })

            //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
          } else if ($("#start").val() > $("#end").val()) {
            alert("시간을 잘못입력 하셨습니다.");
          } else {
            // 이벤트 등록시 초기화
            calendar.addEvent(eventData);
            $("#exampleModal").modal("hide");
            $("#title").val("");
            $("#start").val("");
            $("#end").val("");
            $("#selectColor").val("");
          }
        });
      calendar.render(); // 딜력을 띄워줌
    });
 
  </script>
</html>