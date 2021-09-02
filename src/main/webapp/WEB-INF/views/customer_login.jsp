<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/customer.css">
<title>소비자</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <!-- 네이버로그인 -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
		//카카오 로그인
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('cd2734ca3e71c9a8e5cbea5207699469');
        
        function kakaoLogin(){
        	window.Kakao.Auth.login({
        		scope:'profile_nickname,account_email',
        		success: function(authObj) {
        		      Kakao.API.request({
        		        url: '/v2/user/me',
        		        success: function(res) {
        		          alert(JSON.stringify(res));
        		          console.log(res);
        		          var name = res.kakao_account.profile.nickname;
        		          var email = res.kakao_account.email;
        		          alert(name);
        		          alert(email);
        		          
        		          var token = "";
        		          location.href = "Controller?command=naver_login&name="+name+"&email="+email+"&token="+token;
        		        }
       				});
       			 }
        })
       };
     </script>
   
</head>
<body>
	
	<%@ include file= "customer_header.jsp" %>

	<div class="login-wrap">
		<h1 class="login-title">우가소비자 로그인</h1>
			<div class="customer-icon">
				<img src="resources/img/Allshares/basket.png"/>
				<img src="resources/img/Allshares/연어.png"/>
				<img src="resources/img/Allshares/water.png"/>
				<img src="resources/img/Allshares/roll.png"/>
			</div>
			<form action="customerLoginAction">
			<div class="input-info">
				<input type="text" placeholder="아이디" name="id"/>
				<input type="password" placeholder="비밀번호" name="pw"/>
			</div>
			
			<div class="info-find">
				<input type="checkbox" id="id-check"/>
				<label for="id-check" class="id-check">아이디 저장</label>
				<a class="register">회원가입</a>
				<a class="login-pw-find">비밀번호찾기</a>
				<a class="login-id">아이디</a>
			</div>
			
			<input type="submit" value="로그인" class="login-a"/>
			</form>
			<div style='margin-top: 10px; text-align: center;'>
				<!-- 카카오 아이디 로그인 버튼 노출 영역 -->				
				<a href='javascript:kakaoLogin();'><img src='resources/img/Allshares/kakao_login.png'/></a>
			</div>
	 </div>
	 <%@ include file= "customer_footer.jsp" %>
</body>
</html>