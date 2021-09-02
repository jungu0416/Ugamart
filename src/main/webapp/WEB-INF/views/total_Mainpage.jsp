<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<link rel="stylesheet" href="resources/css/totalpage.css" type="text/css">
<script type="text/javascript" src="resources/js/total_Mainpage.js"></script>
<style>
.full2>span, .full3>span , .full4>span{
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="fullpage">
		<div class='quick'><ul class="quick-ul"></ul></div>
		<div class="fullsection full1" pageNum="1" id="container">
			<div class="marg-img">
				<img src = "resources/img/Allshares/mart.png" style="height:365px;"/>
			</div>
			<h2><span style="color:#FFBB9A;">우가마트</span></h2>
		</div>
		<div class="fullsection full2" pageNum="2" onclick="" ><span><a href="customerMainPage">소비자 페이지</a></span>
			<img src="resources/img/Allshares/shopping.png" class="shopping"/>
		</div>
		<div class="fullsection full3" pageNum="3" onclick=""><span><a href="riderLogin">라이더 페이지</a></span>
			<img src="resources/img/Allshares/rider.png" class="rider"/>
		</div>
		<div class="fullsection full4" pageNum="4" onclick=""><span><a href="ceoLogin">사장님 페이지</a></span>
			<img src="resources/img/Allshares/ceo.png" class="admin"/>
		</div>
		<div class="fullsection full5" pageNum="5">
			<div class="full5-2">
				<span style="color:black; font-size:30px; top: 10%; left: 10%">uga.com</span>
				<img src="resources/img/Allshares/underline.png" class="underline"/>
				<h2 class="good-txt">우리에게 가까이 있는 마트</h2>
				<h2 class="good-bye">방문해 주셔서 감사합니다</h2>
				<img src="resources/img/Allshares/cats.gif" class="goodbye-img"/>
			</div>	
		</div>
	</div>
</body>

