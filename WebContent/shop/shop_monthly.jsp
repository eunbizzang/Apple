<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
<style>
#container {
    width:100%;
    display:flex; flex-flow:row wrap;
}

#left {
    float:left;
    width:50%;
}

#center {
    display: inline-block;
    margin:0 auto;
    width:20%;
}

#right {
    float:right;
    width:30%;
}
</style>	
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />
	<c:set var="month" value="${monthlabel}" />
	<div align="center">
	<form method="post" 
			action="<%=request.getContextPath() %>/shop_monthly_check.do">
	<table>
		<tr>
			<td><input type="month" name="month"></td>
			<td align="right"><button type="submit">Check</button></td>
		</tr>
	</table>
	</form>
	</div>
<h4>Apple 가로수길	</h4>
<div id="container">
<div id="left">
<c:set var="gamonthlysaleslist" value="${gamonthlysaleslist}" />
<c:set var="galasttotal" value="${galasttotal}" />	
<c:set var="gathistotal" value="${gathistotal}" />
<canvas id="gamonthsales" width="600" height="180"></canvas>
</div>
<div id="center">
	<canvas id="gashopsales"width="200" height="200"></canvas>
</div>
<div id="right">
<table width = "400">
	<tr>
		<td> ${month[0] } 총 매출</td>
		<td> ${galasttotal} 원</td>
	</tr>
	<tr>
		<td> ${month[1] } 총 매출</td>
		<td> ${gathistotal} 원</td>
	</tr>
	<tr>
		<td> 전달대비 매출</td>
		<td>
		 ${gathistotal-galasttotal} 원</td>
	</tr>
	<tr>
		<td> 전달대비 매출(%) </td>
		<td id="check"> 
		<fmt:formatNumber value="${(gathistotal-galasttotal)/galasttotal*100}" pattern=".00"/>%</td>
	</tr>
</table>
</div>	
</div>
<div id="container">
<h4>윌리스 김포공항	</h4>
<h4>프리스비 홍대점	</h4>
<h4>윌리스 인천터미널점	</h4>
<h4>Apple 여의도 점	</h4>
</div>
<script>
/* <h4>Apple 가로수길	</h4>
<h4>윌리스 김포공항	</h4>
<h4>프리스비 홍대점	</h4>
<h4>윌리스 인천터미널점	</h4>
<h4>Apple 여의도 점	</h4> */

element = document.getElementById('check');
  if (element.innerHTML > 0) {
    element.style.color = "red";
  }else if (element.innerHTML < 0) {
	    element.style.color = "blue";
  }

let label=[];
<c:forEach items="${month}" var="month">
label.push('${month}');
</c:forEach>

// garosu
const ctx = document.getElementById('gashopsales');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: label,
        datasets: [{
            label: '전월대비 매출액',
            data: [${galasttotal}, ${gathistotal}],
            backgroundColor: [
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
            	'rgb(54, 162, 235)',
            	 'rgb(255, 99, 132)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	legend: {
            display: false
        },
    	responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

let gamonthList=[];
<c:forEach var="i" items="${gamonthlysaleslist}">
gamonthList.push('${i.key}');
</c:forEach>
let gamonthData=[];
<c:forEach var="i" items="${gamonthlysaleslist}">
gamonthData.push('${i.value}');
</c:forEach>

const line = document.getElementById('gamonthsales');
const config = new Chart(line, {
		  type: 'line',
		  data: {
			  labels: gamonthList,
			  datasets: [
			    {
			      label: label[1],
			      data: gamonthData,
			      borderColor: 'rgba(255, 99, 132, 0.2)',
			      backgroundColor: 'rgba(255, 99, 132, 0.2)',
			      fill: 'start'
			    }
			  ]
			},
		  options: {
				legend: {
			        display: false
			    },
			responsive: false,
		  },
		});
//garosu end


</script>
</body>
</html>