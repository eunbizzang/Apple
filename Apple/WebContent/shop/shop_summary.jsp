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

<title>Apple store sales summary here</title>
<style>

	body{
		font-family: Monospace,"돋움", dotum, "굴림", gulim, arial, helvetica, sans-serif;
		color: #ffffff;
		}
 	nav{
 		position: absolute;
    	width: 100%;
	    min-width: 1024px;
    	height: 48px;
    	max-height: 44px;
    	background: rgba(0,0,0,0.92);
    	font-weight: bold;
		display: flex;
		justify-content: space-between;
		align-items: center;
    }
 	
 	section {
		padding-top: 48px;
	}
</style>
</head>
<body>
<nav>
	<span><a href="shopsales">Apple</a></span>
	<span><a href="shopsales">매장별 매출</a></span>
	<span><a href="shopsales">매장별 매출</a></span>
	<span><a href="shopsales">매장별 매출</a></span>
</nav>
<section>
<div style="width: 800px; height: 600px;">
	<!--차트가 그려질 부분-->
	<canvas id="shopsales" width="300" height="300"></canvas>
	<canvas id="prodsales" width="300" height="300"></canvas>
</div>
</section>
<script>
let data=[];
<c:set var="sales" value="${shopsales}" />
<c:forEach items="${sales}" var="sales">
data.push('${sales}');
</c:forEach>
const ctx = document.getElementById('shopsales');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Apple 여의도 점', 'Apple 가로수길', '프리스비 홍대점', '윌리스 김포공항', '윌리스 인천터미널점'],
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
        labels: ['Ipad', 'Iphone', 'AppleWatch', 'Ipod'],
        datasets: [{
            label: '제품별 매출액',
            data: [10, 10, 10, 10],
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
</script>

</body>
</html>