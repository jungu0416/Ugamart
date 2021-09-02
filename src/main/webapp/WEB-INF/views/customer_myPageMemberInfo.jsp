<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 멤버 정보</title>
<link rel="stylesheet" href="css/customer.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('#btn-revise').click(function(){
			if($("#revise").css("display") == "none"){
				$('#revise').css('display','block');
				$('#btn-revise').text('취소');
			}
			else{
				$('#revise').css('display','none');
				$('#btn-revise').text('수정');
			}
		});
		$('#btn-revise2').click(function(){
			if($("#revise2").css("display") == "none"){
				$('#revise2').css('display','block');
				$('#btn-revise2').text('취소');
			}
			else{
				$('#revise2').css('display','none');
				$('#btn-revise2').text('수정');
			}
		});
	});
</script>
<style>
	#revise{
		display:none;
	}
	#btn-revise{
		cursor:pointer;
	}
	#revise2{
		display:none;
	}
	#btn-revise2{
		cursor:pointer;
	}
</style>
</head>
<body>
<%@ include file= "customer_header.jsp" %>
	<div class="mypage-container">
		<div class="mypage-container2">
			
			<%@ include file="customer_myPage_menuBar.jsp" %>
			<div class="mypage-main-content">
				<h3>회원정보</h3>
				<div class="mypage-member-info">
					<div>
						<h5>아이디</h5>
						<span>${dto.customer_id}</span><br/>
					</div>
					<div>
						<div class="mypage-member-info2">
							<h5>기본정보</h5>
							<button id="btn-revise">수정</button>
						</div>
						<p>이름</p>
						<span>${dto.customer_name}</span>
						<p>휴대폰 번호</p>
						<span>${dto.customer_phone}</span>
						<form action="modifyPhoneNumber" method="post">
							<div id="revise">	
								<div class="form-info">
									<input type="text"  name="phone" placeholder="변경할 휴대폰 번호를 입력해주세요." required/>
								</div>
								<input type="submit" class="btn-complete" value="저장"/>
							</div>
						</form>
					</div>
					<div style="border:0;">
						<div class="mypage-member-info2" style="margin-bottom: 12px;">
							<h5>이메일</h5>
							<button id="btn-revise2">수정</button>
						</div>
						<span>${dto.customer_email }</span>
						<form action="modifyEmail" method="post">
							<div id="revise2">
								<div class="form-info">
									<div class="email-info">
										<input type="text" id="email-front" name="emailFront" placeholder="이메일 앞자리" required>
										<span>@</span>
										<input type="text" id="email-back" name="emailBack" placeholder="이메일 뒷자리" required>
									</div>
								</div>
								<h6 class="email-guide">
									이메일로 비밀번호 변경 링크 등이 발송됩니다. 개인정보
									보호를 위해 정확한 메일 정보를 입력해주세요.
								</h6>
								<input type="submit" class="btn-complete" value="저장"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file= "customer_footer.jsp" %>
</body>
</html>