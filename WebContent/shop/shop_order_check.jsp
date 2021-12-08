<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
body {
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
  height: 100%;
}
.container{
   height: 100%;
   display: flex;
   justify-content: center;
   margin-top: 50px;
   
    flex-direction: column;
     align-items: center;
}

.form{
   margin-bottom: 20px;
   text-align: center;
}
.title {
	margin-bottom: 50px;
	font-size : 25px;
	font-weight: bold;
}

table.line {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.2;
  margin: 10px 10px;
  font-size:15px;
}
table.line th {
  width: 650px;
  padding: 10px;
  vertical-align: top;
}
table.line td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
.input {
  height:35px;
  font-size:15px;
  background-color: white;
  padding: 2px;  
  border: 1px solid lightgrey;
  border-radius:5px;
}
.table-wrapper {
  width: 1100px; height:420px;
  overflow: auto;
  border-radius:5px;
  background-color: #fffafa;
  padding: 25px;
  /* border: 1px solid lightgrey; */
  border: solid 3px #B0C4DE;
}
</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />
	<div class="container">
		<p class="title">발주 내역</p>
		<div class="form">
			<!-- order search form -->
			<form method="post"
					action="<%=request.getContextPath() %>/shop_order_check_again.do">
				<table width="600">
					<tr>
						<td>
							<input class="input" type="date" name="date1" required>
						</td>
						<td>-</td>
						<td>
							<input class="input" type="date" name="date2" required>
						</td>
						<td>
							상태 : <select class="input" name="search_field" required>
									<option value="all">전체</option>
									<option value="order">요청</option>
									<option value="order_ok">발주승인</option>
									<option value="order_cancel">발주취소</option>
							</select>
						</td>
						<td>
							<input class="input" type="submit" style="width:60px;" value="확인">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="table-wrapper">
			<!-- searched order data table -->
			<table class="line" style ='width : 1000px;'>
			<c:set var="list" value="${orderlist }" />
				<c:if test="${!empty list }">
				<tr>
		      		<th>요청 코드</th><th>요청제품</th><th>수량</th><th>요청 일자</th>
		      		<th>상태</th><th>본사 확인</th><th>코멘트</th>
				</tr>
				<c:forEach items="${list }" var="dto">
				<tr>
					<td> ${dto.getOrder_code() } </td>
		            <td> ${dto.getPnum() } </td>
		            <td> ${dto.getOrder_no() } </td>
		            <td> ${fn:substring(dto.getOrder_date(),0,16) } </td>
		            <td> ${dto.getOrder_check() } </td>
		            <td> <c:if test="${!empty dto.getOrderok_date() }">
		            	${fn:substring(dto.getOrderok_date(),0,16) }</c:if>
		            	<c:if test="${empty dto.getOrderok_date() }">
		             	미확인</c:if> 
		            </td>
		            <td>
		            	<c:if test="${!empty dto.getOrder_comment() }">
		            	${dto.getOrder_comment() }</c:if>
		            	<c:if test="${empty dto.getOrder_comment() }">
		            	<div class="sent">-</div>
		             	</c:if>
		            </td>
		         </tr>
				</c:forEach>
		        </c:if>
			</table>
		</div>
		</div>
	<div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
</body>
</html>