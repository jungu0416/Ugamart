<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/rider.css">
</head>
<body>
	<div class="rider-wrap">
	<h1 class="rider-title">우가 라이더 로그인</h1>
		<form action="riderLoginAction" method="post">
			<div class="riderinput-info">
				<input type="text" placeholder="아이디" name="id"/>
				<input type="password" placeholder="비밀번호" name="pw"/>
			</div>
			<div class="riderinfo-find">
				<input type="checkbox" id="riderid-check"/>
				<label for="riderid-check" class="riderid-check">아이디 저장</label>
				<a href="riderRegister">회원가입</a>
				<a href="riderlogin-pw-find">비밀번호 찾기</a>
				<a href="riderlogin-id">아이디 찾기</a>
			</div>
			<div style="text-align:center;"><input type="submit" value="로그인" class="riderlogin-btn"/></div>
		</form>
	</div>
</body>
</html>