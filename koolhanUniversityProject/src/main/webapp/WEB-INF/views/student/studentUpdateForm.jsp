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
   						
   	<div class="innerOuter">
                <div class="form-group">
                	<label for="display-image"> 프로필 사진 :</label>
					<div align="center">
						<c:choose>
							<c:when test="${empty loginStudent.changeName}">
								<img id="display-image" style="width: 225px; height: 200px;" src="resources/images/default_user.png">	
							</c:when>
							<c:otherwise>
								<img id="display-image" style="width: 225px; height: 200px;" src="${loginStudent.changeName}">
							</c:otherwise>
						</c:choose>
							<br> 
							<input type="file" style="display: none;" id="profile-pic" accept="image/*"> 
							<br>
						<button onclick="changePic();" class="btn btn-primary">프로필	사진 변경</button>
						<button id="saveImage" onclick="saveImage();" class="btn btn-success" style="display: none">이미지 저장</button>
					</div>
					<script>
                    	function changePic(){
                    		$("#profile-pic").click();
                    	}
                    	
                    	$("#profile-pic").change(function(){
                    		if (this.files && this.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    $('#display-image').attr('src', e.target.result);
                                };
                                reader.readAsDataURL(this.files[0]);
                                $("#saveImage").removeAttr("style");
                            }
                    	})
                    	
                    	function saveImage(){
                    		var fileData = $('#profile-pic').prop('files')[0];
                    	    var upfile = new FormData();
                    	    upfile.append('profileImage', fileData);

                    	    $.ajax({
                    	        url: 'profile.img',  
                    	        type: 'POST',
                    	        data: upfile,
                    	        processData: false,
                    	        contentType: false,
                    	        success: function(response) {
                    	            $("#saveImage").hide();
                    	        	Swal.fire({
            							icon: response.icon,
            							title: response.title,
            							text: response.text,
            						}).then((result) => {
            			                if (result.isConfirmed) {
            			                    location.reload(); 
            			                }
            						})
                    	        },
                    	        error: function() {
                    	            alert('프로필 사진 저장에 실패했습니다.');
                    	        }
                    	    });
                    	}
                    </script>
                    <label for="studentName"> 이름 :</label>
                    <input type="text" class="form-control" id="studentName" name="studentName" value="${loginStudent.studentName}" readonly><br>

                    <label for="studentId"> 학번 :</label>
                    <input type="text" class="form-control" id="studentId" name="userId" value="${loginStudent.studentId}" readonly><br>
                    
                    <label for="email"> &nbsp;  이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" readonly value="${loginStudent.stEmail}">
                    <br>
					
                    <label for="phone"> &nbsp;  전화번호 :</label>
					<div style="display: flex;"> 
                    <input type="text" class="form-control" id="phone" name="stPhone" placeholder="전화번호를 입력하세요(- 포함)" value="${loginStudent.stPhone }">  &nbsp;
                    <input id="changePhone" type="button" class="btn btn-primary" value="연락처 변경">
					</div>                    
					<br>
                    <label for="address"> &nbsp;  주소 : (주소 변경은 아래 입력창을 클릭하세요 ) <i class="fa-solid fa-arrow-down"></i></label>
	                    <input onclick="execDaumPostcode();" type="text" class="form-control" id="address" name="stAddress" value="${loginStudent.stAddress}" readonly>
	                
                    
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:470px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<br><br>
                    <div id="addressFix" style="display:none;">
	                    <label for="address"> &nbsp; 새로운 주소 :</label>
		                    <input type="text" class="form-control" onclick="execDaumPostcode();" id="postcode" name="postcode" placeholder="우편번호" readonly>
							<input type="text" class="form-control" onclick="execDaumPostcode();" id="newAddress" name="address" placeholder="주소" readonly>
	                    <div style="display:flex;">
							<input type="text" class="form-control" id="detailAddress" name="detailAddress"placeholder="상세주소">
							<input type="text" class="form-control" onclick="execDaumPostcode();" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly>
	                    </div>
	                    <br>
	                    <br>
						<div align="center">
							<input id="changeAddress" type="button" class="btn btn-primary" value="주소 변경">
						</div>						
						
                    </div>

                    </div>
					<br>
					<div align="center">
                    <button id="changePwd" class="btn btn-success">비밀번호 변경</button>
					</div>
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							
						    // 우편번호 찾기 찾기 화면을 넣을 element
						    var element_wrap = document.getElementById('wrap');
						
						    function foldDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_wrap.style.display = 'none';
						    }
						
						    function execDaumPostcode() {
						        // 현재 scroll 위치를 저장해놓는다.
						        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                $("#addressFix").css("display","block");
						                document.getElementById('postcode').value = data.zonecode;
						                document.getElementById("newAddress").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_wrap.style.display = 'none';
						
						                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						                document.body.scrollTop = currentScroll;
						            },
						            width : '100%',
						            height : '100%'
						        }).embed(element_wrap);
						        
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_wrap.style.display = 'block';
						        
						    }
	                	$(function(){
	                		$("#changePwd").click(function(){
	                			Swal.fire({
	                				   title: '비밀번호 변경',
	                				   text: '비밀번호를 변경하시겠습니까?',
	                				   icon: 'question',
	                				   
	                				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	                				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	                				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	                				   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
	                				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	                				   
	                				   reverseButtons: false, // 버튼 순서 거꾸로
	                				   
	                				}).then(result => {
	                				   // 만약 Promise리턴을 받으면,
	                				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	                					   $.ajax({
	                    	                	url:"sendmail.do",
	                    	                	data:{
	                    	                		email : '${loginStudent.stEmail}',
	                    	                		userId : '${loginStudent.studentId}'	
	                    	                	},
	                    	                	success:function(result){
	                    	                		Swal.fire(
	                    	                		        '이메일 발송 성공',
	                    	                		        '비밀번호 재설정 링크를 ${loginStudent.stEmail}로 보냈습니다. 확인해주세요!',
	                    	                		        'success'
	                    	                		      )
	                    	                	}, error:function(){
	                    	                		console.log("ajax통신실패");
	                    	                	}
	                    	                });
	                				   }
	                				});
	                		})
	                	})	;
	                	
	                	$("#changeAddress").click(function(){
	                		$.ajax({
	                			url:"updateAddress.stu",
	                			data: {
	                				postcode:$("#postcode").val(),
	                				address:$("#newAddress").val(),
	                				detailAddress:$("#detailAddress").val(),
	                				extraAddress:$("#extraAddress").val(),
	                				studentId:'${loginStudent.studentId}',
	                			},
	                			success:function(response){
	                				Swal.fire(
        	                		        response.title,
        	                		        response.text,
        	                		        response.icon
        	                		      );
        	                		$("#addressFix").css("display", "none");
        	                		$("#address").val(response.newAddress);
	                			},
	                			error:function(){
	                				Swal.fire(
        	                		         '주소 변경 실패',
        	                		         '주소 변경에 실패했습니다.',
        	                		       'error'
        	                		      )
	                			}
	                		})
	                	});
	                	
	                	$(function(){
	                		$("#phone").focus(function(){
								$(this).attr("placeholder","변경 전 전화번호 : ${loginStudent.stPhone }    새로운 전화번호를 입력하세요(- 포함)");
								$(this).val("");
	                		})
	                	});
	                	
	                	$(function(){
	                		$("#changePhone").click(function(){
	                			Swal.fire({
	                				   title: '연락처 변경',
	                				   text: '연락처를 변경하시겠습니까?',
	                				   icon: 'question',
	                				   
	                				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	                				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	                				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	                				   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
	                				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	                				   
	                				   reverseButtons: false, // 버튼 순서 거꾸로
	                				   
	                				}).then(result => {
	                				   // 만약 Promise리턴을 받으면,
	                				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	                					   $.ajax({
	                    	                	url:"updatePhone.stu",
	                    	                	data:{
	                    	                		stPhone : $("#phone").val(),
	                    	                		studentId : '${loginStudent.studentId}'	
	                    	                	},
	                    	                	success:function(result){
	                    	                		if(result === "NNNNY"){
		                    	                		Swal.fire(
		                    	                		        '연락처 변경 성공',
		                    	                		        '새롭게 입력하신 연락처로 변경 반영되었습니다.',
		                    	                		        'success'
		                    	                		      ).then(result=>{
		                    	                				location.reload();	      
		                    	                		      });
	                    	                		}else{
	                    	                			Swal.fire(
	                       	                		         '연락처 변경 실패',
	                       	                		         '연락처 변경에 실패했습니다.',
	                       	                		       	 'error'
	                       	                		          )
	                    	                		}
	                    	                	}, error:function(){
	                    	                		console.log("ajax통신실패");
	                    	                	}
	                    	                });
	                				   }
	                				});	                			
	                		})
	                	})
	                </script>
	                </div>
	        <br><br>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>