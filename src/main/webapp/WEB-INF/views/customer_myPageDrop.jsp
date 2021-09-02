<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<link rel="stylesheet" href="css/customer.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			<%@ include file="customer_myPage_menuBar.jsp" %>
			
			<div class="mypage-main-content">
				<h3>회원 탈퇴하기</h3>
				<div class="mypage-drop-content">
					<div class="mypage-drop-content2">
						<div class="mypage-drop-content3">
							<h4>우가마트 <b style="color:red;">회원정보가 영구 삭제</b>됩니다.</h4>
							<ul>
								<li>배송지/사업자 정보가 삭제됩니다.</li>
								<li>탈퇴 후에는 서비스 이용 및 데이터 복구가 불가능합니다.</li>
							</ul>
							<h4>우가마트<b style="color:red;"> 주문내역 조회가 불가</b>합니다.</h4>
							<ul>
								<li>배송중인 상품은 정상적으로 배송이 완료됩니다.</li>
								<li>주문내역은 최대 5년까지 보관됩니다.</li>
							</ul>
							<h4><b style="color:#269c98;">우가마트는 계속 이용</b>하실 수 있습니다.</h4>
							<ul>
								<li>우가마트 회원정보는 삭제되지 않습니다.</li>
								<li>다른 패밀리 서비스도 기존과 동일하게 이용하실 수 있습니다.</li>
							</ul>
							<h4>우가마트 탈퇴후 언제든지 <b style="color:#269c98;">서비스 재가입이 가능</b>합니다.</h4>
							<ul>
								<li>단,재가입하셔도 과거의 개인정보와 주문내역은 복구되지 않습니다.</li>
								<li>단,회원 계정 관련 어뷰징(위법,부당한 행위)으로 판단될 경우 사이트 가입 및 이용이 제한될 수 있습니다.</li>
							</ul>
						</div>
						<div>
							<label>
								<input type="checkbox">
								위의 주의사항을 모두 확인했습니다.
							</label>
						</div>
						<a href="customer_myPageDropAction"><button>삭제하기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file= "customer_footer.jsp" %>
</body>
</html>