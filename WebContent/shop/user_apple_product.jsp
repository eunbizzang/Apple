<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String imgPath = request.getContextPath()+"/upload/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">	



	
	td, tr {
		text-align: center; padding : 50px;
	}
	
	.ab{
		 flex:1;
	}
	.ccc{
		border-stlye : solid;
	}
	
	
	
	

	

</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />

 	<div align="center">
	      <h2>상품 리스트</h2>
	   <br>
	   	  <c:set var="list" value="${productList }" />
	   	  	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="9" align="center">
	               <h3>등록된 상품 리스트가 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      
	      
	      <c:if test="${!empty list }">
	   <table class="ccc"  border="0" cellspacing="0" width="80%">
			<tr>
	         <c:forEach items="${list }" var="dto">
	         <c:set var="count" value="${count + 1 }" />
	        		<td width="25%">
	 	           <img src="<%=imgPath %>${dto.getPimage() }" width="200" height="200" border="0"><br>  
	               <h4>${dto.getPname() } <br></h4> <h5 align="right"><fmt:formatNumber value="${dto.getPrice() }" /> 원</h5>
	               	<h6 align="left">${dto.getPcont() }<br></h6>
	               </td>   
	            
	          <c:if test="${count % 3 == 0 }">
	                 </tr>
	                 <tr>       
	      	</c:if>
	      </c:forEach>

	
	   </table>
	   </c:if>
	   <br>
	   <br>
	   <br>
	</div>
<br><br><br>
<div align = "center">
<a href="https://www.apple.com/kr/" class="btn btn-light btn-lg">애플 공식 홈페이지</a>
</div>      

	<jsp:include page="../include/shop_bottom.jsp" />
</body>
</html>