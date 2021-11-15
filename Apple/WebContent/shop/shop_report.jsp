<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form method="post" 
			action="<%=request.getContextPath() %>/shop_report_ok.do"
			onsubmit = "return confirm('매출을 전송하시겠습니까?');">
		<table>
		<tr>
			<th>매출일자</th>
			<td>
				<input type ="date" name = "date"></td>
		</tr>
		<tr>	
			<th>매장명</th>
			<td>
				<select name="shopid">
	            	   <option value="1" selected>Apple 여의도</option>
	            	   <option value="2">Apple 가로수길</option>
	            	   <option value="3">프리스비 홍대점</option>
	            	   <option value="4">윌리스 김포공항점</option>
	            	   <option value="5">윌리스 인천터미널점</option>	            	
				</select>
			</td>
		</tr>	
		<tr>
			<th>상품명</th>
			<td>
				<select name="pname">
	            	   <option value="iPadPro" selected>iPadPro [PAD001]</option>
	            	   <option value="iPadAir">iPadAir [PAD002]</option>
	            	   <option value="iPad">iPad [PAD003]</option>
	            	   <option value="iPadmini">iPadmini [PAD004]</option>
	            	   <option value="iPhone13Pro">iPhone13Pro [PHO001]</option>	            	
	            	   <option value="iPhone13" >iPhone13 [PHO002]</option>
	            	   <option value="iPhone13mini">iPhone13mini [PHO003]</option>
	            	   <option value="iPhoneSE">iPhoneSE [PHO004]</option>
	            	   <option value="AirPodsPro">AirPodsPro [POD001]</option>
	            	   <option value="AirPods3">AirPods3 [POD002]</option>	            	
	            	   <option value="AirPods2">AirPods2 [POD003]</option>
	            	   <option value="AppleWatch7">AppleWatch7 [WCH001]</option>
	            	   <option value="AppleWatchSE">AppleWatchSE [WCH002]</option>
	            	   <option value="AppleWatch3">AppleWatch3 [WCH003]</option>             	
					</select></td>
		<tr>
			<th>판매수량</th>
			<td><input type="number" min="0" name="sales_no"></td>
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
		
		<h3>매출보고 내역</h3>
		<table width="300">
		<c:set var="list" value="${salesList }" />
		<c:set var="total" value="${total }" />
			<c:if test="${!empty list }">
	      	<tr>
	      		<th>상품명</th> <th>수 량</th><th>삭 제</th>
	         <c:forEach items="${list }" var="dto">
	         <tr>
	               <td> ${dto.getPname() } </td>
	               <td> ${dto.getSales_no() } </td>
	               <td><a href="<%=request.getContextPath() %>/sales_delete.do?no=${dto.getNo() }">삭 제</a>
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
	         	<td>xx매장 일 매출 : </td>
	         	<td><fmt:formatNumber value="${total}"/>원</td>
	         </tr>
		</table>
	</div>
</body>
</html>