<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe5493441e68a4bc3a81c0363e6411042"></script>
<link href="resources/css/rider.css" rel="stylesheet" type="text/css" />
<script>

var ceo_longitude;
var ceo_latitude;
var rider_longitude;
var rider_latitude;
var tDistance;


//사용자 주소 지오코딩
function getLatLog(address,Jthis){
	$.ajax({
		method : "GET",
		url : "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
		async : false,
		data : {
			"appKey" : "l7xxe5493441e68a4bc3a81c0363e6411042",
			"coordType" : "WGS84GEO",
			"fullAddr" : address
		},
		success : function(response) {
			var resultInfo = response.coordinateInfo; // .coordinate[0];
			console.log(resultInfo);

			var resultCoordinate = resultInfo.coordinate[0];
			if (resultCoordinate.lon.length > 0) {
				// 구주소
				ceo_longitude = resultCoordinate.lon;
				ceo_latitude = resultCoordinate.lat;
			} else { 
				// 신주소
				ceo_longitude = resultCoordinate.newLon;
				ceo_latitude = resultCoordinate.newLat;
			}
			
		}
	});
}
//현위치 지오코딩
function riderPosition(){
	navigator.geolocation.getCurrentPosition(function(pos) {
		rider_latitude = pos.coords.latitude;
		rider_longitude = pos.coords.longitude;
		
		$('.customer_orderList').each(function (index, item) {
			var address = $(this).find(".distance_from").attr("address");
			var tthis = $(this);
			
			getLatLog(address,tthis);
			
			findTime(rider_longitude,rider_latitude,ceo_longitude,ceo_latitude, tthis);
		});	

	});
}
//경로 시간 알려주는 ajax
function findTime(rider_longitude,rider_latitude,ceo_longitude,ceo_latitude, Jthis) {
	//JSON TYPE EDIT [S]
	$.ajax({
		type : "POST",
		url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
		async : false,
		data : {
			"appKey" : "l7xxe5493441e68a4bc3a81c0363e6411042",
			"startX" : rider_longitude,
			"startY" : rider_latitude,
			"endX" : ceo_longitude,
			"endY" : ceo_latitude,
			"reqCoordType" : "WGS84GEO",
			"resCoordType" : "EPSG3857",
			"searchOption" : "0",
			"trafficInfo" : "Y"
		},
		success : function(response) {
			var resultData = response.features;
			tDistance = "총 거리 : " + (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km";
			
			Jthis.find(".distance_from").text(tDistance);
		},
	});
};
$(function(){
	riderPosition();
});
</script>
</head>
<body>
	<%@ include file= "rider_header.jsp" %>
	<div id="rider_main">
		<%@ include file="rider_main_bar.jsp" %>
		<div id="rider_section">
			<h2>주문현황</h2>
			<div style="margin-top:20px;"></div>
			
			<c:if test="${not empty list}">
				<c:forEach var="m" items="${list}" varStatus="status">
					<div class="customer_orderList">
						<div class="customer_orderList_text">	
							<div class="customer_orderList_number">주문번호 ${m.order_number}</div>
							<span class="customer_orderDate">${m.order_date}</span>&nbsp;<span class="distance_from" address='${m.ceo_address}'></span>
							<div class="customer_order_store_location">${m.required_address}</div>
							<div class="customer_order_store">${m.ceo_store_name}</div>
							<div class="customer_order_store">${m.product_k_name} / ${m.product_amount}개</div>
						</div>
						<div class="customer_orderList_text_button">
							<a href="pickOrderList?order_number=${m.order_number}&login_id=${login_id}"><button class="rider_takeover">접수하기</button></a>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			
		</div>
	</div>
	<%@ include file= "rider_footer.jsp" %>
</body>
</html>