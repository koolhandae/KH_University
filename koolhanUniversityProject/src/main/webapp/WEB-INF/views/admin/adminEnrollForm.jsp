<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
      <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">* ID :</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="Please Enter ID" required>
                    <div id="checkResult" style="font-size:0.8em; display:none;"></div>
                    
                    <script>
                    	$(function(){
                    		const $idInput = $("#enrollForm input[name=userId]")
							$idInput.keyup(()=>{
								// 최소 5글자 이상으로 입력되었을때만 ajax요청
								if($idInput.val().length >= 5){
									$.ajax({
										url:"idCheck.me",
										data:{
											checkId: $idInput.val(),
											},
										success:function(result){
											if(result == "NNNNN"){
												// => 빨간색 메시지 (사용불가능 출력)
												$("#checkResult").show();
												$("#checkResult").css("color", "red").text("입력한 아이디가 이미 존재합니다.");
												// => 버튼 비활성
												$("#enrollForm :submit").attr("disabled",true);
											}else{
												$("#checkResult").show();
												$("#checkResult").css("color", "green").text("입력한 아이디는 사용 가능 합니다.");
												$("#enrollForm :submit").removeAttr("disabled");
											}
										},
										error:function(){
											console.log("아이디중복체크실패")
										}
										
									})
								}else{ // 5글자 미만일 경우 => 버튼 비활성화, 메세지 숨기기
									$("#checkResult").hide();
									$("#enrollForm :submit").attr("disabled",true);
								}
								
							})
                    	})
                    </script>
                    
                    <br>
                    <label for="userPwd">* Password :</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="checkPwd">* Password Check :</label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="userName">* Name :</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Please Enter Name" required><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>
                    
                    <label for="age"> &nbsp; Age :</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Please Enter Age"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)"><br>
                    
                    <label for="address"> &nbsp; Address :</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>
                    
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                    
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