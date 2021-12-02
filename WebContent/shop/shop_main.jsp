<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<style type="text/css">

.big{
	
	margin: 0 auto;
	
	width: 900px;
	height: 600px;
	
	display: flex;
	border: 1px solid #F0FFF0;
	
}

.small1{

	width: 450px;
	height: 600px;
	
	flex-direction: row-reverse;
	
}
.first{
	
	width: 450px;
	height: 300px;
	
	
	border: 1px solid #F0FFF0;
}
.first1{
	
	width: 450px;
	height: 300px;
	
	
	border: 1px solid #F0FFF0;
}

.small{
	width: 450px;
	height: 600px;
	
	flex-direction: row-reverse;
	
}

.second{
	width: 450px;
	height: 300px;
	border: 1px solid #F0FFF0;
}

.third{
	/*margin-top: 40px;*/
	
	width:450px;
	height: 300px;
	border: 1px solid #F0FFF0;
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
	display: flex;
	width: 450px;
	height: 220px;
}

div.date {
	position: absolute;
	width: 450px;
	height: 45px;
	text-align: center;
	color: black;
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	padding-top: 20px;
}

div.request {
	flex: 1;
}

div.cont {
	width: 150px;
	height: 30px;
	text-align: center;
	color: 	black;
	font-size: 18px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 40px;
}

div.count {
	width: 150px;
	height: 15px;
	text-align: center;
	color: #1565C0;
	font-size: 35px;
	font-weight: bold;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 90px;
}

</style>

</head>
<body>

<jsp:include page="../include/shop_top.jsp" />

<div class="big" align="center">
	
	<div class="small1">
	
	<div class="first">
		<a class="main_a" href="">품목별 주간 매출</a>
	</div>
	
	<div align="center" class="first1">
		<a class="main_a" href="">매출보고 내역</a>
	</div>
	
	</div>
	
	<div class="small">
	
		<div class="second">
		<c:set var="now" value="<%=new Date()%>" />
  			<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">발주요청 진행현황</a>
			    	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath() %>/shop_order.do'">+</button>
				</div>
			</nav>
			
			<div class="ordercard">
				<div class="date"><fmt:formatDate value="${now }" pattern="YYYY-MM-dd" /></div>
					<div class="request">
						<div class="count">${ordercount } 건</div>
						<div class="cont"> 요청 </div>
					</div>
					
					<div class="request">
						<div class="count">${okcount } 건</div>
						<div class="cont">승인</div>
					</div>
					
					<div class="request">
						<div class="count">${cancelcount } 건</div>
						<div class="cont">취소</div>
					</div>
			</div>
		
		</div>
		
		<div class="third">
			<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">공지사항</a>
			    	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath() %>/shop_board_list.do'">+</button>
				</div>
			</nav>
			
			<c:set var="notice" value="${noticelist }" />
			<c:set var="board" value="${boardlist }" />
			
			<table class="table">
				<tbody>
					<c:if test="${!empty notice }">
						<c:forEach items="${notice }" var="ndto">
						    <tr>
						    	<td class="notice_title">
						    		<!-- <img src="images/notice3.png" width="41" height="21">&nbsp; --> 
						    		<span class="badge rounded-pill bg-warning text-dark">공지</span> &nbsp;
						    		<a href="<%=request.getContextPath() %>/shop_board_content.do?num=${ndto.getBoard_no() }&page=1 ">
									 ${ndto.getBoard_title() } </a> </td>
						    	<td class="notice_date">${ndto.getBoard_date().substring(0, 10) }</td>
						    </tr>
			    		</c:forEach>
			    	</c:if>
			    		
			    	<c:if test="${!empty board }">
			    		<c:forEach items="${board }" var="bdto">
							<tr>
								<td>[${bdto.getBoard_code() }] &nbsp;
									<a href="<%=request.getContextPath() %>/shop_board_content.do?num=${bdto.getBoard_no() }&page=1 ">
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

<jsp:include page="../include/shop_bottom.jsp" />

</body>
</html>