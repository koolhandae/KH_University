<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #boardList *{ 
 		text-align: center; 
 		vertical-align: middle;
    } 

    #boardList th{
        background-color: rgb(48, 76, 121);
        color: white;
        text-align: center;
    }

    .searchArea{
        float: right;
        padding-right: 100px;
    }

    #btn {
        border: 2px solid rgb(48, 76, 121); 
        color: rgb(48, 76, 121);
        border-radius: 5px;
        height: 35px;
    }

    #btn:hover{ 
        background-color: rgb(18, 46, 81); 
        color : white; 
    }    

    .searchArea>input{
        color: rgb(75,75,75);
        height: 31.5px;
    }

    .orderSelect,
    .searchArea {
        display: inline-block;
    }
</style>
</head>
<body>
   <jsp:include page="../common/header_with_sidebar.jsp"/>
   <div class="content">
   <div class="innerOuter">
   	 <h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">등록금 납입 관리</h2>
     <hr>   
     <br>
        <div class="orderSelect">
            <select class="form-control" name="order" id="order">
                <option value="">학번순</option>
                <option value="">이름순</option>
                <option value="">납입현황</option>
            </select>
        </div>

        <div class="searchArea">
            <input type="text" id="search">
            <button class="btn" id="btn">검색</button>
        </div>
        <br>
        <table id="boardList" class="selectTuition table" style="width: 900px;">
            <br>
            <tr>
                <th>학번</th>
                <th>이름</th>
                <th>등록금</th>
                <th>장학금</th>
                <th>납부금</th>
                <th>납입현황</th>
                <th> </th>
            </tr>
            <tr>
                <td>2401010</td>
                <td>김뫄뫄</td>
                <td>4,000,000</td>
                <td>1,500,000</td>
                <td>2,500,000</td>
                <td>납부</td>
                <td>
                    <button class="btn" id="btn">조회</button>
                </td>
            </tr>
            <tr>
                <td>2401011</td>
                <td>박봐봐</td>
                <td>4,000,000</td>
                <td>1,000,000</td>
                <td>3,000,000</td>
                <td>미납부</td>
                <td>
                    <button class="btn" id="btn">조회</button>
                </td>
            </tr>
        </table>
   </div>
   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>