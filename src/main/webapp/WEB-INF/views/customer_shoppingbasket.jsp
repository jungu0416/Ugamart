<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
<title>장바구니 </title>
</head>
<body>
	<%@ include file="customer_header.jsp" %>
	<div class="cover-div">
		<h1 class="basket-title-h1">장바구니</h1>
		<section class="basket-content-section">
			<div class="choose-div">
				<div class="choose-btn">
					<label><input type="checkbox"  value="choose-release" style="width:24px; height:24px;" checked/>전체선택 </label>
				<button class="product-delete">상품삭제</button>
				</div>
			</div>
			
			<div class="select-left">
				<div class="basket-product-div">
					<div class="delievery-text">든든배송 1개</div>
				</div>
				<div class="product-detail">
					<input type="checkbox" style="width:24px; height:24px;" checked/>
					<a ><img src="resources/img/Allshares/snack.png" class="basket-product-img"/></a>
					<div class="basket-product-name">
						<div>
							<div class="eachproduct-name">[웰컴][든든] 코다노 롱 치즈스틱 1kg</div>
							<div class="name-name">[든든]코다노 롱 치즈스틱 1kg</div>
						</div>
					</div>
					<div class="product-delete-pricebtn">
						<img src="resources/img/Allshares/garbage.png" class="garbage"/>
						
						<div class="eachpriceupdown-btn">
							<div class="eachproduct-amount">
								<div class="basket-productamount" id="result">1</div>
								<div class="arrow-arrow">
									<div class="uparrow">
										<img src="resources/img/Allshares/arrow.png" class="arrowupimg"/>
									</div>
									<div class="downarrow">
										<img src="resources/img/Allshares/arrow.png" class="arrowdownimg"/>
									</div>
								</div>
							</div>
							<span class="basketproduct-price">11,000원</span>
						</div>
					</div>
					</div>
			</div>
			<div class="select-right" style="position: fixed; margin-left: 690px; margin-top: 80px;">
				<div class="estimated-payment-pack" style="max-width: 368px;">
					<div class="price-pack">
						<div class="basket-estimated">
							<div class="estimated-price-text">결제예상금액</div>
							<div class="basket-delivery-text">
								<span>든든배송 총 금액</span>
								<span>11,000원</span>
							</div>
							<div class="line-div"></div>
							<div class="estimated-priceamount">
								<span>결제예상금액</span>
								<span>11,000원</span>
							</div>
						</div>
						
						<div class="empty-div"></div>
						
						<div class="icepack-text">
							<span class="icepack-text2">주문 시 아이스포장을 선택</span><span class="icepack-text3">할 수 있으며,</span>
							<span class="icepack-text3">아이스포장비 2,500원이 추가(+)됩니다.</span>
						</div>
						<div class="basket-orderprice">
							<button class="basket-order-button">주문하기(1개)</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>