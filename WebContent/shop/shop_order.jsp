<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Apple store order page</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');
body {
  font-family: 'Noto Sans KR', sans-serif;
}
#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
	display: flex;		
	justify-content: center;
    margin-top: 30px;
    padding-bottom: 170px; /* footer의 높이 */
}
	.tsize {
		height:200px;
	}
	.title{
		margin-top:30px;
		margin-bottom: 30px;
		font-size:20px;
	}
	.right{
  padding: 5px;
		margin-left: 100px;
	}
	.order {
		margin-top:30px;
		margin-bottom: 70px;
		font-size:18px;
	}
	.order td {
  padding: 5px;
  text-align: center;
}
.table {
  border-collapse: collapse;
  align:center;
}  
.table th {
  padding: 10px;
  font-weight: bold;
  border-bottom: 1px solid #ddd;
  text-align: center;
}
.table td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
  text-align: center;
}
	
	input[type='number']{
    width: 80px;
	} 
	th, td {
	border-bottom: 1px solid lightgrey;
	}
.red{
	color:red;
	font-size:17px;
  	font-weight: bold;
}
.input {
  height:35px;
  font-size:15px;
  background-color: white;
  padding: 2px;  
  border: 1px solid lightgrey;
  border-radius:5px;
}
</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />
	<div id="body-wrapper">
	<div id="body-content">
	<c:set var="shopid" value="${shopId }" />
	<div class="left">
	<p class="title" align="center">${shopName } 재고 현황</p>
		<table class="table" width="300">
		<c:set var="list" value="${prodList }" />
		<c:set var="total" value="${total }" />
			<c:if test="${!empty list }">
	      	<tr>
	      		<th>상품명</th> <th>상품 코드</th><th>현재 재고</th>
	         <c:forEach items="${list }" var="dto">
	         <tr>
	               <td>  ${dto.getPname() } </td>
	               <td> ${dto.getPnum() } </td>
	               <td> <div class="zero">${dto.getNow_no() }</div></td>
	         </tr>
			</c:forEach>
	        </c:if>
		</table>
		</div>
		<div class="right">
		<form method="post" 
		action="<%=request.getContextPath() %>/shop_order_ok.do"
		onsubmit = "return confirm('본사에 발주 요청 하시겠습니까?');">
		<p class="title" align="center"><img src="./images/form.png" width="25" height="25"><br>발주 폼</p>
		<table class="order">
			<tr>
				<td>상품</td>
				<td>
					<select class="input" name="pnum" required>
						<option value="PAD001" selected>iPadPro [PAD001]</option>
		            	<option value="PAD002">iPadAir [PAD002]</option>
		            	<option value="PAD003">iPad [PAD003]</option>
		            	<option value="PAD004">iPadmini [PAD004]</option>
		            	<option value="PHO001">iPhone13Pro [PHO001]</option>	            	
		            	<option value="PHO002" >iPhone13 [PHO002]</option>
		            	<option value="PHO003">iPhone13mini [PHO003]</option>
		            	<option value="PHO004">iPhoneSE [PHO004]</option>
		            	<option value="POD001">AirPodsPro [POD001]</option>
		            	<option value="POD002">AirPods3 [POD002]</option>	            	
		            	<option value="POD003">AirPods2 [POD003]</option>
		            	<option value="WCH001">AppleWatch7 [WCH001]</option>
		            	<option value="WCH002">AppleWatchSE [WCH002]</option>
		            	<option value="WCH003">AppleWatch3 [WCH003]</option>             	
					</select>
				</td>
				<td>수량</td>
				<td><input class="input" size="3" type="number" min="0" name="order_no" required></td>
	            <td colspan="2" align="center">
	               <input type="submit" class="input" style="width:60px;" value="전송">&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
		</table>
		</form>
		
		<p class="title" align="center">발주내역 (요청중)</p>
		<div class="tsize">
		<table  class="table" width="700" >
		<c:set var="list" value="${orderlist }" />
			<c:if test="${!empty list }">
			<tr>
	      		<th>발주 코드</th><th>제품 코드</th><th>수 량</th><th>날 짜</th><th>취 소</th>
			</tr>
			<c:forEach items="${list }" var="dto">
			<tr>
	            <td> ${dto.getOrder_code() } </td>
				<td> ${dto.getPnum() } </td>
	            <td> ${dto.getOrder_no() } </td>
	            <td> ${dto.getOrder_date() } </td>
	            <td><a href="<%=request.getContextPath() %>/order_delete.do?no=${dto.getOrder_code() } ">취 소</a>
	            </td>
	         </tr>
			</c:forEach>
	        </c:if>
		</table>
		</div>
		</div>
		</div>

	<div>
	</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
	<script>
	$('.zero').each(function() {
		  if (parseFloat($(this).text()) <= 10) {
		    $(this).addClass('red');
		    $(this).prepend('<img id="theImg" src="./images/alert.png" height="18px" width="20px"/>&nbsp;')
		  }
		});
	</script>
</body>
</html>