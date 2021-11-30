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

</style>	
</head>
<body>
	<jsp:include page="../include/shop_top.jsp" />
	<div align="center">
	<form method="post" 
			action="<%=request.getContextPath() %>/shop_summary.do">
	<table>
		
		<tr>
			<td>검색 기간&nbsp;&nbsp;</td>
			<td><input type="date" name="sdate">&nbsp;&nbsp;&nbsp;&nbsp;-</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="edate"></td>
		</tr>
		<tr>
			<td>검색 매장&nbsp;&nbsp;</td>
			<td><select name="shopname" required>
	            	   <option value="garosu" selected>Apple 가로수길</option>
	            	   <option value="yeouido">Apple 여의도점</option>
	            	   <option value="hongdae">프리스비 홍대점</option>
	            	   <option value="gimpo">윌리스 김포공항</option>
	            	   <option value="incheon">윌리스 인천터미널점</option>
			</select></td>
			<td align="right"><button type="submit">확인</button></td>
		</tr>
	</table>
	</form>
	<c:set var="psales" value="${proddata}" />
	<c:set var="dsales" value="${perioddata}" />
	<c:if test="${empty dsales}">
	<br><br>
	<h5>내용을 선택 후 확인버튼을 눌러주세요.</h5>
	</c:if>
	<c:if test="${!empty dsales}">
	<canvas id="prodsales" width="500" height="500"></canvas>
	<table>
		<tr>
			<th>매출 일자</th><th>매출액</th>
		</tr>
		<c:forEach var="i" items="${dsales}">
		<tr>
			<td> ${i.key}</td>
			<td> ${i.value} </td>
		</tr>
		</c:forEach>
	</table>
	</c:if>	
	</div>
<script>


let proddata=[];
<c:forEach items="${psales}" var="sales">
proddata.push('${sales}');
</c:forEach>

const pie = document.getElementById('prodsales');
const pieChart = new Chart(pie, {
    type: 'pie',
    data: {
        labels: ['iPad','iPhone','Airpods','AppleWatch'],
        datasets: [{
            label: '제품별 매출액',
            data: proddata,
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
    	responsive: false,
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