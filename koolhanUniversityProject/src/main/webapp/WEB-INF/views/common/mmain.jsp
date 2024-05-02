<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <!-- fullcalendar CDN -->
            <link href='https://gcore.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
            <script src='https://gcore.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
            <!-- fullcalendar 언어 CDN -->
            <script src='https://gcore.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
            <!-- <script src="https://gcore.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script> -->
            <title>Insert title here</title>
            <style>
                /*
    div{
        border: 1px solid red;
    }
    */
                #topDiv {
                    padding-top: 30px;
                }

                #topDiv>div {
                    width: 50%;
                    float: left;
                    box-sizing: border-box;
                }

                #calendar {
                    padding-right: 50px;
                    padding-left: 100px;
                    height: 500px;
                    padding-top: 60px;
                }

                #notice {
                    padding-right: 80px;
                    padding-left: 100px;
                    padding-bottom: 30px;
                    padding-top: 50px;
                    color: rgb(39, 39, 39);

                }

                .table {
                    width: 90% !important;
                }

                td {
                    /* border: solid 1px red; */
                    /*padding: 10px;*/
                }

                .icon {
                    width: 44px;
                    height: 44px;
                    /* background-image: url(resources/images/unnamed.png);
        background-size: 444px 434px;
        background-position: 0px -128px;
        background-repeat: no-repeat; */
                }

                #notice tbody>tr:hover {
                    cursor: pointer;
                    color: black;
                    font-weight: 600;
                }

                #noticeTitle {
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                    align-items: center;
                    margin-right: -90px;
                }

                #noticeTitle2 {
                    padding-right: 160px;
                }

                ul,
                li {
                    list-style: none;
                    padding: 0px;
                }

                li {
                    float: left;
                    padding: 2px;
                    width: 100px;
                    text-align: center;
                }

                a {
                    color: inherit;
                    text-decoration: none;
                }

                #sersvice {
                    padding-right: 60px !important;
                }

                /* 캘린더 관련 */
                #calendarArea {
                    padding: 5px;
                    height: 450px;
                }

                /* 달력 스타일 변경 (테두리)*/
                .fc-button-group .fc-next-button,
                .fc-button-group .fc-prev-button {
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
                    border-top: 5px solid #676767;
                    ;
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
                .fc-event-title.fc-sticky {}

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
                .fc .fc-button-group>.fc-button,
                .fc-today-button {
                    background-color: white;
                    color: #464646;
                    font-weight: bold;
                    outline: none !important;
                    box-shadow: none !important;
                }

                .fc-prev-button,
                .fc-next-button {
                    background-color: white !important;
                    border: none !important;
                }

                .fc-icon {
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

                #addService>ul>li {
                    padding: 15px;
                    margin-right: 20px;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../common/header_with_sidebar.jsp" />
            <div class="content">
                <input type="hidden" id="studentNo" value="${loginStudent.studentNo}">
                <div id="topDiv" class="bg-white" style="height: 700px;">
                    <div id="calendar">
                        <div id="calendarArea"></div>
                    </div>
                    <div id="notice">
                        <div id="noticeTitle">
                            <div>
                                <h3 style="font-weight: 600;padding-bottom: 10px;">공지사항</h3> <!--최대 5~6개만 보이게-->
                            </div>
                            <div id="noticeTitle2">
                                <a href="list.no">더 보기 <i class="fa-regular fa-plus"></i></a>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <tbody>
                            </tbody>
                        </table>
                        <br>
                        <div id="sersvice">
                            <div>
                                <h3 style="font-weight: 600;padding-bottom: 10px; border-bottom: 2px solid #595959;">
                                    KOOLHAN SERVICE</h3>
                            </div>
                            <div style="display: flex; justify-content: center; background-color: white; height: 130px;"
                                id="addService">

                                <ul style="padding-top: 10px; margin-left:-10px;">
                                    <li>
                                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                                            <img width="70" height="70" src="resources/images/버스.png"
                                                style="margin-top: -2px;" />
                                            <br>
                                            <span>버스</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="library.go" class="icon"
                                            style="text-decoration: none; color: inherit;">
                                            <img width="67" height="67"
                                                src="https://img.icons8.com/external-those-icons-lineal-color-those-icons/96/external-Library-places-those-icons-lineal-color-those-icons.png"
                                                alt="external-Library-places-those-icons-lineal-color-those-icons" />
                                            <br>
                                            <span>도서관</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="job.do" class="icon" style="text-decoration: none; color: inherit;">
                                            <img width="66" height="66" src="resources/images/일.png" />
                                            <br>
                                            <span>취업관련</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="list.bo" class="icon" style="text-decoration: none; color: inherit;">
                                            <img width="66" height="66" src="resources/images/커뮤니티.png" />
                                            <br>
                                            <span>커뮤니티</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                                            <img width="70" height="70" src="resources/images/학사일정.png"
                                                style="margin-top: -4px" />
                                            <br>
                                            <span>학사일정</span>
                                        </a>
                                    </li>
                                    <ul>
                            </div>
                        </div>
                    </div>
                </div>



            </div>

            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: "mainList.no",
                        success: function (response) {
                            let value = "";
                            for (let i in response) {
                                value += "<tr onclick='detailGo(" + response[i].noticeNo + ")'>"
                                    + "<td style='width: 500px;'>" + response[i].noticeTitle + "</td>"
                                    + "<td>" + response[i].createDate + "</td>"
                                    + "</tr>";
                            }
                            $("#notice tbody").html(value);
                        },
                        error: function () {
                            console.log("ajax tongsin silpae")
                        }
                    })
                })

                function detailGo(num) {
                    location.href = "detail.no?nno=" + num;
                }
            </script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var calendarEl = document.getElementById('calendarArea');
                    // 풀캘린더 생성
                    var calendar = new FullCalendar.Calendar(calendarEl, {

                        // 구글캘린더API 키값
                        googleCalendarApiKey: 'AIzaSyC4CerWedE4ejM_0st4KefILKimQ2SPkDI',

                        //locale: 'ko', // 로컬설정
                        height: '450px', // 높이 설정
                        expandRows: true, // 화면에 맞게 높이 재설정
                        slotMinTime: '09:00', // Day 캘린더에서 시작 시간        
                        slotMaxTime: '18:00', // Day 캘린더에서 종료 시작
                        // 헤더 툴바
                        headerToolbar: {
                            left: 'title',
                            right: 'prev next today'
                        },
                        initialView: 'dayGridMonth', // 처음 보이는 캘린더 화면 (기본설정:달)
                        editable: true, // 기존에 입력된 이벤트 드래그로 움직임
                        selectable: true, // 날짜 드래그
                        dayMaxEvents: true, // allow "more" link when too many events
                        eventSources: [
                            {
                                googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                                color: 'white',
                                textColor: 'red'
                            },
                        ]
                    });

                    // 일정조회
                    $.ajax({
                        url: "selectCal.st",
                        data: { stuNo: $("#studentNo").val() },
                        success: function (data) {
                            console.log("조회ajax 성공");
                            console.log(data);

                            for (let i in data) {
                                calendar.addEvent({
                                    id: data[i].calendarNo,
                                    title: data[i].calTitle,
                                    start: data[i].calStartDate,
                                    allday: true,
                                    end: data[i].calEndDate,
                                    backgroundColor: data[i].backgroundColor,
                                    borderColor: '#ffffff'
                                });

                            }

                        }, error: function () {
                            console.log("조회 ajax 실패");
                        }
                    });

                    calendar.render(); // 딜력을 띄워줌
                });

            </script>

            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>