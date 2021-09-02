<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel='stylesheet' href='resources/css/ceo.css'/>
</head>
<body>
	<%@ include file= "ceo_header.jsp" %>
	<%@ include file="ceo_registerNav.jsp" %>
	
	<div class="center-wrap">
		<div class="text">
			<h2>회원가입이 완료되었습니다.</h2>
			<span>alslehs@gmail.com으로 회원가입이 완료되었습니다.</span>
			<span>콘솔에서 무료 또는 체험하기 상품의 서비스 이용이 가능합니다.</span>
		</div>
		<div style="text-align:center;">
			<a class="console"><span>메인으로 이동하기</span></a>
		</div>
	</div>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>