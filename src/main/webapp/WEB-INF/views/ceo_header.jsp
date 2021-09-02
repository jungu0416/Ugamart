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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=881686256c60c55dc4f7b680136d7235&libraries=services"></script>
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
						<c:when test="${ceo_number==null}" >
							<li class="mart_regi"><a href="registerFirst">회원가입</a></li>
							<li class="mart_login"><a href="ceoLogin">로그인</a></li>
						</c:when>
						<c:otherwise>
							상점 ${ceo_number}호님 환영합니다 <a href="ceoLogout"><button class="logout_btn">로그아웃</button></a>
						</c:otherwise>   
					</c:choose>
				</ul>
		</div>
		</div>
		<div class="h1">
			<div class="nav">
				<div class="bmimg"><img src="resources/img/Allshares/ceo-icon.png"/></div>
				<div class="nav-menu">
					<div class="product-manage"><a>상품관리</a></div>
					<div class="order-manage"><a>주문관리</a></div>
					<div class="review-manage"><a>리뷰관리</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>