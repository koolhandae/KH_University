<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- calender용  -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script src='resources/dist/index.global.js'></script>
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
    padding-left: 100px ;
    padding-right: 100px;
    padding-top: 50px;
    padding-bottom: 50px;
  }
   .content{
      padding: 50px;
   }
   .title-area{
      width: 100%;
      height: 50px;
      background-color: white;
      display: flex;
      line-height: 50px;
      justify-content: flex-start;
   }
    .title-area div{
       padding-top: 10px;  
    }
   #title{
      font-size: x-large;
      font-weight: 600;
      color: #1c4587;
      padding-left: 30px;
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

</style>
</head>

<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
        <div class="title-area">
            <div id="title" onclick="location.href=''">나의 캘린더</div>  
                <div id="mid-title">마이페이지</div>
                <div>></div>
                <div id="fin-title">나의 캘린더</div>
            </div>
            <div id='calendar'>
    
            </div>
       
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>


<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
  
      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridYear,dayGridMonth,timeGridWeek'
        },
        initialView: 'dayGridYear',
        initialDate: '2023-01-12',
        editable: true,
        selectable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        // businessHours: true,
        // weekends: false,
        events: [
          {
            title: 'All Day Event',
            start: '2023-01-01'
          },
          {
            title: 'Long Event',
            start: '2023-01-07',
            end: '2023-01-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2023-01-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2023-01-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2023-01-11',
            end: '2023-01-13'
          },
          {
            title: 'Meeting',
            start: '2023-01-12T10:30:00',
            end: '2023-01-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2023-01-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2023-01-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2023-01-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2023-01-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2023-01-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2023-01-28'
          }
        ]
      });
  
      calendar.render();
    });
  
  </script>
</html>