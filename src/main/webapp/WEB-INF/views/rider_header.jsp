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
</head>
<body>
	<div class="all">
		<div class="h1">
			<div class="header_top">
				<ul class="htext1">
					<li class="mart_user"><a href="http://localhost:9999/ugaMart/">우가마트</a></li>
					<li class="mart_rider"><a href="riderLogin">우가 라이더 광장</a></li>
					<li class="mart_owner"><a href="ceoLogin">우가사장님 광장</a></li>
				</ul>	
				<ul class="htext2">
				  <li><a href="riderLogout" class="riderlogout_btn">로그아웃</a></li>
				</ul>
		</div>
		</div>
		<div class="h1">
			<div class="nav">
				<div class="bmimg"><img src="resources/img/Allshares/rider-icon.png" /></div>
				<div class="nav-menu">
					<div class="product-manage"><a>주문현황</a></div>
					<div class="order-manage"><a>배달현황</a></div>
					<div class="review-manage"><a>배달내역</a></div>
					<div class="review-manage"><a>탈퇴</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>