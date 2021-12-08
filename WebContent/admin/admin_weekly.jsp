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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
#body-wrapper {
	    min-height: 100%;
	    position: relative;
}
	
#body-content {
	   margin-top: 0px;
	   padding-bottom: 150px; /* footer의 높이 */
}
body {
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
  height: 100%;
}
#container {
    margin-left:400px;
	width:1090px;
	height:570px;
	padding:20px;
  	border-radius:5px;
  	border: solid 3px #B0C4DE;
    justify-content: center;
    display:flex; flex-flow:row wrap;
    grid-template-columns: 1fr 1fr ; 
    margin-bottom:20px;
}
table.line {

  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.2;
  margin: 10px 10px;
  font-size:15px;
}
p.title {
	font-size:20px;
	padding: 10px;
	text-align:center;
}
table.line th {
  padding: 10px;
  vertical-align: top;
  background: #f3f6f7;
}
table.line td {
  padding: 10px;
  vertical-align: top;
}
.wrapper {
  width: 500px; height:500px;
  border-spacing: 10;
}
</style>
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
	<div id="body-wrapper">
		<div id="body-content">
			<div id="container">
				<div class="item">
					<div class="wrapper">
						<p class="title">주간 매출 (전체매장)</p>
						<!-- whole store's daily sales graph(stacked) -->
						<canvas id="wholesales" width="450" height="450"></canvas>
					</div>
				</div>
				<div class="item">
					<div class="wrapper">
						<p class="title">매장별 매출</p>
						<!-- whole store's weekly sales graph -->
						<canvas id="shopsales" width="450" height="450"></canvas>
					</div>
				</div>
			</div>
			<div align="center">
				<!-- WEEKLY sales table(date, shopname) -->
				<table width="1100" class="line">
					<tr>
						<th scope="cols">매장명</th>
						<c:set var="week" value="${week}" />
						<c:forEach var="week" items="${week}"><th scope="cols">${week}</th></c:forEach>
					</tr>
					<c:set var="garosu" value="${garosu}" />
					<c:set var="gimpo" value="${gimpo}" />
					<c:set var="hongdae" value="${hongdae}" />
					<c:set var="incheon" value="${incheon}" />
					<c:set var="yeouido" value="${yeouido}" />
					<tr>
						<th scope="row"> Apple 가로수길 </th>
						<c:forEach var="garosu" items="${garosu}">
						<td> <fmt:formatNumber type="number" maxFractionDigits="3"
					 value="${garosu }"/></td></c:forEach>
					</tr>
					<tr>
						<th scope="row"> 윌리스 김포공항 </th>
						<c:forEach var="gimpo" items="${gimpo}">
						<td> <fmt:formatNumber type="number" maxFractionDigits="3"
					 value="${gimpo }"/></td></c:forEach>
					</tr>
					<tr>
						<th scope="row"> 프리스비 홍대점 </th>
						<c:forEach var="hongdae" items="${hongdae}">
						<td> <fmt:formatNumber type="number" maxFractionDigits="3"
					 value="${hongdae }"/></td></c:forEach>
					</tr>
					<tr>
						<th scope="row"> 윌리스 인천터미널점 </th>
						<c:forEach var="incheon" items="${incheon}">
						<td> <fmt:formatNumber type="number" maxFractionDigits="3"
					 value="${incheon }"/></td></c:forEach>
					</tr>
					<tr>
						<th scope="row"> Apple 여의도 점 </th>
						<c:forEach var="yeouido" items="${yeouido}">
						<td> <fmt:formatNumber type="number" maxFractionDigits="3"
					 value="${yeouido }"/></td></c:forEach>
					</tr>
				</table>
			</div>
		</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
<script>
// data for weekly salesgraph
let shopdata=[];
<c:set var="sales" value="${shopsales}" />
<c:forEach items="${sales}" var="sales">
  shopdata.push('${sales}');
</c:forEach>
const ctx = document.getElementById('shopsales');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['가로수', '김포', '홍대', '인천', '여의도'],
        datasets: [{
            label: 'WEEKLY SALES REPORT',
            data: shopdata,
            backgroundColor: [
            	'rgba(255, 99, 132, 0.4)',
                'rgba(255, 205, 86, 0.4)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(54, 162, 235, 0.4)',
                'rgba(153, 102, 255, 0.4)'
            ],
            borderColor: [
            	 'rgb(255, 99, 132)',
                 'rgb(255, 205, 86)',
                 'rgb(75, 192, 192)',
                 'rgb(54, 162, 235)',
                 'rgb(153, 102, 255)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// date data
let week=[];
<c:set var="week" value="${week}" />
<c:forEach items="${week}" var="week">
  week.push('${week}'.substring(5, 10));
</c:forEach>

// GAROSU WEEKLY
let garosu=[];
<c:set var="garosu" value="${garosu}" />
<c:forEach items="${garosu}" var="garosu">
  garosu.push('${garosu}');
</c:forEach>

// GIMPO WEEKLY
let gimpo=[];
<c:set var="gimpo" value="${gimpo}" />
<c:forEach items="${gimpo}" var="gimpo">
  gimpo.push('${gimpo}');
</c:forEach>

// HONGDAE WEEKLY
let hongdae=[];
<c:set var="hongdae" value="${hongdae}" />
<c:forEach items="${hongdae}" var="hongdae">
hongdae.push('${hongdae}');
</c:forEach>

// INCHEON WEEKLY
let incheon=[];
<c:set var="incheon" value="${incheon}" />
<c:forEach items="${incheon}" var="incheon">
  incheon.push('${incheon}');
</c:forEach>

// YEOUIDO WEEKLY
let yeouido=[];
<c:set var="yeouido" value="${yeouido}" />
<c:forEach items="${yeouido}" var="yeouido">
  yeouido.push('${yeouido}');
</c:forEach>

// stacked graph data
const con = document.getElementById('wholesales');
const config = new Chart(con, {
		  type: 'bar',
		  data: {
				  labels: week,
				  datasets: [
				    {
				      label: '가로수',
				      data: garosu,
				      backgroundColor: 'rgba(255, 99, 132, 0.4)',
				      borderColor: 'rgba(255, 99, 132, 0.2)',
				      borderWidth: 1,
				    },
				    {
				      label: '김포',
				      data: gimpo,
				      backgroundColor: 'rgba(255, 205, 86, 0.4)',
				      borderColor: 'rgba(54, 162, 235, 0.2)',
				      borderWidth: 1,
				    },
				    {
				      label: '홍대',
				      data: hongdae,
				      backgroundColor: 'rgba(75, 192, 192, 0.4)',
				      borderColor: 'rgba(255, 206, 86, 0.2)',
				      borderWidth: 1,
				    },
				    {
				        label: '인천',
				        data: incheon,
				        backgroundColor: 'rgba(54, 162, 235, 0.4)',
				        borderColor: 'rgba(75, 192, 192, 0.2)',
					    borderWidth: 1,
				    },
				    {
				        label: '여의도',
				        data: yeouido,
				        backgroundColor: 'rgba(153, 102, 255, 0.4)',
				        borderColor: 'rgba(153, 102, 255, 0.2)',
					    borderWidth: 1,
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
		    responsive: false,
		    scales: {
		        xAxes: [{
		           stacked: true 
		        }],
		        yAxes: [{
		           stacked: true 
		        }]
		     }
		  }
		});
</script>
</body>
</html>