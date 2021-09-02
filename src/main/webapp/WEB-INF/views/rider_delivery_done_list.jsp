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
			<h2>배달내역</h2>
			<div style="margin-top:20px;"></div>
			<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}" varStatus="status">
				<div class="rider_delivery_list">
					<div class="rider_delivery_area">
						<div class="rider_delivery_order_number">주문번호 ${m.order_number}</div>	
						<div class="rider_delivery_order_date">${m.order_date}</div>	
						<div class="rider_delivery_list_store">${m.ceo_store_name}</div>	
					</div>	
					<div class="rider_delivery_area_side">배달완료</div>
				</div>
				</c:forEach>
			</c:if>
			
		</div>
	</div>
	<%@ include file= "rider_footer.jsp" %>
</body>
</html>