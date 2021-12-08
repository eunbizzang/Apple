<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	    padding-bottom: 150px; /* footer의 높이 */
	}
	
	.big{
	   
	   margin: 50px auto;
	   width: 1100px;
	   height: 800px;
	   
	   display: flex;
	   /* border: 1px solid #F0FFF0; */
	   
	}
	
	.small{
	   margin: 30px;
	   width: 500px;
	   height: 600px;
	   
	   flex-direction: row-reverse;
	   
	}
	
	.first{
	   
	   margin-bottom: 50px;
	   width: 500px;
	   height: 320px;
	   
	  border: 3px solid #B0C4DE;
	  border-radius:5px;
	}
	
	.second {
	  width: 500px;
	  height: 320px;
	  margin: 0 auto;
	  background-color: white;
	  position: relative;
	  overflow: hidden;
	  border: 3px solid #B0C4DE;
	  border-radius:5px;
	}

	.second .panel {
	  width: 100%;
	  height: 100%;
	  position: relative;
	  background-color: white;
	}
	
	.second .panel li {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  top: 0px;
	  left: 0px;
	  color: #fff;
	  font-size: 30px;
	  display: none;
	}
	
 	.panel li:nth-child(1) {
	  background-color: white;
	  display: block;
	}

	.third{
	   margin-top: 50px;
	   
	   width: 500px;
	   height: 320px;
	  border: 3px solid #B0C4DE;
	  border-radius:5px;
	}
	.space {
		margin-top : 20px;
	}
	
	.notice_title {
	   font-weight: bold;
	}
	
	.notice_date {
	   text-align: right;
	   font-weight: bold;
	}
	
	.board_date {
	   text-align: right;
	}
	
	td a {
	   text-decoration: none;
	   color: black;
	}
	
	div.ordercard {
	   width:500px;
	   height: 220px;
	   /* background-color: white; */
	   /* margin: 0 auto; */
	}
	
	div.date {
	   text-align: center;
	   color: black;
	   font-size: 20px;
	   font-family: 'Noto Sans KR', sans-serif;
	   margin-top: 15px;
	}
	
	div.cont {
	   text-align: center;
	   color:    black;
	   font-size: 18px;
	   font-family: 'Noto Sans KR', sans-serif;
	   margin-top: 30px;
	}
	
	div.count {
	   text-align: center;
	   color: #1565C0;
	   font-size: 35px;
	   font-weight: bold;
	   font-family: 'Noto Sans KR', sans-serif;
	   margin-top: 35px;
	}
	
	.slidebtn {
	  position: absolute;
	  bottom: 10px;
	  left: 50%;
	  margin-left: -110px;
	}
	
	.slidebtn li {
	  float:left;
	  width: 10px;
	  height: 10px;
	  border-radius: 50px;
	  background-color: #CACACA;
	  text-indent: -9999px;
	  margin-right: 20px;
	  cursor: pointer;
	}
	
 	.slidebtn .on {
	  background-color: #424242;
	} 
	
 	.slidebtn li:hover {
	  background-color: #424242;
	} 
	
	.slidebtn li:last-child {
	  margin-right: 0px;
	}
	
	.prev {
	  position: absolute;
	  left: 50px;
	  top: 50%;
	  width: 70px;
	  height: 70px;
	  margin-top: -15px;
	  background-color: white;
	  border: white;
	}
	
	.next {
	  position: absolute;
	  right: 50px;
	  top: 50%;
	  width: 70px;
	  height: 70px;
	  margin-top: -15px;
	  background-color: white;
	  border: white;
	}
	
	ul {
	  list-style: none;
	}
	
	.navbar {
		margin-bottom: 12px;
	}
	.tcover {
		width:450px;
	}
	.plusbtn {
		width: 40px;
		height: 40px;
		border: 3px solid #B0C4DE;
	  border-radius:5px;
	  background-color: white;
	}
	.plusbtn:hover {
	background-color: #B0C4DE;
}

