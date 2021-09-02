<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/ceo.css">
<script>
	$(function(){
		$('#btn').click(function(){
			$('#modal').css('display','flex');
			$('#modal').load('ceo_registerTos1.jsp');
		});
		
		$('#btn2').click(function(){
			$('#modal').css('display','flex');
			$('#modal').load('ceo_registerTos2.jsp');
		});
		
		$('#btn3').click(function(){
			$('#modal').css('display','flex');
			$('#modal').load('ceo_registerTos3.jsp');
		});
	$(document).on('click','.close',function(){
		$('#modal').css('display','none');
	});
	
		if($(".tc-ul").children().eq(0).children().eq(0).text()=='1'){
			$(".tc-li").addClass("checked");
		}
	
	});
</script>
</head>
<body>
	<%@ include file= "ceo_header.jsp" %>
	<%@ include file="ceo_registerNav.jsp"%>
	
	<div class="check">
		<label for="cb">
			전체 약관에 동의합니다.
			<input type="checkbox" id="cb"/>
		</label>
		<ul>
			<li>
				<input type="checkbox" id="cb2"/>
				<label for="cb2">서비스 이용약관(필수)</label>
				<button type="button" id='btn'>전문보기</button>
			</li>
			<li>
				<input type="checkbox" id="cb3"/>
				<label for="cb3">개인정보 수집 및 이용에 대한 안내(필수)</label>
				<button type="button" id='btn2'>전문보기</button>
			</li>
			<li>
				<input type="checkbox" id="cb4"/>
				<label for="cb4">광고성 정보 수신(선택)</label>
				<button type="button" id='btn3'>전문보기</button>
			</li>
		</ul>
		<div class="btnbox">
			<a href="registerSecond" class="btn-a"><span>다음</span></a>
		</div>
		<div id="modal"></div>
	</div>
	<%@ include file= "ceo_footer.jsp" %>
</body>
</html>