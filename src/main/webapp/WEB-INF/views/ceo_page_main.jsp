<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="resources/js/ceo_js.js"></script>
<link href="resources/css/ceo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file= "ceo_header.jsp" %>
	<div id="ceo_main_container">
		<%@ include file="ceo_main_page_menu_bar.jsp" %>
		<div id="ceo_modify_area">
			<h3>매출 현황</h3>
				
				<c:if test="${not empty orderAmount}">
				<div id="order_pay_refund">
					<div>
						<div class="order_pay_refund_img"><img src="resources/img/ceo_page_main/shopping_basket.png"/></div>
						<div class="order_pay_refund_detail">
							<span class="order_pay_refund_detail_title">주문</span><span class="order_pay_refund_detail_title_num"><a> ${orderAmount}</a>건</span><br/>
							<div class="order_pay_refund_detail_order">${priceAmount}원</div>
						</div>
					</div>				
				</div>
			<h3>주문 현황</h3>
			<div class="status">
				<div>
					<span class="waiting_to_ship">${deliveryReady}</span>
					<div>배송 준비중</div>
				</div>
				<div>
					<span class="shipping">${delivering}</span>
					<div>배송 중</div>
				</div>
				<div>
					<span class="shipping_complate">${deliveryDone}</span>
					<div>배송 완료</div>
				</div>
			</div>
			</c:if>
		</div>
	</div>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>