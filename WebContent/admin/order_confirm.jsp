<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/customer.js"></script> -->

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

	body {
	  font-family: 'Noto Sans KR', sans-serif;
	}
	
	.num{
		text-align:center;
	}
	
	.top{
		/* display: flex;
		justify-content: center; */
		margin-top: 50px;
		position: relative;
	}
	
	.notice_name {
		width: 1105px;
		height: 30px;
		font-size: 20px;
		font-weight: bold;
		text-align: left;
		font-family: 'Gotdic A1', sans-serif;
		margin-left: 410px;
	}
	
	.notice_select {
		width: 1100px;
		height: 80px;
		margin-top: 30px;
		margin-left: 410px;
		padding-top: 20px;
		padding-left: 20px;
		border: 3px solid #B0C4DE;
	    border-radius:5px;
	}
	
	.notice_title {
		margin-left: 20px;
		margin-right: 10px;
	}
	
	.select_hr {
		margin-left: 410px;
	}
	
	#selectbtn {
		margin-left: 215px;
	}
	
	.all{
		display: flex;
		justify-content: center;
		margin-top: 40px;
	}
	
	.input {
	  height:35px;
	  font-size:15px;
	  background-color: white;
	  padding: 2px;  
	  border: 1px solid lightgrey;
	  border-radius:5px;
	}

	.ordertable {
		
		width: 500px;
		height: 500px;
		
	}
	
	.ordercontent {
		
		margin-left: 80px;
		margin-bottom:50px;
		width:500px;
		height: 500px;
		
	}
	
	.lefttable tr th {
		text-align: center;
		background: #EEEEEE;
		font-family: 'Gothic A1', sans-serif;
	}
	
	.lefttable tr {
		height: 40px;
	}
	
	.lefttable td {
		text-align: center;
		font-family: 'Gothic A1', sans-serif;
	}
	
	.leftatble h3 {
		text-align: center;
		font-family: 'Gothic A1', sans-serif;
		left: 150px;
		top: 50px;
	}
	
	.righttable tr th {
		text-align: left;
		background: #EEEEEE;
		font-family: 'Gothic A1', sans-serif;
	}
	
	.righttable th td {
		background: #EEEEEE;
	}
	#body-wrapper {
    height: 100%;
    position: relative;
	}

	#body-content {
    margin-top: 0px;
    padding-bottom: 170px; /* footer의 높이 */
}
	
