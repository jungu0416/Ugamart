<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel  = "stylesheet" href = "resources/css/customer.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//메뉴클릭시 사이드메뉴 나오는것 
	$(function(){
		$(".pdcategory_menu").click(function(){
			if($(".pdcategory_sidemenudiv").children(".pdcategory_sidemenu").css("display") == "none"){
				($(".pdcategory_sidemenudiv").children(".pdcategory_sidemenu").slideDown());
			}
			else{
				($(".pdcategory_sidemenudiv").children(".pdcategory_sidemenu").slideUp());				
			}
		});
	});
	$(function(){
		$(".pdcategory_menuone").click(function(){
			if($(".pdcategory_sidemenuone").children(".pdcategory_sidemenuoneworld").css("display") == "none"){
				($(".pdcategory_sidemenuone").children(".pdcategory_sidemenuoneworld").slideDown());
			}
			else{
				($(".pdcategory_sidemenuone").children(".pdcategory_sidemenuoneworld").slideUp());				
			}
		});
	});
	$(function(){
		$(".pdcategory_menutwo").click(function(){
			if($(".pdcategory_sidemenutwo").children(".pdcategory_sidemenutwoworld").css("display") == "none"){
				($(".pdcategory_sidemenutwo").children(".pdcategory_sidemenutwoworld").slideDown());
			}
			else{
				($(".pdcategory_sidemenutwo").children(".pdcategory_sidemenutwoworld").slideUp());				
			}
		});
	});
</script>
</head>
<body>
	<%@ include file= "customer_header.jsp" %>
	
	<div class="totoal_category_title">${list[0].product_category_k_name}</div>
	
	<div class= 'pdcategory_main'>
		<div class ="pdcategory_leftdiv">
			<div class = 'pdcategory_menu'>요리</div>
			<div class = 'pdcategory_sidemenudiv'>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=1">과일/채소/샐러드</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=2">요리/반찬</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=3">빵/시리얼/잼</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=4">생수/커피/음료</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=5">정육/수산/계란</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=6">밀키트</a></span></div>
				<div class = 'pdcategory_sidemenu'><span class = 'pdcategory_menuname'><a href="productByCategory?category=7">우유/유제품</a></span></div>
			</div>
			<div class = 'pdcategory_menutwo'>욕실제품</div>
			<div class = 'pdcategory_sidemenutwo'>
				<div class = 'pdcategory_sidemenutwoworld'><span class = 'pdcategory_menuname'><a href="productByCategory?category=8">헤어/바디/세안</a></span></div>
				<div class = 'pdcategory_sidemenutwoworld'><span class = 'pdcategory_menuname'><a href="productByCategory?category=9">화장지/생리대</a></span></div>
				<div class = 'pdcategory_sidemenutwoworld'><span class = 'pdcategory_menuname'><a href="productByCategory?category=10">세제/세탁</a></span></div>
			</div>
		</div>
		<div class = 'pdcategory_rightdiv'>
			<div class = 'pdcategory_borderline'></div>
			<div class = 'pdcategory_basicImage'>
				<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}">
					<div>
						<div class = 'pdcategory_martname'>${m.ceo_store_name}</div>
						<a href="eachProduct?ceo_number=${m.ceo_number}&product_number=${m.product_number}&login_id=${login_id}"><img src = "resources/img/ceoProductPic/${m.ceo_number}_${m.product_number}_1.png" class='pdcategory_basicImage_img'/></a>
						<div class = 'pdcategory_pdname'>${m.product_k_name}</div>
						<div class = 'pdcategory_price'>${m.product_price}원</div>
						<div>
							<c:forEach begin="1" end="${m.product_rating}" step="1">
								<img src = "resources/img/example/blackstar.png" class = 'pdcategory_rating'/>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file= "customer_footer.jsp" %>
</body>
</html>