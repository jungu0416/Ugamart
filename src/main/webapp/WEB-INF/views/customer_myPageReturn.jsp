<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/반품/교환 내역</title>
<link rel="stylesheet" href="css/customer.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			
			<%@ include file="customer_myPage_menuBar.jsp" %>
			
			<div class="mypage-main-content">
				<h3>취소/반품/교환 내역</h3>
			<%@ include file="customer_myPageEmpty.jsp" %>
			
			</div>
		</div>
	</div>
		<%@ include file= "customer_footer.jsp" %>
</body>
</html>