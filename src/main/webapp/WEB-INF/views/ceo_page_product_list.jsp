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
			<h1>상품 목록</h1>
			
			<form action="ceoProductListAction">
			<input type='hidden' name='ceo_number' value="${ceo_number}"/>
			<div id="search_product">
				<div>
					<select name='category'>
						<option value='product_k_name'>상품 제목</option>		
						<option value='product_number'>상품 코드</option>
					</select>
					<input type="text" name='categoryValue'>
				</div>
				<input type='submit' value='검색하기'/>
			</div>
			</form>
			
			<c:if test="${not empty productList}">
				<div id="search_product_detail">
					<table>
						<tr>
							<th>상품명</th>
							<th>판매가</th>
							<th>상품 등록일</th>
							<th>재고량</th>
							<th>상품 삭제</th>
						</tr>
						
						<c:forEach var="m" items="${productList}">
						<tr>
							<td>
								<span><img src="resources/img/ceoProductPic/${m.ceo_number}_${m.product_number}_1.png" style="width:79px; height:79px;"></span>
								<div>${m.product_k_name}</div>
							</td>
							<td>${m.product_price}원</td>
							<td>${m.product_date}</td>
							<td>${m.product_stock}개</td>
							<td><button>재고 변경</button>&nbsp;<button>상품삭제</button></td>
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