.table {
	width: 400px;
	height: 220px;
	font-size:10.5px;
}
</style>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<jsp:include page="../include/admin_top.jsp" />
	<div id="body-wrapper">
	<div id="body-content">
	<div class="big" align="center">
	
	<div class="small">
	
	<div class="first">
		<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">월 매출</a>
			    	<button type="button" class="plusbtn" onclick="location.href='<%=request.getContextPath() %>/admin_monthly.do'">+</button>
				</div>
		</nav>
		<div class="space"><canvas id="shopsales" width="400" height="230"></canvas></div>
	</div>
	
	<div align="center" class="first">
		<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">주간 매출</a>
			    	<button type="button" class="plusbtn" onclick="location.href='<%=request.getContextPath() %>/admin_weekly.do'">+</button>
				</div>
		</nav>
		<div class="space"><canvas id="wholesales" width="400" height="230"></canvas></div>
	</div>
	
	</div>
	
	<div class="small">

		<div class="second">
		
		<c:set var="now" value="<%=new Date()%>" />
           <nav class="navbar navbar-light bg-light">
           		<div class="container-fluid">
	                <a class="navbar-brand">발주요청</a>
	                <button type="button" class="plusbtn" onclick="location.href='<%=request.getContextPath() %>/admin_order.do'">+</button>
           		</div>
         	</nav>
        <div class="tcover"> 
        <div class="overcard">	
		<ul class="panel">
		    <li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${ordercount } 건</div>
		   		 <div class="cont">total</div> </li>
		    <li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${ycount } 건</div>
		   		 <div class="cont">여의도점</div> </li>
		    <li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${gacount } 건</div>
		   		 <div class="cont">가로수길점</div> </li>
		    <li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${hcount } 건</div>
		   		 <div class="cont">홍대점</div> </li>
		    <li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${gicount } 건</div>
		   		 <div class="cont">김포공항점</div> </li>
		   	<li> <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
		    	 <div class="count">${icount } 건</div>
		   		 <div class="cont">인천터미널점</div> </li>
	  	</ul>
	  	</div>
	  	
		<ul class="slidebtn">
		    <li class="on">버튼1</li>
		    <li>버튼2</li>
		    <li>버튼3</li>
		    <li>버튼4</li>
		    <li>버튼5</li>
		    <li>버튼6</li>
		</ul>
		
		<div>
			<button class="prev"><img src="images/back.png"></button>
		</div>
		<div>
		<button class="next"><img src="images/next.png"></button>
		</div>
		</div>
	</div>
	
		<%-- <div class="second">
      	<c:set var="now" value="<%=new Date()%>" />
           <nav class="navbar navbar-light bg-light">
           		<div class="container-fluid">
	                <a class="navbar-brand">발주요청</a>
	                <button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath() %>/admin_order.do'">+</button>
           		</div>
         	</nav>
         
	         <div class="ordercard">
	            <div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
	            <div class="count">${ordercount } 건</div>
	            <div class="cont"> total </div>
	         </div>
      	</div> --%>
		
		<div class="third">
			<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">공지사항</a>
			    	<button type="button" class="plusbtn" onclick="location.href='<%=request.getContextPath() %>/admin_board_list.do'">+</button>
				</div>
			</nav>
			
			<c:set var="notice" value="${noticelist }" />
			<c:set var="board" value="${boardlist }" />
			<div class="tcover">
			<table class="table">
				<tbody>
					<c:if test="${!empty notice }">
						<c:forEach items="${notice }" var="ndto">
						    <tr>
						    	<td class="notice_title">
						    		<!-- <img src="images/notice3.png" width="41" height="21">&nbsp; --> 
						    		<span class="badge rounded-pill bg-warning text-dark">공지</span> &nbsp;
						    		<a href="<%=request.getContextPath() %>/admin_board_content.do?num=${ndto.getBoard_no() }&page=1 ">
									 ${ndto.getBoard_title() } </a> </td>
						    	<td class="notice_date">${ndto.getBoard_date().substring(0, 10) }</td>
						    </tr>
			    		</c:forEach>
			    	</c:if>
			    		
			    	<c:if test="${!empty board }">
			    		<c:forEach items="${board }" var="bdto">
							<tr>
								<td>[${bdto.getBoard_code() }] &nbsp;
									<a href="<%=request.getContextPath() %>/admin_board_content.do?num=${bdto.getBoard_no() }&page=1 ">
									 ${bdto.getBoard_title() } </a> </td>
								<td class="board_date">${bdto.getBoard_date().substring(0, 10) }</td>
							</tr>
						</c:forEach>
					</c:if>
			  	</tbody>
			</table>
			</div>
		</div>
		
	</div>
	
