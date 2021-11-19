<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Apple store sales summary here</title>
<style>
	div.left {
        width: 50%;
        float: left;
	}
	div.right {
        width: 50%;
        float: right;
	}
</style>
<style>
	body{
		font-family: Monospace,"돋움", dotum, "굴림", gulim, arial, helvetica, sans-serif;
		color: #ffffff;
		}
 	section {
		padding-top: 48px;
	}
</style>
</head>
<body>
<section>
<div class="left" style="width: 400px; height: 400px;">
<canvas id="wholesales" width="300" height="300"></canvas>
<canvas id="shopsales" width="300" height="300"></canvas>
</div>
<div class="right" style="width: 400px; height: 400px;">
<input type="date" id="date1">&nbsp;&nbsp;&nbsp;
<input type="date" id="date1">&nbsp;&nbsp;&nbsp;
<input type="button" value="check" id="btn">
<canvas id="prodsales" width="300" height="300"></canvas>
</div>
</section>

<script>

let data=[];
<c:set var="sales" value="${shopsales}" />
<c:forEach items="${sales}" var="sales">
data.push('${sales}');
</c:forEach>

let data2=[];
<c:set var="psales" value="${prodsales}" />
<c:forEach items="${psales}" var="sales">
data2.push('${sales}');
</c:forEach>

const ctx = document.getElementById('shopsales');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Apple 가로수길', '윌리스 김포공항', '프리스비 홍대점', '윌리스 인천터미널점', 'Apple 여의도 점'],
        datasets: [{
            label: '매장별 매출액',
            data: data,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

const pie = document.getElementById('prodsales');
const pieChart = new Chart(pie, {
    type: 'pie',
    data: {
        labels: ['iPad','iPhone','Airpods','AppleWatch'],
        datasets: [{
            label: '제품별 매출액',
            data: data2,
            backgroundColor: [
            	'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
            	'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

const con = document.getElementById('wholesales');
const config = new Chart(con, {
		  type: 'bar',
		  data: {
				  labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Sat', 'Sun'],
				  datasets: [
				    {
				      label: 'Apple 여의도 점',
				      data: ['1','2','3','4','5','6','3'],
				      backgroundColor: 'rgba(255, 99, 132, 0.2)',
				    },
				    {
				      label: 'Apple 가로수길',
				      data: ['1','2','3','4','5','6','4'],
				      backgroundColor: 'rgba(54, 162, 235, 0.2)',
				    },
				    {
				      label: '프리스비 홍대점',
				      data: ['1','2','3','4','3','6','3'],
				      backgroundColor: 'rgba(255, 206, 86, 0.2)',
				    },
				    {
				        label: '윌리스 김포공항',
				        data: ['1','2','3','2','5','2','2'],
				        backgroundColor: 'rgba(75, 192, 192, 0.2)',
				    },
				    {
				        label: '윌리스 인천터미널점',
				        data: ['1','2','3','4','2','2','2'],
				        backgroundColor: 'rgba(255, 159, 64, 0.2)',
				      },
				  ]
				},
		  options: {
		    plugins: {
		      title: {
		        display: true,
		        text: 'Chart.js Bar Chart - Stacked'
		      },
		    },
		    responsive: true,
		    legend: {
		         position: 'right' // place legend on the right side of chart
		      },
		    scales: {
		        xAxes: [{
		           stacked: true // this should be set to make the bars stacked
		        }],
		        yAxes: [{
		           stacked: true // this also..
		        }]
		     }
		  }
		});
</script>

</body>
</html>