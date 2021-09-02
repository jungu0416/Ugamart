<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
	<div class="mypage-menuBar">
		<div class="mypage-menuBar-member">
			<div class="mypage-menuBar-img">
				<span>나의 마트</span>
				<!-- <img src="Images/mymart-logo.png"/> -->
				 <img src="resources/img/customerMypage/무민.png"/>
			</div>
			<div class="mypage-menuBar-name">
				<div>
					<span>${login_id}님 안녕하세요</span>
				</div>
			</div>
		</div>
		<div class="mypage-menuBar2">
			<div class="mypage-menuBar-title"><span>쇼핑정보</span></div>
			<div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPageOrder"><span>주문/배송</span></a>
				</div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPageReturn"><span>취소/반품/교환 내역</span></a>
				</div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPageReview"><span>상품 후기</span></a>
				</div>
			</div>
		</div>
		<div class="mypage-menuBar2">
			<div class="mypage-menuBar-title"><span>고객센터</span></div>
			<div>
				<div class="mypage-menuBar-content">
					<span>1:1문의</span>
				</div>
				<div class="mypage-menuBar-content">
					<span>자주 묻는 질문</span>
				</div>
				<div class="mypage-menuBar-content">
					<span>공지사항</span>
				</div>
			</div>
		</div>
		<div class="mypage-menuBar2">
			<div class="mypage-menuBar-title"><span>정보관리</span></div>
			<div>
				<div class="mypage-menuBar-content">
					<a href="mypage"><span>회원정보</span></a>
				</div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPagePassword"><span>비밀번호 변경</span></a>
				</div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPageEvent"><span>혜택 정보 수신 관리</span></a>
				</div>
				<div class="mypage-menuBar-content">
					<a href="customer_myPageDrop"><span>우가마트 탈퇴하기</span></a>
				</div>
			</div>
		</div>
	</div>
