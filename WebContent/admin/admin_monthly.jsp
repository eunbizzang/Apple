<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
#container1 {
    width:100%;
    display:flex; flex-flow:row wrap;
    grid-template-columns: 3fr 1fr 1fr 1fr ; 
}
#container2 {
    width:100%;
    display:flex; flex-flow:row wrap;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr; 
}
.item { 
	padding: 8px;  
	margin:auto;
}
#box {
	width:940px;
}
#date {
	margin-bottom:20px;
	margin-right: 35px;
}
input {
	width:250px;
	height:40px;
	font-size:20px;
	padding: 8px;  
  	border-radius:5px;
  	border: solid 3px #B0C4DE;
}
.table {
	border-collapse: collapse;
	font-size:15px;
}  
.table th {
	padding: 10px;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
	text-align: left;
}
.table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
p.garosu:before {
	margin-right: 10px;
	font-size:23px;
    content: ' \25A0';
    color:rgba(255, 99, 132, 0.4);
}
p.gimpo:before {
	margin-right: 10px;
	font-size:23px;
    content: ' \25A0';
    color:rgba(255, 205, 86, 0.4);
}
p.hongdae:before {
	margin-right: 10px;
	font-size:23px;
    content: ' \25A0';
    color:rgba(75, 192, 192, 0.4);
}
p.incheon:before {
	margin-right: 10px;
	font-size:23px;
    content: ' \25A0';
    color:rgba(54, 162, 235, 0.4);
}
p.yeouido:before {
	margin-right: 10px;
	font-size:23px;
    content: ' \25A0';
    color:rgba(153, 102, 255, 0.4);
}
.red{
	color:#dc143c;
}
.blue{
	color:#0000cd;
}
</style>	
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<div id="body-wrapper">
		<div id="body-content">
		<c:set var="month" value="${monthlabel}" />	
			<div id="container1">
				<div class="item" id="box">
					<div id="date" align="right">
					<!-- Month search form -->
					<form method="post" 
						action="<%=request.getContextPath() %>/admin_monthly_check.do">
						<input type="month" id="month" name="month" onchange="this.form.submit()">
					</form>
					</div>
					<!-- Total sales graph(selected date) -->
					<canvas id="shopsales" width="890" height="200"></canvas>
				</div>
				
				<!-- GAROSU -->
				<div class="item">
					<p class="garosu">Apple 가로수길</p>
					<table class="table" width="250">
						<tr>
							<th> ${month[0] }</th>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"  value="${galasttotal}"/> 원</td>
						</tr>
						<tr>
							<th> ${month[1] }</th>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${gathistotal}"/> 원</td>
						</tr>
						<tr>
							<th> 전월대비 </th>
							<td><div class="zero"><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${gathistotal-galasttotal}"/> 원</div></td>
						</tr>
						<tr>
							<th> (%) </th>
							<td id="check"> 
							<fmt:formatNumber value="${(gathistotal-galasttotal)/galasttotal*100}" pattern=".00"/>%</td>
						</tr>
					</table>
				</div>
				<div class="item">
					<canvas id="gashopsales"width="250" height="250"></canvas>
				</div>
				<div class="item">
					<c:set var="gamonthlysaleslist" value="${gamonthlysaleslist}" />
					<c:set var="galasttotal" value="${galasttotal}" />	
					<c:set var="gathistotal" value="${gathistotal}" />
					<canvas id="gamonthsales" width="400" height="250"></canvas>
				</div>
			</div>
			<div id="container2">
				<!-- GIMPO -->
				<div class="item">
					<p class="gimpo">윌리스 김포공항	</p>
					<table class="table" width="250">
						<tr>
							<td> ${month[0] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${gilasttotal}"/> 원</td>
						</tr>
						<tr>
							<td> ${month[1] }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${githistotal}"/> 원</td>
						</tr>
						<tr>
							<td> 전월대비 </td>
							<td><div class="zero"><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${githistotal-gilasttotal}"/> 원</div></td>
						</tr>
						<tr>
							<td> (%) </td>
							<td><fmt:formatNumber value="${(githistotal-gilasttotal)/gilasttotal*100}" pattern=".00"/>%</td>
						</tr>
					</table>
				</div>	
				<div class="item">
					<canvas id="gishopsales"width="250" height="250"></canvas>
				</div>
				<div class="item">
					<c:set var="gimonthlysaleslist" value="${gimonthlysaleslist}" />
					<c:set var="gilasttotal" value="${gilasttotal}" />	
					<c:set var="githistotal" value="${githistotal}" />
					<canvas id="gimonthsales" width="400" height="250"></canvas>
				</div>
				<!-- HONGDAE -->
				<div class="item">
					<p class="hongdae">프리스비 홍대점	</p>
					<table class="table" width="250">
						<tr>
							<td> ${month[0] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${holasttotal}"/> 원</td>
						</tr>
						<tr>
							<td> ${month[1] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${hothistotal}"/> 원</td>
						</tr>
						<tr>
							<td> 전월대비 </td>
							<td><div class="zero"><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${hothistotal-holasttotal}"/> 원</div></td>
						</tr>
						<tr>
							<td> (%) </td>
							<td><fmt:formatNumber value="${(hothistotal-holasttotal)/holasttotal*100}" pattern=".00"/>%</td>
						</tr>
					</table>
				</div>	
				<div class="item">
					<canvas id="hoshopsales"width="250" height="250"></canvas>
				</div>
				<div class="item">
					<c:set var="homonthlysaleslist" value="${homonthlysaleslist}" />
					<c:set var="holasttotal" value="${holasttotal}" />	
					<c:set var="hothistotal" value="${hothistotal}" />
					<canvas id="homonthsales" width="400" height="250"></canvas>
				</div>
			</div>
			<div id="container2">
				<!-- INCHEON -->
				<div class="item">
					<p class="incheon">윌리스 인천터미널</p>
					<table class="table" width="230">
						<tr>
							<td> ${month[0] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${inlasttotal}"/> 원</td>
						</tr>
						<tr>
							<td> ${month[1] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${inthistotal}"/> 원</td>
						</tr>
						<tr>
							<td> 전월대비 </td>
							<td><div class="zero"><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${inthistotal-inlasttotal}"/> 원</div></td>
						</tr>
						<tr>
							<td> (%) </td>
							<td><fmt:formatNumber value="${(inthistotal-inlasttotal)/inlasttotal*100}" pattern=".00"/>%</td>
						</tr>
					</table>
				</div>	
				<div class="item">
					<canvas id="inshopsales"width="250" height="250"></canvas>
				</div>
				<div class="item">
					<c:set var="inmonthlysaleslist" value="${inmonthlysaleslist}" />
					<c:set var="inlasttotal" value="${inlasttotal}" />	
					<c:set var="inthistotal" value="${inthistotal}" />
					<canvas id="inmonthsales" width="400" height="250"></canvas>
				</div>
				<!-- YEOUIDO -->
				<div class="item">
					<p class="yeouido">Apple 여의도 점	</p>
					<table class="table" width="230">
						<tr>
							<td> ${month[0] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${yelasttotal}"/> 원</td>
						</tr>
						<tr>
							<td> ${month[1] }</td>
							<td> <fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${yethistotal}"/> 원</td>
						</tr>
						<tr>
							<td> 전월대비 </td>
							<td><div class="zero"><fmt:formatNumber type="number" maxFractionDigits="3"
							 value="${yethistotal-yelasttotal}"/> 원</div></td>
						</tr>
						<tr>
							<td> (%) </td>
							<td><fmt:formatNumber value="${(yethistotal-yelasttotal)/yelasttotal*100}" pattern=".00"/>%</td>
						</tr>
					</table>
				</div>	
				<div class="item">
					<canvas id="yeshopsales"width="250" height="250"></canvas>
				</div>
				<div class="item">
					<c:set var="yemonthlysaleslist" value="${yemonthlysaleslist}" />
					<c:set var="yelasttotal" value="${yelasttotal}" />	
					<c:set var="yethistotal" value="${yethistotal}" />
					<canvas id="yemonthsales" width="400" height="250"></canvas>
				</div>
			</div>
		</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
<script>

//change color action for the sales data(+,-)
  $('.zero').each(function() {
	  if (parseFloat($(this).text()) > 0) {
		  $(this).prepend('+');
		  $(this).addClass('red');
		  }else if(parseFloat($(this).text()) < 0) {
			  $(this).addClass('blue');
			  }
  });

//set data for the date input form
<c:set var="thismonth" value="${thismonth}" />
// set input form with thismonth
<c:if test="${!empty thismonth}">
  document.getElementById("month").value = '${thismonth}';
</c:if>
//set input for with selected month
<c:if test="${empty thismonth}">
  document.getElementById("month").value = new Date().toISOString().slice(0, 7);
</c:if>

//date label for selected month(thismonth & lastmonth)
let label=[];
<c:forEach items="${month}" var="month">
  label.push('${month}');
</c:forEach>

//GAROSU
//GAROSU(selectedmonth, one month before)
const garosu = document.getElementById('gashopsales');
const garosuChart = new Chart(garosu, {
	type: 'bar',
	data: {
		labels: label,
		datasets: [{
			data: [${galasttotal}, ${gathistotal}],
			backgroundColor: [
				'rgba(211,211,211, 0.4)',
				'rgba(255, 99, 132, 0.4)'
				],
			borderColor: [
				'rgb(169,169,169)',
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
        yAxes: [{
               display: true,
               ticks: {
                   beginAtZero: true
               }
           }]
       }
    }
});

//GAROSU monthly data(date)
let gamonthList=[];
<c:forEach var="i" items="${gamonthlysaleslist}">
  gamonthList.push('${i.key}'.substring(5, 10));
</c:forEach>

//GAROSU monthly data(sales data)
let gamonthData=[];
<c:forEach var="i" items="${gamonthlysaleslist}">
  gamonthData.push('${i.value}');
</c:forEach>
const gal = document.getElementById('gamonthsales');
const galine = new Chart(gal, {
	type: 'line',
	data: {
		labels: gamonthList,
		datasets: [{
			label: label[1],
			data: gamonthData,
			borderColor: 'rgba(255, 99, 132, 0.2)',
			backgroundColor: 'rgba(255, 99, 132, 0.4)',
			fill: 'start'
		  }]
		},
		options: {
			legend: {
			        display: false
			    },
			responsive: false,
		  },
		});
// GAROSU end

//GIMPO
//GIMPO(selectedmonth, one month before)
const gimpo = document.getElementById('gishopsales');
const gimpoChart = new Chart(gimpo, {
  type: 'bar',
  data: {
      labels: label,
      datasets: [{
          data: [${gilasttotal}, ${githistotal}],
          backgroundColor: [
          	'rgba(211,211,211, 0.4)',
          	'rgba(255, 205, 86, 0.4)'
          ],
          borderColor: [
          	'rgb(169,169,169)',
          	 'rgb(255, 205, 86)'
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
           yAxes: [{
               display: true,
               ticks: {
                   beginAtZero: true
               }
           }]
       }
  }
});

//GIMPO monthly data(date)
let gimonthList=[];
<c:forEach var="i" items="${gimonthlysaleslist}">
  gimonthList.push('${i.key}'.substring(5, 10));
</c:forEach>

//GIMPO monthly data(sales data)
let gimonthData=[];
<c:forEach var="i" items="${gimonthlysaleslist}">
  gimonthData.push('${i.value}');
</c:forEach>

const gimpol = document.getElementById('gimonthsales');
const gimpoline = new Chart(gimpol, {
		  type: 'line',
		  data: {
			  labels: gimonthList,
			  datasets: [
			    {
			      data: gimonthData,
			      borderColor: 'rgba(255, 205, 86)',
			      backgroundColor: 'rgba(255, 205, 86, 0.4)',
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
//GIMPO end

//HONGDAE
//HONGDAE(selectedmonth, one month before)
const hongdae = document.getElementById('hoshopsales');
const hongdaeChart = new Chart(hongdae, {
  type: 'bar',
  data: {
      labels: label,
      datasets: [{
          data: [${holasttotal}, ${hothistotal}],
          backgroundColor: [
          	'rgba(211,211,211, 0.4)',
          	'rgba(75, 192, 192, 0.4)'
          ],
          borderColor: [
          	'rgb(169,169,169)',
          	 'rgb(75, 192, 192)'
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
           yAxes: [{
               display: true,
               ticks: {
                   beginAtZero: true
               }
           }]
       }
  }
});
//HONGDAE monthly data(date)
let homonthList=[];
<c:forEach var="i" items="${homonthlysaleslist}">
  homonthList.push('${i.key}'.substring(5, 10));
</c:forEach>

//HONGDAE monthly data(sales data)
let homonthData=[];
<c:forEach var="i" items="${homonthlysaleslist}">
  homonthData.push('${i.value}');
</c:forEach>
const hol = document.getElementById('homonthsales');
const holine = new Chart(hol, {
		  type: 'line',
		  data: {
			  labels: homonthList,
			  datasets: [
			    {
			      label: label[1],
			      data: homonthData,
			      borderColor: 'rgba(75, 192, 192)',
			      backgroundColor: 'rgba(75, 192, 192, 0.4)',
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
//HONGDAE end

//INCHEON(selectedmonth, one month before)
const incheon = document.getElementById('inshopsales');
const incheonChart = new Chart(incheon, {
  type: 'bar',
  data: {
      labels: label,
      datasets: [{
          data: [${inlasttotal}, ${inthistotal}],
          backgroundColor: [
          	'rgba(211,211,211, 0.4)',
          	'rgba(54, 162, 235, 0.4)'
          ],
          borderColor: [
          	'rgb(169,169,169)',
          	 'rgb(54, 162, 235)'
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
           yAxes: [{
               display: true,
               ticks: {
                   beginAtZero: true
               }
           }]
       }
  }
});

//INCHEON monthly data(date)
let inmonthList=[];
<c:forEach var="i" items="${inmonthlysaleslist}">
 inmonthList.push('${i.key}'.substring(5, 10));
</c:forEach>

//INCHEON monthly data(sales data)
let inmonthData=[];
<c:forEach var="i" items="${inmonthlysaleslist}">
 inmonthData.push('${i.value}');
</c:forEach>
const inl = document.getElementById('inmonthsales');
const inline = new Chart(inl, {
		  type: 'line',
		  data: {
			  labels: inmonthList,
			  datasets: [
			    {
			      label: label[1],
			      data: inmonthData,
			      borderColor: 'rgba(54, 162, 235)',
			      backgroundColor: 'rgba(54, 162, 235, 0.4)',
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
//INCHEON end

//YEOUIDO(selectedmonth, one month before)
const yeouido = document.getElementById('yeshopsales');
const yeouidoChart = new Chart(yeouido, {
  type: 'bar',
  data: {
      labels: label,
      datasets: [{
          data: [${yelasttotal}, ${yethistotal}],
          backgroundColor: [
          	'rgba(211,211,211, 0.4)',
          	'rgba(153, 102, 255, 0.4)'
          ],
          borderColor: [
          	'rgb(169,169,169)',
          	 'rgb(153, 102, 255)'
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
           yAxes: [{
               display: true,
               ticks: {
                   beginAtZero: true
               }
           }]
       }
  }
});

//YEOUIDO monthly data(date)
let yemonthList=[];
<c:forEach var="i" items="${yemonthlysaleslist}">
 yemonthList.push('${i.key}'.substring(5, 10));
</c:forEach>

//YEOUIDO monthly data(sales data)
let yemonthData=[];
<c:forEach var="i" items="${yemonthlysaleslist}">
 yemonthData.push('${i.value}');
</c:forEach>
const yel = document.getElementById('yemonthsales');
const yeline = new Chart(yel, {
		  type: 'line',
		  data: {
			  labels: yemonthList,
			  datasets: [
			    {
			      label: label[1],
			      data: yemonthData,
			      borderColor: 'rgba(153, 102, 255)',
			      backgroundColor: 'rgba(153, 102, 255, 0.4)',
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
//YEOUIDO end

//shop monthly sales
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
          data: [${gathistotal},${githistotal},${hothistotal},${inthistotal},${yethistotal}],
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
//monthly shop sales end
</script>
</body>
</html>