<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/customer.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
 function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
         
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
} 
</script>
</head>
<body>
	<div class="single-layout">
		<div class="single-wrap">
			<h3>회원정보를 입력 후,가입을 완료해주세요</h3>
			<form name="frm" action="customerRegisterPageAction" method="post">
				<div class="form-info">
					<h4>아이디</h4>
					<input type="text" placeholder="아이디" name="id" required/>
				</div>
				<div class="form-info">
					<h4>비밀번호</h4>
					<input type="password"  placeholder="비밀번호" name="pw" required/>
				</div>
				<div class="form-info">
					<h4>이름</h4>
					<input type="text" placeholder="이름" name="name" required/>
				</div>
				<div class="form-info">
					<h4>주소</h4>
					<input type="text" id="sample4_postcode" placeholder="우편번호" required>
					<input type="button" onclick="sample4_execDaumPostcode()" id="btn-address" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addressFirst" required>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addressLast" required>
				</div>
					<div class="form-info">
					<h4>핸드폰번호</h4>
					<input type="text" placeholder="전화번호" name="phone" required/>
				</div>
				<div class="form-info">
					<h4>이메일</h4>
					<div class="email-info">
						<input type="text" placeholder="이메일 앞자리" name="emailFirst" required>
						<span>@</span>
						<input type="text" placeholder="이메일 뒷자리" name="emailLast" required>
					</div>
				</div>
				<h6 class="email-guide">
					이메일로 비밀번호 변경 링크 등이 발송됩니다. 개인정보
					보호를 위해 정확한 메일 정보를 입력해주세요.
				</h6>
				<input type='submit' value='완료' class="btn-complete">
			</form>
		</div>
	</div>
</body>
</html>