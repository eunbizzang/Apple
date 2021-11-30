<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.main_a{
	text-decoration: none;
	color: black;
}

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

</style>

</head>
<body style="background-color: aliceblue;">

<jsp:include page="../include/admin_top.jsp" />

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
  			<nav class="navbar navbar-light bg-light">
  				<div class="container-fluid">
			    	<a class="navbar-brand">발주 요청</a>
			    	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath() %>/admin_order.do'">+</button>
				</div>
			</nav>
			
			<c:set var="list" value="${orderlist }" />
			
			<table class="table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">매장</th>
						<th scope="col">날짜</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
			  
				<tbody>
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
						    <tr>
						      <th scope="row">${dto.getOrder_code() }</th>
						      <td>${dto.getShop_id() }</td>
						      <td>${dto.getOrder_date().substring(0, 10) }</td>
						      <td>${dto.getOrder_check() }</td>
						    </tr>
			    		</c:forEach>
			    	</c:if>
			    		
			    	<c:if test="${empty list }">
						<tr>
							<td colspan="5" align="center">
								<h3>발주 없음</h3>
							</td>
						</tr>
					</c:if>
			  	</tbody>
			</table>
		
		</div>
		
		<div class="third">
			<a class="main_a" href="">공지사항</a>
		</div>
		
	</div>
	
</div>

<jsp:include page="../include/shop_bottom.jsp" />

</body>
</html>