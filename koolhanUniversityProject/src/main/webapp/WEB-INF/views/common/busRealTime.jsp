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
    
     <h2 style="margin-left: 40px; font-weight:900; color: rgb(75,75,75);">버스 정보</h2>
        <input type="button" value="조회" id="btn1">
        <div id="result1"></div>
      
        <script>
            $(function(){

                $("#btn1").click(function(){
                    $.ajax({
                        url:"shuttleBus.do",
                        success:function(bus){
                        	console.log(bus)
                        	let $table = $("<table='1'></table>");
            					let $thead = $("<thead></thead>");
            					let $headTr = "<tr>"
            								+	"<th>노선번호</th>" 
            								+	"<th>y좌표</th>"       					
            								+	"<th>x좌표</th>"       					
            								+	"<th>정류소 순서</th>"       					
            								+	"<th>정류소명</th>" 
            								+	"<th>정류소ID</th>"
            								+ "</tr>";
     	       					$thead.html($headTr);
    	       					
    	       					let $tbody = $("<tbody></tbody>");
    							let bodyTr = "";
    							$(bus).find("item").each(function(i, item){
//     								 console.log($(item).find("routenm").text());
   								
    								bodyTr += "<tr>"
    									   	+	"<td>" + $(item).find("routenm").text() +"</td>" // 노선번호
    									   	+	"<td>" + $(item).find("gpslati").text() +"</td>" // x좌표
    									   	+	"<td>" + $(item).find("gpslong").text() +"</td>" // y좌표
    									   	+	"<td>" + $(item).find("nodeord").text() +"</td>" // 정류장 순서
    									   	+	"<td>" + $(item).find("nodenm").text() +"</td>" // 정류소명
    									 	+	"<td>" + $(item).find("nodeid").text() +"</td>" // 정류소 ID
    									   	+ "</tr>";
    							})
    							$tbody.html(bodyTr);
    							$table.append($thead, $tbody)
 							  		  .appendTo("#result1");

                        }, error:function(){
                            console.log("셔틀버스 ajax 통신 실패!");
                        }
                    })
                })

            })

        </script>

   </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>