<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			
			<%@ include file="customer_myPage_menuBar.jsp" %>
			
			<div class="mypage-main-content">
				<h3>주문배송</h3>
				
				<c:choose>
				    <c:when test="${not empty list}">
						<c:forEach var="m" items="${list}" varStatus="status">
							<div class="mypage-order-content">
								<div class="mypage-order-history">
									<span>${m.order_date}</span>
									<button>주문내역 상세보기</button>
								</div>
								<div>
									<div>
										<div class="mypage-order-content2">
											<img src="resources/img/ceoProductPic/${m.ceo_number}_${m.product_number}_1.png" style="width: 90px; height: 90px;"/>
											<div class="mypage-order-content3">
												<span>제품이름 ${m.product_k_name}</span>
												<span>제품가격 ${m.price}원 / 수량 : ${m.amount}개</span>
												<span>
													<c:choose>
													    <c:when test="${m.delivery_whether eq 0}">
													        <td>배송준비중</td>
													    </c:when>
													    <c:when test="${m.delivery_whether eq 1}">
													        <td>라이더 픽업 완료</td>
													    </c:when>
													    <c:when test="${m.delivery_whether eq 2}">
													        <td>배송 중</td>
													    </c:when>
													    <c:when test="${m.delivery_whether eq 3}">
													        <td>배송 완료</td>
													    </c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					 </c:when>
					<c:otherwise><%@ include file="customer_myPageEmpty.jsp" %></c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
		<%@ include file= "customer_footer.jsp" %>
</body>
</html>