</div>
</div>
<jsp:include page="../include/shop_bottom.jsp" />
</div>
<script>
let week=[];
<c:set var="week" value="${week}" />
<c:forEach items="${week}" var="week">
week.push('${week}'.substring(5, 10));
</c:forEach>
let garosu=[];
<c:set var="garosu" value="${garosu}" />
<c:forEach items="${garosu}" var="garosu">
garosu.push('${garosu}');
</c:forEach>
let gimpo=[];
<c:set var="gimpo" value="${gimpo}" />
<c:forEach items="${gimpo}" var="gimpo">
gimpo.push('${gimpo}');
</c:forEach>
let hongdae=[];
<c:set var="hongdae" value="${hongdae}" />
<c:forEach items="${hongdae}" var="hongdae">
hongdae.push('${hongdae}');
</c:forEach>
let incheon=[];
<c:set var="incheon" value="${incheon}" />
<c:forEach items="${incheon}" var="incheon">
incheon.push('${incheon}');
</c:forEach>
let yeouido=[];
<c:set var="yeouido" value="${yeouido}" />
<c:forEach items="${yeouido}" var="yeouido">
yeouido.push('${yeouido}');
</c:forEach>
const con = document.getElementById('wholesales');
const config = new Chart(con, {
	type: 'bar',
	data: {
		labels: week,
		datasets: [
		{
			label: 'GAROSU',
			data: garosu,
			backgroundColor: 'rgba(255, 99, 132, 0.4)',
			borderColor: 'rgba(255, 99, 132, 0.2)',
			borderWidth: 1,
		},
		{
		label: 'GIMPO',
		data: gimpo,
		backgroundColor: 'rgba(255, 205, 86, 0.4)',
		borderColor: 'rgba(54, 162, 235, 0.2)',
		borderWidth: 1,
		},
		{
		label: 'HONGDAE',
		data: hongdae,
		backgroundColor: 'rgba(75, 192, 192, 0.4)',
		borderColor: 'rgba(255, 206, 86, 0.2)',
		borderWidth: 1,
		},
		{
		label: 'INCHEON',
		data: incheon,
		backgroundColor: 'rgba(54, 162, 235, 0.4)',
		borderColor: 'rgba(75, 192, 192, 0.2)',
		borderWidth: 1,
		},
		{
		label: 'YEOUIDO',
		data: yeouido,
		backgroundColor: 'rgba(153, 102, 255, 0.4)',
		borderColor: 'rgba(153, 102, 255, 0.2)',
		borderWidth: 1,
		},
		]
	},
		options: {
			legend: {
		        display: false
		    },
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
		
//shop monthly sales
<c:set var="gathistotal" value="${gathistotal}" />
<c:set var="githistotal" value="${githistotal}" />
<c:set var="hothistotal" value="${hothistotal}" />
<c:set var="inthistotal" value="${inthistotal}" />
<c:set var="yethistotal" value="${yethistotal}" />

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
// monthly shop sales end

$(document).ready(function() {

	  //좌우버튼, 동그라미 버튼 연동 //

	  var wid = $(".slider").width();
	  var i = $(".slidebtn li.on").index();
	  var len = $(".panel li").length;

	  $(".prev").click(function() {

	    if (i == 0) {
	      i = len - 1;
	    } else {
	      i = i - 1;
	    }
	    showSlide();
	  });

	  $(".next").click(function() {
	    if (i == 5) {
	      i = 0;
	    } else {
	      i = i + 1;
	    }
	    showSlide();
	  });

	  $(".slidebtn li").click(function() {
	    i = $(this).index();
	    showSlide();
	  });

	  function showSlide() {
	    $(".slidebtn li").removeClass("on");
	    $(".slidebtn li").eq(i).addClass("on");
	    $(".panel li").stop(true, true).fadeOut();
	    $(".panel li").eq(i).stop(true, true).fadeIn();
	  }
	});
</script>
</body>

</html>