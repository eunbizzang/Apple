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
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />

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
				<select name="pnum">
	            	   <option value="pad001" selected>iPadPro</option>
	            	   <option value="pad002">iPadAir</option>
	            	   <option value="pad003">iPad</option>
	            	   <option value="pad004">iPadmini</option>
	            	   <option value="pho001">iPhone13Pro</option>	            	
	            	   <option value="pho002" >iPhone13</option>
	            	   <option value="pho003">iPhone13mini</option>
	            	   <option value="pho004">iPhoneSE</option>
	            	   <option value="pod001">AirPodsPro</option>
	            	   <option value="pod002">AirPods3</option>	            	
	            	   <option value="pod003">AirPods2</option>
	            	   <option value="wch001">AppleWatch7</option>
	            	   <option value="wch002">AppleWatchSE</option>
	            	   <option value="wch003">AppleWatch3</option>             	
					</select></td>
		<tr>
			<th>판매수량</th>
			<td><input type="number" name="sales_no"></td>
		</tr>
		<tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="매출등록">&nbsp;&nbsp;&nbsp;
	         	   <input type="reset" value="다시작성">
	            </td>
	         </tr>	
		</table>
	   </form>
	   <c:set var="now" value="<%=new Date() %>" />
	   <h5><fmt:formatDate value="${now }" type="date" dateStyle="full" /> 매출</h5>
			<table>
		<c:set var="list" value="${salesList }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	         <tr>
	               <td> ${dto.getPnum() } </td>
	               <td> ${dto.getshop_id() } </td>
	               <td> ${dto.getsales_no() } </td>
	               <td> ${dto.getsales_date() } </td>
	         </tr>
	         </c:forEach>
	         </c:if>
		</table>
	   
	</div>
	
	<jsp:include page="../include/admin_bottom.jsp" />

</body>
</html>