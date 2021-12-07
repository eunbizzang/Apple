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
	#body-wrapper {
	    min-height: 100%;
	    position: relative;
	}
	
	#body-content {
	    margin-top: 0px;
	    padding-bottom: 150px; /* footer의 높이 */
	}
	td, tr {
		text-align: center; padding : 50px;
	}
	

	.ccc{
		border-stlye : solid;
	}
	.cccc{
		font-size : 15px;
	}
	
	.ac{
		border: 3px solid #B0C4DE;
	    border-radius:5px;
		display: flex;
	}
	table {
		margin : 25px;
	}

	
</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />
	<div id="body-wrapper">
	<div id="body-content">
 	<div align="center">
	      <h2>상품 리스트</h2>
	   <br>
		 
	   	  <c:set var="list" value="${productListpho }" />
	   	  
  		<c:if test="${!empty list }">
	   <table class="ac" border="1" cellspacing="0" width="1600">
			<tr>
	         <c:forEach items="${list }" var="dto">
	         <c:set var="count" value="${count + 1 }" />
	        		<td width="400">
	 	           <img src="<%=imgPath %>${dto.getPimage() }" width="150" height="150" border="0"><br>  
	               <h4>${dto.getPname() } <br></h4> <h5 align="right"><fmt:formatNumber value="${dto.getPrice() }" /> 원</h5>
	               	<h6 class = "cccc" align="left">${dto.getPcont() }<br></h6>
	               </td>   
	          <c:if test="${count % 4 == 0 }">
	                 </tr>
	                 <tr>       
	      	</c:if>
	      </c:forEach>
	      
	   </table>
	   </c:if>
	   
	    <c:set var="list" value="${productListpad }" />
	   	  
  		<c:if test="${!empty list }">
	   <table class="ac" border="1" cellspacing="0" width="1600">
			<tr>
	         <c:forEach items="${list }" var="dto">
	         <c:set var="count" value="${count + 1 }" />
	        		<td width="400">
	 	           <img src="<%=imgPath %>${dto.getPimage() }" width="150" height="150" border="0"><br>  
	               <h4>${dto.getPname() } <br></h4> <h5 align="right"><fmt:formatNumber value="${dto.getPrice() }" /> 원</h5>
	               	<h6 class = "cccc" align="left">${dto.getPcont() }<br></h6>
	               </td>   
	            
	          <c:if test="${count % 4 == 0 }">
	                 </tr>
	                 <tr>       
	      	</c:if>
	      </c:forEach>
	      

	   </table>
	   </c:if>
	   
	   <c:set var="list" value="${productListwch }" />
	   
	   <c:if test="${!empty list }">
	   <table class="ac"  border="1" cellspacing="0" width="1600">
			<tr>
	         <c:forEach items="${list }" var="dto">
	         <c:set var="count" value="${count + 1 }" />
	        		<td width="400">
	 	           <img src="<%=imgPath %>${dto.getPimage() }" width="150" height="150" border="0"><br>  
	               <h4>${dto.getPname() } <br></h4> <h5 align="right"><fmt:formatNumber value="${dto.getPrice() }" /> 원</h5>
	               	<h6 class = "cccc" align="left">${dto.getPcont() }<br></h6>
	               </td>   
	            
	          <c:if test="${count % 4 == 0 }">
	                 </tr>
	                 <tr>       
	      	</c:if>
	      </c:forEach>
	      

	   </table>
	   </c:if>
	   
	    <c:set var="list" value="${productListpod }" />
	   
	   <c:if test="${!empty list }">
	   <table class="ac"  border="1" cellspacing="0" width="1600">
			<tr>
	         <c:forEach items="${list }" var="dto">
	         <c:set var="count" value="${count + 1 }" />
	        		<td width="400">
	 	           <img src="<%=imgPath %>${dto.getPimage() }" width="150" height="150" border="0"><br>  
	               <h4>${dto.getPname() } <br></h4> <h5 align="right"><fmt:formatNumber value="${dto.getPrice() }" /> 원</h5>
	               	<h6 class = "cccc" align="left">${dto.getPcont() }<br></h6>
	               </td>   
	            
			
	      </c:forEach>
	      

	   </table>
	   </c:if>
	   
	   
	</div>
<br><br><br>     
</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
</body>
</html>