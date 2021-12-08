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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
body {
  font-family: 'Noto Sans KR', sans-serif;
}
#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 0px;
    padding-bottom: 170px; /* footer의 높이 */
}
.table-wrapper {
  width: 450px; height:380px;
  overflow: auto;
  border-radius:5px;
  padding: auto;
  border-radius:5px;
  border: solid 3px #B0C4DE;
}
table {
  border-collapse: separate;
  text-align: center;
  margin: 2px 10px;
  
}
.wrapper {
  width: 500px; height:650px;
  border-spacing: 10px;
  padding: auto;
}
.title {
	margin-top: 30px;
	font-size : 25px;
	font-weight: bold;
}
#container {
    width:100%;
    display:flex; flex-flow:row wrap;
    grid-template-columns: 1fr 1fr; 
    justify-content: center;
}
.item { padding: 8px;  }
.input {
  height:35px;
  font-size:15px;
  background-color: white;
  padding: 2px;  
  border: 1px solid lightgrey;
  border-radius:5px;
}
.graph {
	margin-top: 50px;
	margin-bottom: 50px;
}
.total {
	width: 450px;
	margin-top:40px;
	margin-bottom: 10px;
	font-size:20px;
	font-weight: bold;
	color:#483D8B;
}
.selected {
	width: 430px;
	font-size:18px;
	margin-top:30px;
}
.boxt {
	width:400px;
	text-align:center;
  border-collapse: separate;
  text-align: center;
  margin: 2px 10px;
}
</style>   
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<div id="body-wrapper">
		<div id="body-content">
			<div id="container">
				<div class="item">
					<div class="wrapper" align="center">
						<!-- product sales graph(selected period) -->
						<c:set var="psales" value="${proddata}" />
						<div class="graph">
							<canvas id="prodsales" width="400" height="400"></canvas>
						</div>
						<!-- product sales table(selected period) -->
						<table class="boxt" width="400">
							<tr>
								<th>제품군</th><th>판매대수</th>
							</tr>
							<tr>
								<td> iPad</td>
								<td> ${psales[0]} </td>
							</tr>
							<tr>
								<td> iPhone</td>
								<td> ${psales[1]} </td>
							</tr>
							<tr>
								<td> AirPods</td>
								<td> ${psales[2]} </td>
							</tr>
							<tr>
								<td> AppleWatch</td>
								<td> ${psales[3]} </td>
							</tr>
						</table>
					</div>
				</div>
				<div class="item">
					<div class="wrapper" align="center">
						<c:set var="dsales" value="${perioddata}" />
						<p class="title">매출 조회</p>
						<!-- sales period search form -->
						<form method="post" 
								action="<%=request.getContextPath() %>/admin_summary_check.do">
						<table class="selected">
							<tr>
								<td>기간</td>
								<td><input class="input" type="date" name="sdate" id="sdate" style="width:170px;" required></td>
								<td>-</td><td><input class="input" type="date" id="edate" style="width:170px;" name="edate" required></td>
							</tr>
							<tr>
								<td>매장</td>
								<td><select class="input" id="shopname" style="width:170px;" name="shopname" required>
						            	   <option value="garosu" selected>Apple 가로수길</option>
						            	   <option value="yeouido">Apple 여의도점</option>
						            	   <option value="hongdae">프리스비 홍대점</option>
						            	   <option value="gimpo">윌리스 김포공항</option>
						            	   <option value="incheon">윌리스 인천터미널점</option>
								</select></td><td></td>
								<td align="right"><button class="input" style="width:40px;" type="submit">확인</button></td>
							</tr>
						</table>
						</form>
						<!-- Sales total (during selected period) -->
						<table class="total">
							<tr>
								<td>조회 기간 매출 총액</td><td><c:set var="total" value="${total}" />
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/> 원</td>
							</tr>
						</table>
						<div class='table-wrapper'>
							<table class="boxt">
								<tr>
									<th>매출 일자</th><th>매출액</th>
								</tr>
								<c:forEach var="i" items="${dsales}">
								<tr>
									<td> ${i.key}</td>
									<td>  <fmt:formatNumber type="number" maxFractionDigits="3"
								 value="${i.value}"/> 원</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>	
			</div>
		</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
<script>

// Set date for the selected period
<c:set var="submitdata" value="${submitdata}" />
	// set selected date
  <c:if test="${!empty submitdata}">
    document.getElementById("sdate").value = '${submitdata[1]}';
	document.getElementById("edate").value = '${submitdata[2]}';
	$('#shopname option[value=${submitdata[0]}]').attr('selected','selected');
  </c:if>
  <c:if test="${empty submitdata}">
  	// set current date
    const d = new Date();
	const year = d.getFullYear(); // 년
	const month = d.getMonth();   // 월
	const day = d.getDate();      // 일
	document.getElementById("sdate").value = new Date(year, month - 1, day+1).toISOString().substring(0, 10);
	document.getElementById("edate").value = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0, 10);
  </c:if>

// prod sales date
let proddata=[];
<c:forEach items="${psales}" var="sales">
  proddata.push('${sales}');
</c:forEach>

// prod sales graph setting
const pie = document.getElementById('prodsales');
const pieChart = new Chart(pie, {
    type: 'pie',
    data: {
        labels: ['iPad','iPhone','Airpods','AppleWatch'],
        datasets: [{
            label: '제품별 매출액',
            data: proddata,
            backgroundColor: [
            	'rgba(255, 99, 132, 0.4)',
                'rgba(54, 162, 235, 0.4)',
                'rgba(255, 206, 86, 0.4)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(153, 102, 255, 0.4)',
                'rgba(255, 159, 64, 0.4)'
            ],
            borderColor: [
            	'rgba(255, 99, 132, 0.4)',
                'rgba(54, 162, 235, 0.4)',
                'rgba(255, 206, 86, 0.4)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(153, 102, 255, 0.4)',
                'rgba(255, 159, 64, 0.4)'
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