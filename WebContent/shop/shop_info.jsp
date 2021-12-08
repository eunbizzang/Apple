<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Apple 매장 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap');

.cate_a {
	text-decoration: none;
	color: white;
}

.bar{
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #263343;
	padding: 8px 12px;
	
	margin-bottom: 30px;
}


.logo{
	font-size:24px;
	color:white;
}

.logo i{
	color:white;
}

.menu{
	display: flex;
	list-style: none;
	padding-left: 0;
	z-index: 1;
	margin-top: 17px;
}

.menu li{
	padding: 8px 20px;
	
	margin:5px 30px;
	float: left;
	position: relative;
	padding:0;
	
}

.menu li a{
	display: block;
	margin:0;
	padding: 7px 8px;
}

.menu ul{
	list-style: none;
	margin: 0;
	padding: 0;
	position:absolute;
	left:0;
	top: 40px;
	width: 105px;
	background: #263343;
	text-align: center;
	border-radius: 4px;
}

.menu ul li:hover a{
	border-radius: 4px;
	background-color: white;
	
}

.menu ul li{
	float: none;
	margin:0;
	padding: 0;
	font-size: 13px;
	
	display:none;
}

.menu ul{
	list-style: none;
	margin:0;
	padding: 0;
	position: absolute;
	left: 0;
	top: 38px;
	width: 105px;
	background: #263343;
	text-align: center;
	opacity: 0;
	
}

.menu li:hover ul{
	opacity: 1;
}

.menu li:hover ul li{
	height: 35px;
	overflow: visible;
	padding: 0;
	
	display: block;
}

.menu li:hover > a{
	background-color: white;
	color: black;
	border-radius: 4px;
}

.logout{
	list-style: none;
	color: white;
	display: flex;
	padding-left: 0;
	margin-top: 17px;

}

.logout li {
	padding: 3px;
}

@media screen and (max-width: 666px) {
	.bar{
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	
	.menu{
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	
	.menu li{
	width: 100%;
	text-align: center;
	}
	
	.logout{
		justify-content: center;
		width: 100%;
	}
	
}

body {
  font-family: 'Noto Sans KR', sans-serif;
  flex-direction: column;
}
#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 0px;
    padding-bottom: 170px; /* footer의 높이 */
}
.wrapper {
	width: 560px; height:670px;
	text-align: center;/*중앙정렬*/
	margin-top : 50px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:20px;
	background-color:rgb(171,205,239, 0.4);
	border-radius:5px;
}
.infomenu{
	text-align: center;/*중앙정렬*/
	margin-left : auto;
	margin-right : auto;
	height : 40px;
	width : 900px;
}
.infomenu li {
	list-style : none;
	float:left;
	line-height:40px;
	vertical-align:middle;
	text-align:center;
	cursor: pointer;
}
.infomenu a{
   font-weight: 500;/*폰트굵기*/
   text-decoration: none;/*a href 밑줄 등 글자 꾸밈 없음*/
   line-height: 40px;
}
.infomenu a:after {/*after 가상요소*/
	display:block;/*a요소를 블록 요소라고 선언*/
	content: '';
	margin-bottom: 20px;
	border-bottom: solid 3px #B0C4DE;
	transform: scaleX(0);/*크기를 0으로 줌으로써 평상시엔 밑줄 없음*/
	transition: transform 250ms ease-in-out; /*변형 방식*/
	line-height: 40px;
}
.infomenu a:hover:after {
   transform: scaleX(1);/*a 속성에 hover시 기존 크기로*/
}

.infomenu .menuLink {
	text-decoration: none;
	color: #4F4F4F;
	display: block;
	width: 170px;
	font-size:17px;
}

#shopname {
	font-size:30px;
	font-weight: bold;
}

