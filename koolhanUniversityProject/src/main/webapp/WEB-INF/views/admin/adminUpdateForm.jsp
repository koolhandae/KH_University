<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content * {
color: rgb(100,100,100);
}
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>교직원 / 교수 개인정보수정</h2>
            <br>

            <form action="update.ad" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userName">* Name :</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Please Enter Name" readonly><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>
                    
                    <label for="age"> &nbsp; 주민등록번호 :</label>
                    <input type="number" class="form-control" id="memberSsn" name="memberSsn" placeholder="Please Enter Age"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)"><br>
                    
                    <label for="address"> &nbsp; Address :</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>
                    
                    <label for=""> &nbsp; 교수 / 교직원 : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Professor" value="P">
                    <label for="Professor">교수</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Administrator" value="A">
                    <label for="Administrator">교직원</label><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button id="enrollBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        
      
        <br><br>
        
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>