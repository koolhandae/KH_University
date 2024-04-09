<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    h1{
        margin: 0 !important;
        color: rgb(32, 56, 100);
        /* padding: 20px; */
    }
    h4{
        padding: 50px 50px 0 50px;
        margin: 0 !important;
    }
    #topdiv{
        margin-top: 50px;
        margin-left: 50px;
        margin-right: 50px;  
        padding: 20px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv{
        margin-left: 50px;
        margin-right: 50px;  
    }
    #h1Div{

        float: left;
    }
    #liGroup{
        float: right;
        line-height: 50px;
    }
    .form-group{
        padding: 50px;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   	
       
    
    	<div id="topdiv"class="bg-white">

                <div id="h1Div">
                <h1 style="font-weight: 900;">강의 관리</h1>
                </div>
                <div id="liGroup">
                    <ul>
                        <li>나의 강의실 </li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li style="font-weight: bold;"> 강의등록</li>
                    </ul>
                </div>

            <div></div>
			<!-- <hr> -->
        </div>

        <div style="padding: 15px;">

        </div>



        <div id="contentDiv" class="bg-white">
            <h4>강의 등록</h4>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    
                    <label for="classNo">강의번호 :</label>
                    <input type="text" class="form-control" id="classNo" name="classNo" placeholder="Please Enter Number" required><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>
                    
                    <label for="age"> &nbsp; 주민등록번호 :</label>
                    <input type="number" class="form-control" id="memberSsn" name="studentSsn" placeholder="Please Enter Age"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)"><br>
                    
                    <label for="address"> &nbsp; Address :</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button id="enrollBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>

        

        

    

      
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>