#title {
	font-size:20px;
	font-weight: bold;
}
.map {
	margin-top:30px;
	margin-left:13px;
	width:500px; 
	height:350px;
}
.infoback {
	padding : 10px;
	margin:10px;
	background-color:white;
}
</style>
</head>
<body>
	<!-- MENU BAR -->
	<nav class="bar" >
		<div class="logo">
			<img class="img" src="../images/mainlogo.png">
		</div>
		<ul class="menu">
			<li><a class="cate_a" href="<%=request.getContextPath() %>/shop_login_ok.do?code=1">Home</a></li>
			
			<li><a class="cate_a" href="<%=request.getContextPath() %>/shop/shop_info.jsp">매  장</a>
				<ul class="sub">
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop/shop_info.jsp">Shop Info</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/user_apple_product.do">제품목록</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_board_list.do">공지사항</a></li>
				</ul>
			</li>
			<li><a class="cate_a" href="<%=request.getContextPath() %>/user_product_list.do">재  고</a>
				<ul class="sub">
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/user_product_list.do">재고관리</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_order.do">발주 폼</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_order_check.do">발주내역</a></li>
				</ul>
			</li>
			<li><a class="cate_a" href="<%=request.getContextPath() %>/shop_summary.do">매  출</a>
				<ul class="sub">
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_weekly.do">주간 매출</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_monthly.do">월 매출</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_summary.do">매출 조회</a></li>
					<li> <a class="cate_a" href="<%=request.getContextPath() %>/shop_report.do">매출 보고</a></li>
				</ul>
			</li>
		</ul>
		<ul class="logout">
			<li> <a class="cate_a" href="#">${shopName } &nbsp;</a> </li>
			<li><i class="fas fa-sign-in-alt"></i></li>
			<li><a class="cate_a" href="<%=request.getContextPath() %>/user_logout.do">Logout</a></li>
		</ul>
	</nav>
	<!-- MENUBAR END -->
	<div id="body-wrapper">
		<div id="body-content">
			<div class = "infomenu">
				<ul>
					<li><a class="menuLink" onclick="garosu()">Apple 가로수길</a></li>
					<li><a class="menuLink" onclick="gimpo()">윌리스 김포공항</a></li>
					<li><a class="menuLink" onclick="hongdae()">프리스비 홍대</a></li>
					<li><a class="menuLink" onclick="incheon()">윌리스 인천터미널점</a></li>
					<li><a class="menuLink" onclick="yeouido()">Apple 여의도</a></li>
				</ul>
			</div>
			<div class="wrapper">
				<div class="infoback">
				<!-- Shop information -->
				<p id="shopname">Apple 가로수길</p>
					<div id="info" align="center">
					<p><img src="../images/location.png" width="18" height="18"> 서울 강남구 가로수길 43 (우)06028</p>
					<p><img src="../images/time.png" width="18" height="18"> 10:00 ~ 22:00</p>
					<p><img src="../images/phone.png" width="18" height="18"> 080-500-0029</p>
					<p><img src="../images/man.png" width="18" height="18"> 담당매니저 : 표은비</p>
					</div>
				</div>
				<!-- KAKAO map -->
				<div id="map" class="map">
				</div>
			</div>
		</div>
	<jsp:include page="../include/shop_bottom.jsp" />
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4285c890083d1f612cc44cfdd5d0dc4f"></script>
<script>

// shopinfo set		
let garosuinfo = "<p><img src='../images/location.png' width='18' height='18'> 서울 강남구 가로수길 43 (우)06028</p>"
				+"<p><img src='../images/time.png' width='18' height='18'> 10:00 ~ 22:00</p>"
				+"<p><img src='../images/phone.png' width='18' height='18'> 080-500-0029</p>"
				+"<p><img src='../images/man.png' width='18' height='18'> 담당 매니저 : 표은비</p>";
	
let yeouidoinfo = "<p><img src='../images/location.png' width='18' height='18'> 서울 영등포구 국제금융로 10 IFC몰 지하 1층 (우)07326</p>"
				+"<p><img src='../images/time.png' width='18' height='18'> 10:00 ~ 22:00</p>"
				+"<p><img src='../images/phone.png' width='18' height='18'> 080-500-0013</p>"
				+"<p><img src='../images/man.png' width='18' height='18'> 담당 매니저 : 표은비</p>"
	
