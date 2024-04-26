<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chart Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="width:400px;">
    <canvas id="myChart" width="400" height="400"></canvas>
    <button id="draw" class="btn btn-large btn-primary">그려</button>
    <script>
    	$("#draw").click(function(){
    		$.ajax({
    			url:"statistic.stu",
    			success:function(response){
    				var ctx = document.getElementById('myChart').getContext('2d');
    		        var myChart = new Chart(ctx, {
    		            type: 'pie',
    		            data: {
    		                labels: ['재학생', '휴학생', '제적생', '졸업생', '자퇴생'],
    		                datasets: [{
    		                    label: '학생 통계',
    		                    data: [response.attendStu, response.absenceStu, response.expelledStu, response.gradStu, response.leaveStu],
    		                    backgroundColor: [
    		                    	'rgba(255, 99, 132, 0.5)',
    		                        'rgba(54, 162, 235, 0.5)',
    		                        'rgba(255, 206, 86, 0.5)',
    		                        'rgba(75, 192, 192, 0.5)',
    		                        'rgba(153, 102, 255, 0.5)'
    		                    ],
    		                    borderColor: [
    		                        'rgba(255, 99, 132, 1)',
    		                        'rgba(54, 162, 235, 1)',
    		                        'rgba(255, 206, 86, 1)',
    		                        'rgba(75, 192, 192, 1)',
    		                        'rgba(153, 102, 255, 1)'
    		                        ],
    		                    borderWidth: 1,
    		                    options: {
    		                        
    		                    }
    		                }]
    		            },
    		        });	
    			},
    			error:function(){
    				console.log("sdsdsd")
    			},
    		});
    	});
    </script>
</body>
</html>