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
    h3{
        padding: 50px 50px 0 100px;
        margin: 0 !important;
    }
    #topdiv{
        margin-top: 50px;
        margin-left: 100px;
        margin-right: 100px;  
        padding: 20px 20px 20px 50px;
        overflow: hidden;
    }
    div{
        /* border: solid 1px red; */
        display: block;
        box-sizing: border-box;
    }
    ul,li{
        list-style: none;
        padding: 0;
    }
    li{
        float: left;
        padding: 2px;
    }
    #contentDiv{
        margin-left: 100px;
        margin-right: 100px;  
    }
    #h1Div{
        float: left;
    }
    #liGroup{
        float: right;
        line-height: 50px;
    }
    .form-group{
        padding-top: 50px;
        padding-right: 100px;
        padding-bottom: 30px;
        padding-left: 100px
    }
    th,td {
        text-align: center !important;
        width: 275px;
    }
    thead *{
        background-color: #1c4587;
        color: white;
    }
    .homework_li_class{

        width: 250px;
        height: 65px;
        border: 2.5px solid #858796;;
        font-size: 20px;
        line-height: 60px;
        display: inline-block;
        cursor:pointer;
        text-align:center;
    }

    #HomeworkLiDiv{
        display: flex;
        justify-content: center;
    }
    #wave{
        width: 50px;
    }
    .ui-datepicker-trigger{
        display: none;
    }
    .btns{
        padding-bottom: 50px;
    }
    /* table{
        width: 100%;
    }
    thead{
        height: 50px;
    } */
    .table th,
    .table td {
        padding: 0px;
        vertical-align: baseline;
        /* line-height: 10px; */
    }

</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <jsp:include page="../common/datePickerNsummernote.jsp"/>
   <div class="content">
    <button id="confirmAlert">알림창</button>
    <script>
    $("#confirmAlert").click(function () {
        Swal.fire({
      icon: 'success',
      title: 'Alert가 실행되었습니다.',
      text: '이곳은 내용이 나타나는 곳입니다.',
    })
              });
          
        </script>
        <div id="topdiv"class="bg-white">

            <div id="h1Div">
                <h1 style="font-weight: 900;">과제</h1>
            </div>
            <div id="liGroup">
                <ul>
                    <li>과제 </li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li style="font-weight: bold;"> 과제 현황</li>
                </ul>
            </div>

        </div>
        <div style="padding: 15px;" id="HomeworkLiDiv">
            <ul style="height: 66px; margin: 0;" >
                <li class="homework_li_class" style="background-color: white;" onclick="location.href = 'professorPJEnrollForm.do'">과제 등록</li>
                <li class="homework_li_class" style="background-color: #1c4587; color: white; margin-right: 0.5px;">과제 현황</li>
            </ul>
            
        </div>

        <div id="contentDiv" class="bg-white">
            <div>
                <h3>과제 현황</h3>
    
                    <div class="form-group">
                        
                        <label for="lectureSelect">강의 선택 </label>
                        <select name="lectureSelect" id="lectureSelect" class="form-control ">

                        </select>

                        <br>
                        
                        <label for="lectureNm"> &nbsp;마감기한 :</label>
                        <table>
                            <tr>
                                <td>
                                    <input type="text" id="datepicker" class="form-control">
                                </td>
                            </tr>
                        </table>

                        <br>
                        <br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width: 24%;">강의명</th>
                                    <th style="width: 24%;">과제제목</th>
                                    <th style="width: 24%;">제출기한</th>
                                    <th style="width: 16%;">상세보기</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>자바의 기초</td>
                                    <td>ㅇㅇㅇㅇㅇ과제</td>
                                    <td>2024-05-02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-primary ">상세보기</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <!-- <label for="content"> &nbsp;내용 </label>
                        <div id="summernote" name="editordata" class="form-control summernote" style="resize:none; height: auto;">
                            <p>
                                <h1>ㅇㅇ</h1> <br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                                ㅇ<br>
                            </p>
                        </div> -->
                        <!-- <textarea id="summernote" name="editordata" cols="30" rows="10" class="form-control summernote" style="resize:none;" readonly> </textarea> -->
                       
    
    
                    </div>
                    <br>
            </div>
            
        </div>
        
        
        <!-- <div style="padding: 15px;"></div>

        <div class="bg-white">ㅇㅅㅇ</div> -->
	<input type="hidden" id="userId" value="${loginUser.memberId}">
	<!-- select option에 들어가는 값 -->
	<script>
		$(function() {
			$.ajax({
				url:"classSelectAjax.do",
				data:{memberId:$("#userId").val()},
			    success:function(list){
			    	console.log(list);
			    	
			    	let value = "<option>" + "강의를 선택해주세요." +  "</option>"
			    			  + "<option>" + "전체보기" +  "</option>";
			    	
			    	if(list != ""){
                        for(let i in list){
                            value += "<option>" + list[i].className+"</option>"
                        }
                    }else{
                    	value="";
			    		value += "<option>" + "개설된 강좌가 없습니다."+"</option>"
			    	}
                    
			    	
			    	$("#lectureSelect").html(value);
			    	
			    },error:function(){
			    	console.log("ajax다 터져서왓다고요")
			    }
			})
			
			
			$.ajax({
				url:"projectAllSelectAjax.do",
				date:{
					memberId:$("#userId").val()
				},
				success:function(list){
					console.log("lsit" + list);
					
				},error:function(){
					
				}
			})
        });
	</script>

<script>

</script>





   <jsp:include page="../common/footer.jsp"/>

</body>
</html>