</style>
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
	
	<div class="top">
	
		<div class="notice_name">
			<img src="images/add.png" width="20" height="20">&nbsp;발주 요청 현황
		</div>
		
		<div class="notice_select">
			<form method="post" action="<%=request.getContextPath() %>/admin_order.do">
				<span style="font-weight: bold;" class="notice_title">날짜</span>
				<input type="date" name="date1" class="input" required>
				~
				<input type="date" name="date2" class="input" required>
				&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;" class="notice_title">매장</span>
					<select name="search_shop" class="input" required>
						<option value="all">전체</option>
						<option value="yeouido">Apple 여의도</option>
						<option value="garosu">Apple 가로수길</option>
						<option value="hongdae">프리스비 홍대</option>
						<option value="gimpo">윌리스 김포공항</option>
						<option value="incheon">윌리스 인천터미널</option>
					</select>
				&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;" class="notice_title">상태</span>
				<select name="search_field" class="input" required>
					<option value="all">전체</option>
					<option value="order">요청</option>
					<option value="order_ok">발주승인</option>
					<option value="order_cancel">발주취소</option>
				</select>

				<input type="submit" value="확인" class="btn btn-primary btn-sm" id="selectbtn">

			</form>
			
		</div>
		
	</div>
	
	
	<div class="all">
	<c:set var="list" value="${List }" />
	
	<div class="ordertable">
	
		<%-- <input type="hidden" name="jsearch_shop" value="${shop }">
		<input type="hidden" name="jdate1" value="${date1 }">
		<input type="hidden" name="jdate2" value="${date2 }">
		<input type="hidden" name="jsearch_field" value="${field }">
		 --%>
		<table border="0" cellspacing="0" width="500" class="lefttable">
		
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			
			<thead>
				<tr>
					<th>요청번호</th> <th>요청매장</th> <th>요청날짜</th> <th>상태</th>
				</tr>
			</thead>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<%-- <td> <input type="button" name="code" value="${dto.getOrder_code() }" onclick="loaction.href='admin_order_cont.do?code=${dto.getOrder_code() }"> </td> --%>
						<td> <a href="<%=request.getContextPath() %>/admin_order.do?code=${dto.getOrder_code() }&jshop=${shop }&jdate1=${date1 }&jdate2${date2 }&jfield=${field }">${dto.getOrder_code() }</a></td>
						<td> ${dto.getShop_id() } </td>
						<td> ${dto.getOrder_date().substring(0, 10) } </td>
						<td> ${dto.getOrder_check() } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">
						<h3>발주 없음</h3>
					</td>
				</tr>
			</c:if>
		</table>
		
	</div>
	
	<c:set var="cont" value="${Cont }" />
	
	<c:if test="${empty cont }">
		<div class="ordercontent">
		
		</div>
	</c:if>
	
	<c:if test="${!empty cont }">
		<div class="ordercontent">
			<form method="post" action="<%=request.getContextPath() %>/admin_update.do">
			
			<table border="0" cellspacing="0" width="500" style="border-color: gray" class="rigthtable">
			
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				
				<thead>
					<tr>
						<td colspan="2" align="center" style="font-size: 20px">발주 요청 확인서</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th scope="row">발주코드</th>
						<td> 
							<input class="form-control" name="order_code" type="text" aria-label="default input example" value="${cont.getOrder_code() }" readonly>
						<td>
					</tr>
				
					<tr>
						<th scope="row">요청매장</th>
						<td> 
							<input class="form-control" aria-label="default input example" value="${cont.getShop_name() }" readonly>
						<td>
					</tr>
				
					<tr>
						<th scope="row">매장코드</th>
						<td> 
							<input class="form-control" name="shop_id" aria-label="default input example" value="${cont.getShop_id() }" readonly>
						<td>
					</tr>
				
					<tr>
						<th scope="row">제품명</th>
						<td> 
							<input class="form-control" aria-label="default input example" value="${cont.getPname() }" readonly>
						<td>
					</tr>
				
					<tr>
						<th scope="row">제품코드</th>
						<td> 
							<input class="form-control" name="pnum" aria-label="default input example" value="${cont.getPnum() }" readonly>
						<td>
					</tr>

					<tr>
						<th scope="row">발주 수량</th>
							<c:if test="${!empty cont.getOrderok_date() }">
								<td> 
									<input class="form-control" aria-label="default input example" value="${cont.getOrder_no() }" readonly>
								<td>
							</c:if>
							
							<c:if test="${empty cont.getOrderok_date() }">
								<td> 
									<input type="number" class="form-control" name="order_no" aria-label="default input example"  value="${cont.getOrder_no() }" min="1" max="100">
								<td>
							</c:if>
					</tr>
				
				<!-- 본사에서 발주 승인 시에는 상세 내역에 현재 매장 수량이 나타나지 않도록(본사/매장 둘다) -->
				<c:if test="${cont.getOrder_check() != '발주승인'}">
				
				<tr>
					<th scope="row">현재 매장 수량</th>
					<td> 
						<input class="form-control" name="now_no" aria-label="default input example" value="${cont.getNow_no() }" readonly>
					<td>
				</tr>
				
				</c:if>
				
				<tr>
					<th scope="row">발주 시각</th>
					<td> 
						<input class="form-control" aria-label="default input example" value="${cont.getOrder_date() }" readonly>
					<td>
				
				<c:if test="${!empty cont.getOrderok_date() }">
					<tr>
						<th scope="row">처리 시각</th>
						<td> 
							<input class="form-control" aria-label="default input example" value="${cont.getOrderok_date() }" readonly>
						<td>
					</tr>
				</c:if>
				
				<tr>
					<c:if test="${!empty cont.getOrderok_date() }">
						<th scope="row">진행 상황</th>
						<td> 
							<input class="form-control" aria-label="default input example" value="${cont.getOrder_check() }" readonly>
						<td>
					</c:if>
						
					<c:if test="${empty cont.getOrderok_date() }">
						<th scope="row">처리 방법</th>
						<td>
							<select class="form-select" aria-label="Default select example" name="order_check">
								<option value="confirm">발주승인</option>
								<option value="cancel">발주취소</option>
							</select>
						</td>
					</c:if>
				</tr>
				
				<tr>
					<th scope="row">Comment</th>
					<td>
						<c:if test="${!empty cont.getOrderok_date() }">
							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${cont.getOrder_comment() }</textarea>
						</c:if>
						
						<c:if test="${empty cont.getOrderok_date() }">
							<textarea class="form-control" id="exampleFormControlTextarea1" name="order_comment" rows="3">${cont.getOrder_comment() }</textarea>
						</c:if>
					</td>
				</tr>

				<c:if test="${empty cont.getOrderok_date() }">
				<tr>
					<td colspan="2" align="right">
						<input type="reset" value="초기화" class="btn btn-primary">
						<input type="submit" value="승인" class="btn btn-primary">
					</td>
				</tr>
				</c:if>
			</table>
			</form>
		</div>
	</c:if>
	</div>
	
</body>
</html>