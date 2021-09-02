<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 이벤트 수신</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/customer.css" type="text/css">
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			
			<%@ include file="customer_myPage_menuBar.jsp" %>
			<div class="mypage-main-content">
				<h3>혜택 정보 수신 관리</h3>
				<div class="mypage-event-content">
					<div class="mypage-event-content2">
						<div>
							<label class="mypage-event-label"><input type="checkbox"/>(선택)<a>서비스/이벤트 정보 제공을위한 개인정보 수집 및 이용</a> 동의</label>
							<div class="mypage-event-content3">
								<p>배민상회 회원에게 제공하는 <b style="color:#269c98;">다양한 쿠폰 혜택 및 이벤트 등</b>의 관고성 정보를 수신합니다.</p>
								<label><input type="checkbox">전체</label><label><input type="checkbox">SMS</label><label><input type="checkbox">이메일</label>
							</div>
						</div>
						<div class="mypage-event-content4">
							<span>휴대폰번호 변경,이메일 등록 및 회원정보는 <b>우가마트 내정보</b>에서 확인하실 수 있습니다. </span>
						</div>
					</div>
					<button>저장하기</button>
				</div>
			</div>
			
		</div>
	</div>
		<%@ include file= "customer_footer.jsp" %>
</body>
</html>