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
		<h1>상품 등록</h1>
		
		<div id="registerTable">
			<div class="registerTable_title">기본정보 </div>
			<form action="ceoRegisterProductAction" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ceo_number" value="${ceo_number}"/>
			<table>
				<tr>
					<td class="registerTable_text">상품 카테고리</td>
					<td class="registerTable_area">
						<select name="product_category" required>
							<option value="0" selected>선택</option>
							<option value="1">과일/채소/샐러드</option>
							<option value="2">요리/반찬</option>
							<option value="3">빵/시리얼/잼</option>
							<option value="4">생수/커피/음료</option>
							<option value="5">정육/수산/계란</option>
							<option value="6">밀키트</option>
							<option value="7">우유/유제품</option>
							<option value="8">헤어/바디/세안</option>
							<option value="9">화장지/생리대</option>
							<option value="10">세제/세탁</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="registerTable_text">상품명</td>
					<td class="registerTable_area">
						<input type='text' name="product_k_name" required/>
					</td>
				</tr>
				<tr>
					<td class="registerTable_text">자체 상품코드</td>
					<td class="registerTable_area">
						<input type='text' name="product_number" required/><button id="btn_checkProduct_number">중복확인</button>
					</td>
				</tr>
				<tr>
					<td class="registerTable_text">상품가격</td>
					<td class="registerTable_area"><input type='text' name="product_price" required/><a> 원</a></td>
				</tr>
				<tr>
					<td class="registerTable_text">상품 상세정보</td>
					<td class="registerTable_area">
						<textarea placeholder="상세정보 입력" name="product_detail" required></textarea>
					</td>
				</tr>
				<tr>
					<td class="registerTable_text">재고량</td>
					<td class="registerTable_area"><input type='text' name="product_stock" required/></td>
				</tr>
				<tr>
					<td class="registerTable_text">이미지</td>
					<td class="registerTable_area">
						<input type='file' name='product1' required>
						<input type='file' name='product2' required>
						<input type='file' name='product3' required>
					</td>
				</tr>
			</table>
			<input id="btn_register_product" type="submit" value="등록하기"/>
			</form>
		</div>
		</div>
	</div>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>