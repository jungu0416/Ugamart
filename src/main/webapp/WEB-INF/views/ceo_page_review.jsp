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
			<h1>리뷰 관리</h1>
			
			<c:if test="${not empty list}">
			<div id="search_product_detail">
				<div style="margin-top:20px;"></div>
				<table>
					<tr>
						<th>리뷰 번호</th>
						<th>제품 번호</th>
						<th>고객 아이디</th>
						<th>리뷰 제목</th>
						<th>리뷰 내용</th>
						<th>리뷰 평점</th>
						<th>답글</th>
					</tr>
					<c:forEach var="m" items="${list}">
					<tr>
						<td>${m.order_number}</td>
						<td>${m.product_number}</td>
						<td>${m.customer_id}</td>
						<td>${m.customer_title}</td>
						<td>${m.customer_content}</td>
						<td>${m.rating}</td>
						<td><button>작성</button>&nbsp;<button>수정</button></td>
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