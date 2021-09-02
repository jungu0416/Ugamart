<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/ceo.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function previewImage(f){
	var file = f.files;
	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;
		document.getElementById('preview').innerHTML = '';
	}else {
		// FileReader 객체 사용
		var reader = new FileReader();
		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			document.getElementById('preview').innerHTML = '<img src="' + rst.target.result + '" class="img_profile"/>';
		}
		// 파일을 읽는다
		reader.readAsDataURL(file[0]);
	}
}	
//주소 api
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
<style>
.ads_btn{
    width: 107px;
    height: 45px;
    background: #fff;
    border: 1px solid #dadada;
}
</style>
</head>
<body>
	<%@ include file= "ceo_header.jsp" %>
	<%@ include file="ceo_registerNav.jsp" %>
	
	<form action="registerThird" method="post" enctype="multipart/form-data">
		<div class="register">
			<h2>1.로그인 정보</h2>
			<div class="content">
				<div class="content-left">
					아이디 (필수)
				</div>
				<div class="content-right">
					<input style="width:80%;" name="id" type="text" placeholder="아이디용 이메일을 입력해 주세요" class="input" required/>
					<button type="button">중복확인</button>
					<div></div>
					<p>*입력하신 이메일로 서비스 관련 주요사항이 안내됩니다.<p>
				</div>
			</div>
			<div class="content">
				<div class="content-left">
					비밀번호 (필수)
				</div>
				<div class="content-right">
					<input type="password" name="pw" placeholder="비밀번호를 입력해 주세요" class="input" required/>
				</div>
			</div>
			<div class="content">
				<div class="content-left">
					비밀번호 확인 (필수)
				</div>
				<div class="content-right">
					<input type="password" name="repw"placeholder="비밀번호를 다시 입력해 주세요" class="input" required/>
					<div></div>
					<p>비밀번호는 8자 이상,16자 이하의 영문자,숫자 및 특수문자를 조합하여 사용해야 합니다.<p>
				</div>
			</div>
			
			<h2>2.개인 정보</h2>
				<div class="content">
					<div class="content-left">
						프로필 이미지 (선택)
					</div>
					<div class="content-right">
						<div id="preview" style="margin:0px !important;"><img src="resources/img/example/defaultImage.png" class="img_profile"></div>
						<input type="file" name='profile' accept="image/*" onchange="previewImage(this)"/>
					</div>
				</div>
				<div class="content">
					<div class="content-left">
						매장 이름 (필수)
					</div>
					<div class="content-right">
						<input type="text" name="name" placeholder="사장님께서 사용하실 매장 이름을 입력해 주세요!" class="input" required/>
					</div>
				</div>
				<div class="content">
					<div class="content-left">
						휴대폰 번호 (필수)
					</div>
					<div class="content-right">
						<div>
							<select class="select" name='phoneFirst' required>
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="text" name="phoneSecond" placeholder="'-'없이 입력" class="input2" required>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="content-left">
						주소 (필수)
					</div>
					<div class="content-right">
						<div>
							<input type="text" id="sample4_postcode" class="input2" placeholder="우편번호" required>
							<input type="button" class='ads_btn' onclick="sample4_execDaumPostcode()" id="btn-address" value="우편번호 찾기"><br>
						</div>
						<div><input type="text" id="sample4_roadAddress" class="input" name="address" placeholder="도로명주소" required></div>
						<span id="guide" style="color:#999;display:none"></span>
						<div><input type="text" id="sample4_detailAddress" class="input" name="addressDetail" placeholder="상세주소" required></div>
					</div>
				</div>
		</div>
		<div class="btnbox">
			<a href="registerFirst" class="btn-b"><span>이전</span></a>
			<input type='submit' class="btn-a" value="다움">
		</div>
	</form>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>