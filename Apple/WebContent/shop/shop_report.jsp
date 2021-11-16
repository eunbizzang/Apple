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

	table {
		margin-left:auto;
		margin-right:auto;
	}

</style>
</head>
<body>

	<div align="center">
		<hr width="65%" color="blue">
			<h3>매출 보고서</h3>
		<hr width="65%" color="blue">
		<br>
		
		<c:set var="shopid" value="${shopid }" />
		<form method="post" 
			action="<%=request.getContextPath() %>/shop_report_ok.do"
			onsubmit = "return confirm('매출을 전송하시겠습니까?');">
			<input type="hidden" name="shopid" value="${shopid }">
		<table>
		<tr>
			<th>매출일자</th>
			<td>
				<input type ="date" name = "date" required></td>
		</tr>
		<tr>	
			<th>매장명</th>
			<td>
				<c:choose>	
				<c:when test="${shopid eq '1'}"><input value="Apple 여의도 점" readonly></c:when>
				<c:when test="${shopid eq '2'}"><input value="Apple 가로수길" readonly></c:when>    
				<c:when test="${shopid eq '3'}"><input value="프리스비 홍대점" readonly></c:when>
				<c:when test="${shopid eq '4'}"><input value="윌리스 김포공항" readonly></c:when>
				<c:when test="${shopid eq '5'}"><input value="윌리스 인천터미널점" readonly></c:when>
				</c:choose>
			</td>
		</tr>	
		<tr>
			<th>상품명</th>
			<td>
				<select name="pnumname" required>
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
				<th>판매수량</th>
				<td><input type="number" min="0" name="sales_no" required></td>
			</tr>
			<tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="매출등록">&nbsp;&nbsp;&nbsp;
	         	   <input type="reset" value="다시작성">
				</td>
			</tr>	
		</table>
	   	</form>
	  	<br> <br>
	  	
		<c:choose>	
		<c:when test="${shopid eq '1'}"><h3>Apple 여의도 점</h3></c:when>
		<c:when test="${shopid eq '2'}"><h3>Apple 가로수길</h3></c:when>    
		<c:when test="${shopid eq '3'}"><h3>프리스비 홍대점</h3></c:when>
		<c:when test="${shopid eq '4'}"><h3>윌리스 김포공항</h3></c:when>
		<c:when test="${shopid eq '5'}"><h3>윌리스 인천터미널점</h3></c:when>
		</c:choose>

		<h3>매출보고 내역</h3>
		<table width="300">
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
	               <td><a href="<%=request.getContextPath() %>/sales_delete.do?no=${dto.getNo() } ">삭 제</a>
	               </td>
	         </tr>
			</c:forEach>
	        </c:if>
		</table>
		<br> <br>
			         
		<c:set var="now" value="<%=new Date() %>" /> 
		<h3><fmt:formatDate value="${now }" type="date" dateStyle="full" /></h3>
	    <table>     
	         <tr>
	         	<c:choose>	
				<c:when test="${shopid eq '1'}"><td>Apple 여의도 점 일 매출 : </td></c:when>
				<c:when test="${shopid eq '2'}"><td>Apple 가로수길 일 매출 : </td></c:when>    
				<c:when test="${shopid eq '3'}"><td>프리스비 홍대점 일 매출 : </td></c:when>
				<c:when test="${shopid eq '4'}"><td>윌리스 김포공항 일 매출 : </td></c:when>
				<c:when test="${shopid eq '5'}"><td>윌리스 인천터미널점 일 매출 : </td></c:when>
				</c:choose>
	         	<td><fmt:formatNumber value="${total}"/>원</td>
	         </tr>
		</table>
	</div>
</body>
</html>