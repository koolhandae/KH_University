<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	#enrollForm>table {
        width: 100%;
    }
    
    #enrollForm>table tr *{
        margin: 5px;
    }
    .innerOuter h4{
        font-weight: 600;
    }
    #board-file-label{
      border: 1px solid #e2e2e2;
      border-radius: 5px;
      height: 35px;
      padding-left: 20px;
      width: 100%;
      display: block;
      padding-top: 5px;
   }
   #board-file-btn{
      background-color: #1c4587;
      border: 1px solid #1c4587;
      border-bottom-right-radius: 5px;
      border-top-right-radius: 5px;
      color: white;
      height: 34px;
      width: 150px;
      float: right;
      padding: 4px;
      text-align: center;
      margin-top: -5px;
   }
   #board-file-div{
      display: flex;
      box-sizing: border-box;
   }
   #board-file-label span{
      height: 100;
   }
   .btn1{
      display: none;
   }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
       <br><br>
        <div class="innerOuter">
            <h4>자유게시판 작성</h4>
            <br>

            <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ loginUser.userId }" name="boardWriter" readonly></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;"></textarea>
                        </th>
                    </tr>
                    <tr id="file-area">
                        <th><label>첨부파일</label></th>
                        <th>
                            <input type="file" id="board-file" class="btn1" name="upfile"/>
                            <div id="board-file-div">
                                <label id="board-file-label" for="board-file">
                                    <span>첨부파일을 선택해주세요</span>
                                    <div id="board-file-btn" style="margin:-5px">+ upload files</div>
                                </label>
                            </div>
                        </th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-secondary" style="background-color: #1c4587; border: none;">등록하기</button>
                    <button type="reset" class="btn btn-outline-secondary">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
   </div>
   <script>
    $("#board-file").change(function(){
       const filneName = $(this).val();
       $("#board-file-label span").text(filneName);
    })
 
    </script>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>