<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="rider_main_bar">
	<div class="rider_id_side">
		<span>XML112</span><a> 라이더님</a>			
	</div>
	<div class="rider_side_bar"><a href="findOrderList">주문현황</a></div>
	<div class="rider_side_bar"><a href="deliveryWhether?login_id=${login_id}">배달현황</a></div>
	<div class="rider_side_bar"><a href="deliveryDoneList?login_id=${login_id}">배달내역</a></div>
	<div class="rider_side_bar"><a href="">탈퇴하기</a></div>
</div>