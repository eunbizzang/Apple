<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String imgPath = request.getContextPath()+"/upload/";
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;500&display=swap');
</style>
<style type="text/css">

	div.notice {
		width: 1000px;
		height: 30px;
		font-size: 25px;
		font-weight: bold;
		font-family: 'Gothic A1', sans-serif;
		text-align: left;
		margin-top: 50px;
		margin-bottom: 20px;
	}
	
	.listbtn {
		width:200px;
		background-color: #000000;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
 		margin: 4px;
		cursor: pointer;
		border-radius: 10px;
	}
	
	td a {
		text-decoration: none;
		color: black;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp" />

	<div align="center">
	
		<c:set var="dto" value="${Cont }" />
		<c:set var="pdto" value="${pCont }" />
		<c:set var="ndto" value="${nCont }" />
	
		<div class="notice">
			공지사항
		</div>

		<hr color="#000000" width="1000" size="3">
		
		<table border="0" cellspacing="0" width="1000">
				
			<tr height="70px">
				<td align="left" style="font-size: 20px">&nbsp;&nbsp; ${dto.getBoard_title() } </td>
				<td align="right" style="font-size: 15px"> ${dto.getBoard_writer() } &nbsp;&nbsp; ${dto.getBoard_date() } &nbsp;&nbsp; </td>
			</tr>
			
			<tr>
				<td colspan="2"><hr width="1000" color="#000000"></td>
			</tr>

			<tr>
				<c:if test="${dto.getBoard_image() != null }">
					<td align="center" colspan="2"> <br><br> <img src="<%=imgPath %>${dto.getBoard_image() }"> </td>
				</c:if>
			</tr>
			
			<tr> <td> </td> </tr>
				
			<tr>
				<td colspan="2"> <br> <textarea rows="20" cols="120" style="border: 0" readonly>${dto.getBoard_cont() } </textarea> </td>
			</tr>
			
			<tr>
				<td colspan="2"><hr width="1000" color="#000000"></td>
			</tr>
			
			<tr>
				<c:if test="${!empty ndto.getBoard_code() }">
					<td>
						<c:if test="${pPage eq 0 }">
						▲  [${ndto.getBoard_code() }] <a href="<%=request.getContextPath() %>/shop_board_content.do?num=${ndto.getBoard_no() }&page=${Page - 1 } ">
									  ${ndto.getBoard_title() } </a> 
						</c:if>
						
						<c:if test="${pPage ne 0 }">
						▲  [${ndto.getBoard_code() }] <a href="<%=request.getContextPath() %>/shop_board_content.do?num=${ndto.getBoard_no() }&page=${Page } ">
									  ${ndto.getBoard_title() } </a> 
						</c:if>
					</td>
					<td align="right"> ${ndto.getBoard_date().substring(0, 10) } </td>
				</c:if>
				
				<c:if test="${empty ndto.getBoard_code() }">
					<td>
					▲  다음 글이 존재하지 않습니다.
					</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${!empty pdto.getBoard_code() }">
					<td>
						<c:if test="${pPage eq 1 }">
						▼  [${pdto.getBoard_code() }] <a href="<%=request.getContextPath() %>/shop_board_content.do?num=${pdto.getBoard_no() }&page=${Page + 1 } ">
									  ${pdto.getBoard_title() } </a> 
						</c:if>
						
						<c:if test="${pPage ne 1 }">
						▼  [${pdto.getBoard_code() }] <a href="<%=request.getContextPath() %>/shop_board_content.do?num=${pdto.getBoard_no() }&page=${Page } ">
									  ${pdto.getBoard_title() } </a> 
						</c:if>
					</td>
					<td align="right"> ${pdto.getBoard_date().substring(0, 10) } </td>
				</c:if>
				
				<c:if test="${empty pdto.getBoard_code() }">
					<td> 
					▼   이전 글이 존재하지 않습니다. 
					</td>
				</c:if>
			</tr>

			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2"> <h3>작성된 내용이 없습니다.</h3> </td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="2"><hr width="1000" color="#000000"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="listbtn" onclick="location.href='shop_board_list.do?page=${Page }'">전체목록</button>
				</td>
			</tr>
		
		</table>
		
	</div>

</body>
</html>