<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 비밀번호 변경</title>
<link rel="stylesheet" href="css/customer.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			
			<%@ include file="customer_myPage_menuBar.jsp" %>
			<div class="mypage-main-content">
				<h3>비밀번호 변경</h3>
				<form action="customer_myPagePasswordAction" method="post">
					<div class="mypage-password">
						<div>
							<span>새 비밀번호</span>
							<input type="password" name="pw" placeholder="영어,숫자,특수문자 등을 조합하여서 10자리 이상"/>
						</div>
						<div>
							<span>새 비밀번호 확인</span>
							<input type="password" placeholder="새 비밀번호 재입력" name=repw/>
						</div>
						<ul>
							<li>비밀번호 변경후 우가마트 계정으로 사용 중인 서비스에 다시 로그인해주세요.</li>
							<li>주문을 놓치지 않도록 우가마트 주문접수에 다시 로그인해주세요. 우가마트 주문접수는 비밀번호 변경 후 일정 시간이 지나면 자동으로 로그아웃 됩니다.</li>
						</ul>
						<input type="submit" value="비밀번호 변경">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file= "customer_footer.jsp" %>	
</body>
</html>