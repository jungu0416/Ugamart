<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
<script> 
	$('.slider > .side-btns > div').click(function(){
	    var $this = $(this);
	    var $slider = $this.closest('.slider-1');
	    var index = $this.index();
	    var isLeft = index == 0;
	    var $current = $slider.find(' > .page-btns > div.active');
	    var $post;
	    
	    if ( isLeft ){
	        $post = $current.prev();
	    }else{
	        $post = $current.next();
	    };
	    
	    if ( $post.length == 0 ){
	        if ( isLeft ){
	            $post = $slider.find(' > .page-btns > div:last-child');
	        }else{
	            $post = $slider.find(' > .page-btns > div:first-child');
	        }
	    };
	    
	    $post.click();
	});
	
	setInterval(function(){
	    $('.slider > .side-btns > div').eq(1).click();
	}, 3000);
</script>
</head>
<body>
	<%@ include file= "customer_header.jsp" %>
		<div class="content-div">
		<!-- slide -->	
		<div id="sliderWrap">
			<ul id="slider">
				<li><img src="resources/img/Allshares/ad1.jpg" alt="슬라이드1"></li>
				<li><img src="resources/img/Allshares/ad2.jpg" alt="슬라이드2"></li>
				<li><img src="resources/img/Allshares/ad3.jpg" alt="슬라이드3"></li>
				<li><img src="resources/img/Allshares/ad4.jpg" alt="슬라이드4"></li>
				<li><img src="resources/img/Allshares/ad5.jpg" alt="슬라이드5"></li>
				<li><img src="resources/img/Allshares/ad6.jpg" alt="슬라이드6"></li>
			</ul>
		</div>
		<div class="menu-logo">
			<a href="productByCategory?category=1"><img src = "resources/img/Allshares/fruit.png"></a>
			<a href="productByCategory?category=2"><img src = "resources/img/Allshares/food.png"></a>
			<a href="productByCategory?category=3"><img src = "resources/img/Allshares/bread.png"></a>
			<a href="productByCategory?category=4"><img src = "resources/img/Allshares/drink.png"></a>
			<a href="productByCategory?category=5"><img src = "resources/img/Allshares/egg.png"></a>
			<a href="productByCategory?category=6"><img src = "resources/img/Allshares/mealkit.png"></a>
			<a href="productByCategory?category=7"><img src = "resources/img/Allshares/milk.png" ></a>
			<a href="productByCategory?category=8"><img src = "resources/img/Allshares/hair.png" style="margin-top: 10px;"></a>
			<a href="productByCategory?category=9"><img src = "resources/img/Allshares/towel.png" class="tower-item"></a>
			<a href="productByCategory?category=10"><img src = "resources/img/Allshares/dry.png" style="margin-top: 5px;"></a>
		</div>
	
		<!-- product -->
		<div class="product-category">
			<div class="best-sell">
				<div class="best-sell-title">
					<h2 class="product-big-title">요즘 잘팔려요</h2>
				</div>
				<button class="viewmore">더보기
					<img src="resources/img/Allshares/화살표.png" class="arrow"/>
				</button>
			</div>
			<div class="eachproduct-div">
			
				<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}" begin="0" end="7" step="1" varStatus="status">
				<div class="img-div">
					<div class="busines-name">${m.ceo_store_name}</div>
					<a href="eachProduct?ceo_number=${m.ceo_number}&product_number=${m.product_number}"><img src="resources/img/ceoProductPic/${m.ceo_number}_${m.product_number}_1.png" class="pro-img"/></a>
					<div class="product-info">
						<span class="product-name">${m.product_k_name}</span>
					</div>
					<div class="oneproduct-price-amount">
						<span class="opa-price">개당 ${m.product_price}원 / 1ea</span>
					</div>
					<div class="product-price">
						<span class="price-discount">${m.product_price}원</span>
						<span class="listprice">${m.product_price}원</span>
					</div>
					<img src="resources/img/Allshares/safedelivery.png" class="safedelivery"/>
				</div>
				</c:forEach>
				</c:if>
				
			</div>
		</div>
		
		<!-- product -->
		<div class="product-category">
			<div class="best-sell">
				<div class="best-sell-title">
					<h2 class="product-big-title">많이 사면 더 싸요</h2>
				</div>
				<button class="viewmore">더보기
					<img src="resources/img/Allshares/화살표.png" class="arrow"/>
				</button>
			</div>
			<div class="eachproduct-div">
				
				<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}" begin="0" end="7" step="1" varStatus="status">
				<div class="img-div">
					<div class="busines-name">${m.ceo_store_name}</div>
					<a href="eachProduct?ceo_number=${m.ceo_number}&product_number=${m.product_number}"><img src="resources/img/ceoProductPic/${m.ceo_number}_${m.product_number}_1.png" class="pro-img"/></a>
					<div class="product-info">
						<span class="product-name">${m.product_k_name}</span>
					</div>
					<div class="oneproduct-price-amount">
						<span class="opa-price">개당 ${m.product_price}원 / 1ea</span>
					</div>
					<div class="product-price">
						<span class="price-discount">${m.product_price}원</span>
						<span class="listprice">${m.product_price}원</span>
					</div>
					<img src="resources/img/Allshares/safedelivery.png" class="safedelivery"/>
				</div>
				</c:forEach>
				</c:if>
				
			</div>
		</div>
	</div>	
	<%@ include file= "customer_footer.jsp" %>
</body>
</html>