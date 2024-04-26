<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        border: 1px solid red;
    }
    #topDiv{
        padding-top: 100px;
    }
    #topDiv>div{
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    #calendar{
        padding-right: 50px;
        padding-left: 50px;
    }
    #notice{
        padding-right: 50px;
        padding-left: 50px;
        padding-bottom: 30px;
        color: rgb(39, 39, 39);
        
    }
    td{
        /* border: solid 1px red; */
        padding: 10px;
    }
    .icon{
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
    #noticeTitle{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
    #noticeTitle2{
        padding-right: 160px;
    }
    ul,li{
        list-style: none;
        padding: 0px;
    }
    li{
        float: left;
        padding: 2px;
        width: 100px;
        text-align : center;
    }
    a{
        color: inherit;
        text-decoration: none;
    }
    

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">

            <div id="topDiv" class="bg-white" style="height: 450px;">
                <div id="calendar">달력자리
                	<jsp:include page="../common/myCalendar.jsp"/>
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
                </div>
            </div>
    
            <div style="display: flex; justify-content: center;">
                <ul>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>버스</span>
                        </a>
                    </li>
                    <li>
                        <a href="library.go" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail" style="width: 100px; height: 100px;"></span>
                            <span>도서관</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>취업관련</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;"> 
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>커뮤니티</span>
                        </a>
                    </li>
                    <li>
                        <a href="" class="icon" style="text-decoration: none; color: inherit;">
                            <span id="icon" class="service_icon type_mail"></span>
                            <span>학사일정</span>
                        </a>
                    </li>
                <ul>
            </div>
        
    </div>
	
	<script>
		$(document).ready(function(){
			$.ajax({
				url:"mainList.no",
				success:function(response){
					let value ="";
					for(let i in response){
						value += "<tr onclick='detailGo(" + response[i].noticeNo + ")'>"
                        	  +		"<td style='width: 500px;'>" + response[i].noticeTitle + "</td>"
                        	  +		"<td>" + response[i].createDate + "</td>"
                    	      + "</tr>";
					}
					$("#notice tbody").html(value);
				},
				error:function(){
					console.log("ajax tongsin silpae")
				}
			})
		})
		
		function detailGo(num){
			location.href="detail.no?nno=" + num;
		}
	</script>
	
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>