<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8" %>
<c:choose>
	<c:when test="${msg!=null}" >
		<script>
			alert('${msg}');
		</script>
	</c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
</head>
<body>
	<div class="all">
		<div class="h1">
			<div class="header_top">
				<ul class="htext1">
					<li class="mart_user"><a href="http://localhost:9999/ugaMart/">우가마트</a></li>
					<li class="mart_rider"><a href="riderLogin">우가라이더 광장</a></li>
					<li class="mart_owner"><a href="ceoLogin">우가사장님 광장</a></li>
				</ul>	
				<ul class="htext2">
					<c:choose>
						<c:when test="${login_id==null}">
							<li class="mart_regi"><a href="customerRegisterPage">회원가입</a></li>
							<li class="mart_login"><a href="customerLogin">로그인</a></li>
						</c:when>
						<c:otherwise>
							${login_id}님 환영합니다 <a href="customerLogout"><button class="logout_btn">로그아웃</button></a>
						</c:otherwise>   
					</c:choose>
				</ul>
		</div>
		</div>
		<div class="h1">
			<div class="nav">
				<ul class="nav_img" style="width:180px;">
					<li class="all_category"><img class="nav_menu" src="resources/img/Allshares/menu.png"/></li>
					<li class="category_txt">전체 카테고리
						<ul class="submenu">
							<li><a href="productByCategory?category=1">과일/채소/샐러드</a></li>
							<li><a href="productByCategory?category=2">요리/반찬</a></li>
							<li><a href="productByCategory?category=3">빵/시리얼/잼</a></li>
							<li><a href="productByCategory?category=4">생수/커피/음료</a></li>
							<li><a href="productByCategory?category=5">정육/수산/계란</a></li>
							<li><a href="productByCategory?category=6">밀키트</a></li>
							<li><a href="productByCategory?category=7">우유/유제품</a></li>
							<li><a href="productByCategory?category=8">헤어/바디/세안</a></li>
							<li><a href="productByCategory?category=9">화장지/생리대</a></li>
							<li><a href="productByCategory?category=10">세제/세탁</a></li>
						</ul>
					</li>	
				</ul>
				<div class="bmimg"><a href="customerMainPage"><img src="resources/img/Allshares/mainlogo.png"/></a></div>
				
				<ul class="nav_box" style="padding:0;">
					<li class="box"><img src="resources/img/Allshares/mystore.png" style="margin-left:11px;"/><br/><a>장바구니</a></li>
					<li class="box"><img src="resources/img/Allshares/search.png" style="margin-left:11px;"/><br/><a>상품검색</a></li>
					<li class="box" style="margin-right:11px;"><img src="resources/img/Allshares/shoppingbasket.png" style="margin-left:11px;"/><br/><a href="mypage">나의 마트</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>