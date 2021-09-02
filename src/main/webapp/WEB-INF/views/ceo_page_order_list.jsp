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
			<h1>주문 목록</h1>
			
			<form action="ceoOrderListAction">
			<input type="hidden" name="ceo_number" value="${ceo_number}"/>
			<div id="search_product">
				<div>
					<select name="category">
						<option value="customer_id">주문자 아이디</option>				
						<option value="order_number">주문번호</option>				
					</select>
					<input type="text" name="categoryValue">
				</div>
				<input type="submit" value="검색하기"/>
			</div>
			</form>
			
			<c:if test="${not empty list}">
			<div id="search_product_detail">
				<table>
					<tr>
						<th>주문일</th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>상품명</th>
						<th>단가</th>
						<th>수량</th>
						<th>배송 유무</th>
					</tr>
				
					<c:forEach var="m" items="${list}">
					<tr>
						<td>${m.order_date}</td>
						<td>${m.order_number}</td>
						<td>${m.customer_id}</td>
						<td>
							<span><img src="resources/img/ceoProductPic/${ceo_number}_${m.product_number}_1.png" style="width:79px; height:79px;"></span>
							<div>${m.product_k_name}</div>
						</td>
						<td>${m.price}원</td>
						<td>${m.amount}개</td>
						
						<c:choose>
						    <c:when test="${m.delivery_whether eq '0'}">
						        <td>배송준비중</td>
						    </c:when>
						    <c:when test="${m.delivery_whether eq '1'}">
						        <td>배송 중</td>
						    </c:when>
						    <c:otherwise>
						        <td>배송 완료</td>
						    </c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
					
				</table>
			</div>
			</c:if>
		</div>
	</div>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>