let hongdaeinfo = "<p><img src='../images/location.png' width='18' height='18'> 서울 마포구 홍익로 11 (우)04040</p>"
				+"<p><img src='../images/time.png' width='18' height='18'> 11:00 ~ 21:00</p>"
				+"<p><img src='../images/phone.png' width='18' height='18'> 02-323-1765</p>"
				+"<p><img src='../images/man.png' width='18' height='18'> 담당 매니저 : 이도엽</p>"
	
let gimpoinfo = "<p><img src='../images/location.png' width='18' height='18'> 서울 강서구 하늘길 38 롯데몰 MF층 롯데하이마트 내 (우)07505</p>"
				+"<p><img src='../images/time.png' width='18' height='18'> 10:30 ~ 21:00</p>"
				+"<p><img src='../images/phone.png' width='18' height='18'> 02-6116-1700</p>"
				+"<p><img src='../images/man.png' width='18' height='18'> 담당 매니저 : 이유빈</p>"
	
let incheoninfo = "<p><img src='../images/location.png' width='18' height='18'> 인천 미추홀구 관교동 15 지하1층</p>"
				+"<p><img src='../images/time.png' width='18' height='18'> 10:30 ~ 21:00</p>"
				+"<p><img src='../images/phone.png' width='18' height='18'> 032-242-2710</p>"
				+"<p><img src='../images/man.png' width='18' height='18'> 담당 매니저 : 이영훈</p>"

// map set

let container = document.getElementById('map');
let options = {
  center: new kakao.maps.LatLng(37.52081891686327, 127.02272035982348),
  level: 3
};
				
let map = new kakao.maps.Map(container, options);
let marker = new kakao.maps.Marker({ 
	position: map.getCenter() 
	}); 
  marker.setMap(map);	
	
// shop function

// YEOUIDO
function yeouido() {            
		
  document.getElementById("shopname").innerHTML = "Apple 여의도점";
  document.getElementById("info").innerHTML = yeouidoinfo
		
  let moveLatLon = new kakao.maps.LatLng(37.525100134561754, 126.92588452406844);
			    
  map.setCenter(moveLatLon);
  let marker = new kakao.maps.Marker({ 
	    position: map.getCenter() 
	}); 
  marker.setMap(map);	
}

// GIMPO
function gimpo() {            
		
  document.getElementById("shopname").innerHTML = "윌리스 김포공항";
  document.getElementById("info").innerHTML = gimpoinfo
		
  // 이동할 위도 경도 위치를 생성합니다 
  let moveLatLon = new kakao.maps.LatLng(37.56318424549044, 126.80318825591408);
			    
  map.setCenter(moveLatLon);
  let marker = new kakao.maps.Marker({ 
    position: map.getCenter() 
  }); 
  marker.setMap(map);	
}

// GAROSU
function garosu() {            
	
  document.getElementById("shopname").innerHTML = "Apple 가로수길";
  document.getElementById("info").innerHTML = garosuinfo
		
  // 이동할 위도 경도 위치를 생성합니다 
  let moveLatLon = new kakao.maps.LatLng(37.52081891686327, 127.02272035982348);
			    
  map.setCenter(moveLatLon);
  let marker = new kakao.maps.Marker({ 
    position: map.getCenter() 
  }); 
  marker.setMap(map);	
}

// HONGDAE
function hongdae() {            
	
  document.getElementById("shopname").innerHTML = "프리스비 홍대";
  document.getElementById("info").innerHTML = hongdaeinfo
		
  // 이동할 위도 경도 위치를 생성합니다 
  let moveLatLon = new kakao.maps.LatLng(37.55350248354633, 126.92326480411504);
		
  map.setCenter(moveLatLon);
  let marker = new kakao.maps.Marker({ 
    position: map.getCenter() 
  }); 
  marker.setMap(map);	
}

// INCHEON
function incheon() {            
	
  document.getElementById("shopname").innerHTML = "윌리스 인천터미널점";
  document.getElementById("info").innerHTML = incheoninfo
		
  // 이동할 위도 경도 위치를 생성합니다 
  let moveLatLon = new kakao.maps.LatLng(37.44150644089625, 126.70136555595195);
			    
  map.setCenter(moveLatLon);
  let marker = new kakao.maps.Marker({ 
    position: map.getCenter() 
  }); 
  marker.setMap(map);	
}
</script>
</body>
</html>