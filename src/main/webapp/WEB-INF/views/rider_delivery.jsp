<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="resources/css/rider.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file= "rider_header.jsp" %>
	<div id="rider_main">
		<%@ include file="rider_main_bar.jsp" %>
		<div id="rider_section">
			<h2>배달현황</h2>
			<div style="margin-top:20px;"></div>
			<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}" varStatus="status">
				<div class="rider_delivery">
					<div class="rider_delivery_text">	
						<div class="rider_delivery_number">주문번호 ${m.order_number}</div>
						<span class="rider_deliveryDate">${m.order_date}</span>&nbsp;<span class="rider_delivery_distance_from"></span>
						<div class="rider_delivery_store_location">${m.ceo_address}</div>
						<div class="rider_delivery_store">${m.ceo_store_name}</div>
					</div>
					<div class="rider_delivery_text_button">
						<a href="pickupDone?rider_id=${login_id}&order_number=${m.order_number}"><button class="rider_pick_up">픽업완료</button></a>
						<a href="deliveryDone?rider_id=${login_id}&order_number=${m.order_number}"><button class="rider_delivery_done">배달완료</button></a>
					</div>
				</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<%@ include file= "rider_footer.jsp" %>
</body>
</html>