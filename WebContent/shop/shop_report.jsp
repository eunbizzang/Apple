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
      
      width: 800px;
     
      margin-top: 80px;
      margin-left: auto;
      margin-right: auto;
   }
   div.left {
   
   		width: 350px;
        margin-right: 70px;
        
        border-width: 1px;
   }
   
   .center{
   		margin-bottom: 50px;
   }
   
   div.right {
   		width: 350px;
        
   }
   
   .ttable{
	margin-top:10px;
	margin-bottom: 50px;
	font-size:15px;
   }
   
   .ftable{
	margin-top:10px;
	margin-bottom: 50px;
	font-size:15px;
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
	<div class="row">
		<div class="left">
		<div align="center" class="center">
		<p>${shopName } 매출</p>
        <p>매출 보고</p>
		</div>
		<c:set var="shopid" value="${shopId }" />
		<form method="post" 
			action="<%=request.getContextPath() %>/shop_report_ok.do"
			onsubmit = "return confirm('매출을 전송하시겠습니까?');">
			<input type="hidden"  class="input" name="shopid" value="${shopid }">
		<table class="table">
		<tr>
			<td>매출일자</td>
			<td>
				<input  class="input" type ="date" id="today" name = "date" required></td>
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
	            	   <option value="PAD001iPadPro" selected>iPadPro [PAD001]</option>
	            	   <option value="PAD002iPadAir">iPadAir [PAD002]</option>
	            	   <option value="PAD003iPad">iPad [PAD003]</option>
	            	   <option value="PAD004iPadmini">iPadmini [PAD004]</option>
	            	   <option value="PHO001iPhone13Pro">iPhone13Pro [PHO001]</option>	            	
	            	   <option value="PHO002iPhone13" >iPhone13 [PHO002]</option>
	            	   <option value="PHO003iPhone13mini">iPhone13mini [PHO003]</option>
	            	   <option value="PHO004iPhoneSE">iPhoneSE [PHO004]</option>
	            	   <option value="POD001AirPodsPro">AirPodsPro [POD001]</option>
	            	   <option value="POD002AirPods3">AirPods3 [POD002]</option>	            	
	            	   <option value="POD003AirPods2">AirPods2 [POD003]</option>
	            	   <option value="WCH001AppleWatch7">AppleWatch7 [WCH001]</option>
	            	   <option value="WCH002AppleWatchSE">AppleWatchSE [WCH002]</option>
	            	   <option value="WCH003AppleWatch3">AppleWatch3 [WCH003]</option>             	
					</select></td>
			<tr>
				<td>판매수량</td>
				<td><input  class="input" type="number" min="0" name="sales_no" required></td>
			</tr>
			<tr>
	            <td colspan="2" align="center">
	               <input  class="input" type="submit" value="매출등록">&nbsp;&nbsp;&nbsp;
	         	   <input  class="input" type="reset" value="다시작성">
				</td>
			</tr>	
		</table>
	   	</form>
	   	</div>
	  	<div class="right" align="center">
		<c:set var="now" value="<%=new Date() %>" /> 
		<h3><fmt:formatDate value="${now }" type="date" dateStyle="full" /></h3>
		<h3>매출보고 내역</h3>
		<table width="300" class="table">
		<c:set var="list" value="${salesList }" />
		<c:set var="total" value="${total }" />
			<c:if test="${!empty list }">
	      	<tr>
	      		<th>상품명</th> <th>수 량</th><th>합 계</th><th>삭 제</th>
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
	    <table align = "center">     
	         <tr>
	         	<td>${shopName } 일 매출 :&nbsp;&nbsp;</td>
	         	<td><fmt:formatNumber value="${total}"/>원</td>
	         </tr>
		</table>
		</div>
	</div>
	<jsp:include page="../include/shop_bottom.jsp" />
<script>
	const d = new Date();
	document.getElementById("today").value = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0, 10);

</script>
</body>
</html>