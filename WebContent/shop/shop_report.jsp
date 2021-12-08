<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apple store sales report page</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
body {
  font-family: 'Noto Sans KR', sans-serif;
}
div.row {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 900px;
  margin-top: 80px;
  margin-left: auto;
  margin-right: auto;
}
div.left {
  width: 400px;
  margin-right: 70px;
  border-width: 1px;
} 
div.right {
  margin-top:0px;
  width: 350px;
}
.title {
  margin-top: 30px;
  font-size : 20px;
  text-align: center;
  margin-bottom: 30px;
}
.ttable{
  width: 310px;
  border-collapse: separate;
  text-align: center;
  margin: 2px 10px;
  margin-top:10px;
  margin-bottom: 10px;
  font-size:15px;
}
.table-wrapper {
  width: 350px; height:300px;
  overflow: auto;
  border-radius:5px;
  padding: 10px;
  border-radius:5px;
  border: solid 3px #B0C4DE;
  margin-top: 30px;
  margin-bottom: 30px;
}
.ftable{
  width:400px;
  border-collapse: separate;
  margin: 2px 10px;
  margin-top:10px;
  margin-bottom: 50px;
  font-size:15px;
  padding:20px;
}
.input {
  height:35px;
  font-size:15px;
  background-color: white;
  padding: 2px;  
  border: 1px solid lightgrey;
  border-radius:5px;
  margin-top:5px;
}
.button {
  margin-top:60px;
  height:40px;
  background-color:white;
  font-size:15px;  
  border: 1px solid lightgrey;
  border-radius:5px;
}
.today{
  width: 300px;
  border-collapse: separate;
  text-align: right;
  margin: 2px 10px;
  margin-bottom: 10px;
  font-size:20px;
  font-weight: bold;
  color:#483D8B;
}
</style>
</head>
<body>
	<jsp:include page="../include/shop_top.jsp" />
	<div class="row">
		<div class="left">
			<p class="title">${shopName } 매출<br>
				매출 보고</p>
			<c:set var="shopid" value="${shopId }" />
			<!-- report form -->
			<form method="post" 
				action="<%=request.getContextPath() %>/shop_report_ok.do"
				onsubmit = "return confirm('매출을 전송하시겠습니까?');">
			<input type="hidden"  class="input" name="shopid" value="${shopid }">
			<table class="ftable">
				<tr>
					<td>매출일자</td>
					<td>
						<input  class="input" type ="date" id="today" name = "date" required>
					</td>
				</tr>
				<tr>	
					<td>매장명</td>
					<td>
						<input  class="input" value="${shopName }" readonly>
					</td>
				</tr>	
				<tr>
					<td>상품명</td>
					<td>
						<select  class="input" name="pnumname" required>
							<c:set var="plist" value="${plist }" />
							<c:forEach items="${plist }" var="dto">
							<option value="${dto.getPnum()}${dto.getPname()}">${dto.getPname() } [${dto.getPnum() }]</option>
				            </c:forEach>
		           		</select>
		           	</td>
				<tr>
					<td>판매수량</td>
					<td><input  class="input" type="number" min="0" name="sales_no" required></td>
				</tr>
				<tr>
		            <td colspan="2" align="center">
		               <input  class="button" type="submit" value="매출등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		         	   <input  class="button" type="reset" value="다시작성">
					</td>
				</tr>	
			</table>
	   		</form>
	   	</div>
	  	<div class="right">
			<c:set var="now" value="<%=new Date() %>" /> 
			<p class="title"><fmt:formatDate value="${now }" type="date" dateStyle="full" /><br>
			매출보고 내역</p>
			<div class="table-wrapper">
			<!-- today's report list -->
			<table class="ttable">
				<c:set var="list" value="${salesList }" />
				<c:set var="total" value="${total }" />
				<c:if test="${!empty list }">
		      	<tr>
		      		<th>상품명</th> <th>수 량</th><th>합 계</th><th>삭 제</th>
				</tr>
				<c:forEach items="${list }" var="dto">
				<tr>
					<td> ${dto.getPname() } </td>
					<td> ${dto.getSales_no() } </td>
					<td> ${dto.getTotal() }</td>
					<td><a href="<%=request.getContextPath() %>/sales_delete.do?no=${dto.getNo() }&sales_no=${dto.getSales_no() }">삭 제</a>
					</td>
				</tr>
				</c:forEach>
		        </c:if>
			</table>
			</div>
			<!-- total today -->
	    	<table class="today">     
	         	<tr>
	         		<td>매출 총액</td>
	         		<td><fmt:formatNumber value="${total}"/>원</td>
	         	</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../include/shop_bottom.jsp" />
<script>
// set default value for input form(today)
const d = new Date();
  document.getElementById("today").value = 
	  new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0, 10);
</script>
</body>
</html>