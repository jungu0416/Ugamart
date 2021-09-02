<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe5493441e68a4bc3a81c0363e6411042"></script>
<link rel  = "stylesheet" href = "resources/css/customer.css"/>
<title>Insert title here</title>
<script>
$(function(){
	function getLatLog(address){
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
					lon = resultCoordinate.lon;
					lat = resultCoordinate.lat;
				} else { 
					// 신주소
					lon = resultCoordinate.newLon;
					lat = resultCoordinate.newLat
				}
			}
		});
	}
	//경로 시간 알려주는 ajax
	function findTime(customer_longitude,customer_latitude,ceo_longitude,ceo_latitude) {
		//JSON TYPE EDIT [S]
		$.ajax({
			type : "POST",
			url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
			async : false,
			data : {
				"appKey" : "l7xxe5493441e68a4bc3a81c0363e6411042",
				"startX" : customer_longitude,
				"startY" : customer_latitude,
				"endX" : ceo_longitude,
				"endY" : ceo_latitude,
				"reqCoordType" : "WGS84GEO",
				"resCoordType" : "EPSG3857",
				"searchOption" : "0",
				"trafficInfo" : "Y"
			},
			success : function(response) {
				var resultData = response.features;
				var tTime = "배달 시간 ~" + (resultData[0].properties.totalTime / 60).toFixed(0) + "분";
				var tDistance = "총 거리 : " + (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km";
				$("#delivery_time").html(tTime);
			},
		});
	};
	var customer_address = '${map1['customer_address']}';
	var ceo_address = '${map1['ceo_address']}';
	var lon, lat;
	
	getLatLog(customer_address);
	var customer_longitude = lon;
	var customer_latitude = lat;
	
	getLatLog(ceo_address);
	var ceo_longitude = lon;
	var ceo_latitude = lat;
	findTime(customer_longitude,customer_latitude,ceo_longitude,ceo_latitude);
});
</script>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$(function(){
	$(".each_littleImages>img").mouseenter(function(){
		var move = $(this).attr("src");
		$(".each_bigImages>img").attr("src" , move);
	});
	
	var each_price = $(".eachproduct_totalprice").text();
		each_price = each_price.replace(",","");
	//-버튼클릭시
	$("#minus").click(function(){
		var each_amount = Number($("#each_amount").val());
			each_amount -=1; //누를때마다 감소되는 총수량
		
		if(each_amount>0){
			$("#each_amount").val(each_amount);
			
			var totalprice = Number(each_price)*each_amount;
				totalprice = numberWithCommas(totalprice);
			$(".eachproduct_totalprice").text(totalprice);
		}
		else{
			alert("구매하실때 한개의 상품은 적용되어야 합니다.");				
		}
	});
	//+버튼 클릭시
	$("#plus").click(function(){
		var each_amount = Number($("#each_amount").val());
			each_amount +=1;  //누를때마다 증가되는 총수량
			
			$("#each_amount").val(each_amount);
			
			var totalprice = 0;
			totalprice = Number(each_price)*each_amount;
			totalprice = numberWithCommas(totalprice);
			$(".eachproduct_totalprice").text(totalprice);
	});
		
	//상품상세 눌럿을때 제이쿼리
	$(".each_detail_menuone").click(function(){
		$('.each_detail_menuone').css("background-color" , "white");
		$('.each_detail_menutwo').css("background-color" , "rgb(221, 221, 221)");
		$('.each_detail_maindiv').show();
		$('.each_review_main').hide();
	});
	//상품후기눌렀을때 제이쿼리
	$(".each_detail_menutwo").click(function(){
		if($(".each_review_main").css("display") == "none"){   
	        $('.each_review_main').css("display", "block");
	        $('.each_detail_menutwo').css("background-color" , "white");
	        $('.each_detail_menuone').css("background-color" , "rgb(221, 221, 221)");
	        $('.each_detail_maindiv').hide();
	        
	    } 
		else {  
	        $('.each_review_main').css("display", "block");   
	    }  
	});

	
	$(".each_review_write").click(function(){
		var customer_id = "${login_id}";
		var ceo_number = ${dto.ceo_number};
		var product_number = ${dto.product_number};
		
		var map = {
				"customer_id" : customer_id,
				"ceo_number" : ceo_number,
				"product_number" : product_number
		}
		//구매했는지 체크하기
		 $.ajax({
            url: "ajax/checkReview",
            type: "POST",
            data: JSON.stringify(map),
            contentType : "application/json",
            async: false,
            success: function(data){
            	if(data > 0 ){
            		writeReview();
            	}else{
            		alert("제품을 구매해야 리뷰를 쓸 수 있습니다");
            	}
            },
            error: function(err){
            	alert(err);
            }
        });
	});
	
	function writeReview(){
		var str = "<form action='writeReview'><div class='modal'><div class='review_main'><div class = 'review_x'><img src = 'resources/img/Allshares/x.png'/></div>"
				+ "<input type='hidden' name='customer_id' value='${login_id}'/>"
				+ "<input type='hidden' name='ceo_number' value='${dto.ceo_number}'/>"
				+ "<input type='hidden' name='product_number' value='${dto.product_number}'>"
				+ "<div class = 'review_write'>리뷰 작성</div>"
				+ "<div style = 'text-align:right;'><select class = 'review_rating' name='rating'>"
				+ "<option>별점</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option>"
				+ "</select></div>"
				+ "<textarea name = 'customer_content' class='review_writing_customor' placeholder='솔직한 후기는 주문을 고민하는 분들에게 큰 도움이 됩니다. 허위 리뷰나 욕설, 비방이 포함되지 않게 주의해서 작성해주세요.(1,000자 이내)'></textarea>"
				+ "<div  class= 'review_savediv'><input type='submit' class= 'review_save' value ='저장하기'></div></div></form>";
		
		$(".modal_main").html(str);
		$("body").css("width" , "100%");
	};
	$(document).on("click" , ".review_x",function(){
		$(".modal_main").html("");
	});
});

$(document).on("click",".each_buy",function(){
	var form = {
            id : "${login_id}",
    		ceo_number : "${dto.ceo_number}",
    		product_number : "${dto.product_number}",
    		amount : $("#each_amount").val(),
    		price : $(".eachproduct_totalprice").text()
	}
    $.ajax({
        url: "ajax/buyProduct",
        type: "POST",
        data: JSON.stringify(form),
        contentType: "application/json",
        success: function(data){
        	var par = JSON.parse(data);
        	
			if(par==1){
				alert("구매완료");
			}else{
				alert("구매실패");
			}
        },
        error: function(err){
        	data_yg = err;
            alert("err 발생:"+err);
        }
    });
});
</script>
</head>
<body>
	<div class='modal_main'></div>
	<%@ include file= "customer_header.jsp" %>
	<div class="eachmainpage">
		<div id="eachproduct_topside">
			<div class = "eachleftimage">
				<div class = 'each_bigImages'><img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_1.png" style='width:580px; height:580px;'/></div>
				<div class = 'each_littleImages'>
					<img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_1.png" class = 'each_onetwothreeImages'/>
					<img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_2.png" class = 'each_onetwothreeImages'/>
					<img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_3.png" class = 'each_onetwothreeImages'/>
				</div>
			</div>
			<div class= "eachright_text">
				<div class='eachtext_productname'>${dto.product_k_name}</div><!-- Product_name- -->
				<div class="each_option">
					<ul>
						<li><div class='eachproduct_div'>가격</div><span  class = 'eachtext_moreinfor'>${dto.product_price}원</span></li>
						<li><div class='eachproduct_div'>재고</div><span class = 'eachtext_moreinfor'>${dto.product_stock}개</span></li>
						<li><div class='eachproduct_div'>라이더</div><span class = 'eachtext_moreinfor' id="delivery_time"></span></li>
						<li><div class='eachproduct_div'>평점</div><span class = 'eachtext_moreinfor'>${dto.product_rating}/5.0점</span></li>
						<li>
							<div class='eachproduct_div'>주문수량</div>
							<span class = 'eachtext_moreinfor'>
								<input type = 'button' id='minus' value='-' class = 'each_btn_minus'/>
								<input type = "text" id = 'each_amount' value='1' class = 'each_btn_number'/>
								<input type = "button" id="plus" value='+' class = 'each_btn_plus'/>
							</span>
						</li>
					</ul>
				</div>
		
				
				<div class="eachproduct_borderline"></div>	
				
				<div class = 'each_textamount'>
					<span class='eachproduct_totalpricetext'>총액</span>
					<span class='eachproduct_totalprice'>${dto.product_price}</span>
					<span style = 'font-size:35px;'>원</span>
				</div>
				<div class = 'each_box_buy_div'>
					<a><span class='each_box'>장바구니</span></a>
					<a><span class='each_buy'>구매하기</span></a>
				</div>
			</div>
		</div>
					
		<div class='each_detail_menu'>
			<div class='each_detail_menuone'><span style='border-bottom:  2px solid #FFBB9A;'>상품 상세</span></div>
			<div class='each_detail_menutwo'><span style='border-bottom:  2px solid #FFBB9A;'>상품 후기</span></div>					
		</div>

		<div class = 'each_detail_infor'>
			<div class = 'each_detail_maindiv'>
				<h1>상품표기정보</h1>
				<div class = 'each_table'>
					<table>
						<tr>
							<td style='background-color:#e4e4e4; '>품명 및(모델명)</td>
							<td>${dto.product_k_name}</td> <!-- Product_name -->
						</tr>
						<tr>
							<td style='background-color:#e4e4e4;'>제조국</td>
							<td>한국</td>
							<td style='background-color:#e4e4e4;'>수입신고 문구 여부</td>
							<td>해당사항 없음</td>
						</tr>
						<tr>
							<td style='background-color:#e4e4e4;'>품질보증기준</td>
							<td>관련 법 및 소비자분쟁해결 규정에 따름</td>
							<td style='background-color:#e4e4e4;'>소비자 상담 관련 전화번호</td>
							<td>우아한형님들(환민상회), 0000-1234</td>
						</tr>
					</table>
				</div>
				<div class = 'each_text_tmi'>※ 월, 화요일은 출고량이 많아 당일 발송이 지연될 수 있습니다.</div>
				
				<div class = 'each_detail_image'>
					<div class='each_detail_pdname'>${dto.product_detail}</div> <!-- Product_name -->
					<div><img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_1.png" class='eachImgSize'/></div>		
					<div><img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_2.png" class='eachImgSize'/></div>		
					<div><img src = "resources/img/ceoProductPic/${dto.ceo_number}_${dto.product_number}_3.png" class='eachImgSize'/></div>		
				</div>
					
				<div class = 'each_detail_text_div'>
					<span class= 'each_title'>배송 안내</span>
					<div class = 'each_detail_line'></div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>배민상회 상품 배송은 택배 또는 든든배송으로 진행됩니다.</li>
							<li>기본 배송비는 주문당 3,000원입니다.(3만원 이상 주문 시 무료배송)단, 상품별 배송비가 따로 부과된 경우에는</li>
							<li>기본 배송비와 관계없이 상품별 배송비가 부과되며 상세페이지에서 확인가능합니다(제주 및 도서 산간 지역은 기본 배송비 외 3,000원의 추가 배송비가 발생합니다.)</li>
							<li> 택배사는 CJ대한통운/한진택배/롯데택배 등 상품에 따라 나뉘어 배송되고 있습니다.</li>
							<li> 택배배송의 경우 영업일 기준 15시까지 결제완료 시 당일 출고됩니다. (주말 또는 공휴일 전일 15시 이후 결제 시 다음 영업일에 출고/일부 품목 제외)</li>
							<li> 든든배송의 경우 상품별 주문마감시간이 상이하오니 자세한 사항은 상세페이지를 참고 부탁드립니다.</li>
							<li> 단, 상품명 또는 상품의 상세 정보를 통해 별도의 배송 안내 가 고지된 경우, 개별 상품의 출고마감 시간과 배송일정이 적용됩니다.</li>
							<li> 배송은 출고일부터 영업일 기준 평균 1~4 영업일 정도 소요됩니다. (제주 및 도서 산간 지역 제외)</li>
							<li> 배송작업 중 상품훼손, 재고 부족 등의 사유로 출고지연이 발생할 경우 고객센터를 통한 별도의 안내를 진행하고 있습니다.</li>
							<li> 상품의 배송 준비가 시작된 이후부터는 주문 취소가 불가하며, 상품 수령 후 교환/반품 신청이 가능합니다.</li>
						</ul>
					</div>
				</div>
					
				<div class = 'each_detail_text_div'>
					<span class= 'each_title'>교환/반품안내</span>
					<div class = 'each_detail_line'></div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>상품의 교환/반품 신청은 배민상회 고객센터(0000-1234또는 1:1 문의)를 통해 신청이 가능합니다.</li>
							<li>자세한 내용은 [배송/교환/반품/취소/환불 규정] 전문을 참고해주세요.</li>
						</ul>
					</div>
					<div class='each_litle_title'>교환 및 반품 가능 기간</div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>상품 수령일로부터 7일 내 교환 및 반품 신청이 가능합니다.</li>
							<li>상품의 불량, 오배송 및 상품 표시 정보의 오류 등의 사유로 교환/반품이 필요한 경우에는 상품 수령일로부터 3개월 내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 내 교환/반품 신청이 가능합니다.</li>
							<li>회수 시에는 받으신 박스 그대로 보내주셔야 원활한 처리가 가능합니다. (분할 포장 및 합포장 불가)</li>
							<li>단, 상품을 사용하셨거나 고객의 책임 있는 사유로 상품이 멸실 또는 훼손되거나 상품의 가치가 상실된 경우 교환 및 반품이 불가합니다.</li>
						</ul>
					</div>
					<div class='each_litle_title'>받으신 상품에 문제가 있는 경우</div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>상품의 불량, 오배송, 상품 표시 정보의 오류 등 판매자 과실로 인한 교환/반품은 무료입니다.</li>
							<li>상품의 불량, 오배송 등으로 교환을 진행하는 경우에는 동일 상품으로만 교환이 가능합니다.</li>
							<li>입수량 부족의 경우 상품 불량이 아님으로, 수령 후 14일 내로 요청 주셔야 부족분에 대해 대응이 가능합니다.</li>
							<li>상품별 사이즈는 측정 부위와 방식에 따라 0.5~1cm 정도 오차가 발생할 수 있으므로 상품 불량의 사유가 되지 않습니다.</li>
							<li>상품의 하자가 아닌 개인의 기호에 따른 불편사항은 불량 사유에 해당되지 않습니다. ex) '상품이 약하다, 맛이 없다, 질기다' 등 개인의 기호에 근거한 판단으로 인한 상품의 교환/반품은 불가합니다.</li>
						</ul>
					</div>
					<div class='each_litle_title'>고객 단순 변심의 경우</div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>고객의 단순 변심으로 인한 교환/반품 시 반품 배송비는 박스 당 3,000원, 낱개단위 품목당 3,000원입니다. (제주 및 도서 산간 지역은 기본 배송비 외 3,000원의 추가 배송비가 발생합니다.)</li>
							<li>취소 금액을 제외한 주문 금액이 3만원 미만일 경우 최초 주문시 면제된 기본 배송비와 반품 배송비가 함께 발생합니다.</li>
							<li>단, 농/수/축산물/냉동/냉장 상품은 재판매가 불가함으로 단순 변심 반품이 어려운 점 양해 부탁드립니다.</li>
						</ul>
					</div>
				</div>
						
				<div class = 'each_detail_text_div'>	
					<span class= 'each_title'>환불안내</span>
					<div class = 'each_detail_line'></div>
					<div class = 'each_detail_text_write'>
						<ul>
							<li>환불은 증빙자료 및 상품의 회수 및 검수 후 진행됩니다.</li>
							<li>환불은 결제하신 수단만으로 환불이 가능합니다.</li>
							<li> 환불 소요 기간은 상품 회수 완료된 날로부터 3영업일 내 계좌입금 또는 카드취소가 진행됩니다.</li>
						</ul>
					</div>
					<div class='each_litle_title'>미성년자 관련 주의사항</div>
					<div class = 'each_detail_text_write'>
						<ul><li>미성년자가 법정 대리인의 동의 없이 구매한 경우, 미성년자 본인 또는 법정 대리인은 구매를 취소할 수 있습니다.</li></ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 리뷰페이지-->
		<div class = 'each_review_main'>
			<div class='each_review_main_top_side'>
				<button class = 'each_review_write'>후기작성하기</button>
		 		<select class='each_review_ratingLOD'>
		 			<option selected>최신순</option>
		 			<option>평점 높은순</option>
		 			<option>평점 낮은순</option>
				</select>
			</div>
			
			<c:if test="${not empty list}">
			<div class= 'each_review_maindiv'>
				<c:forEach var="m" items="${list}" varStatus="status">
					<div class = 'each_review_div'>
						<div class='each_review_name'>${m.customer_id} <span class='each_review_date'>${m.review_date}</span></div> 
			   			<c:forEach var="abc" begin="1" end="${m.rating}" step="1">
			   				<img src ='resources/img/example/blackstar.png' style = "width:17px; height:17px;"/>
						</c:forEach>
						<div class='each_review_content'>${m.customer_content}</div>
						<!-- <div class ='each_review_manager'>
							<div class = 'each_review_dap'>답변</div><span>2021.07.25</span>
							<div class = 'each_review_managerwrite'>
								관리자 답변란
							</div>
						</div> -->
					</div>
				</c:forEach>
				<div class = 'each_review_pagingdiv'>
					<button class = 'each_review_pagenumber'>1</button>
					<button class = 'each_review_pagenumber'>2</button>
					<button class = 'each_review_pagenumber'>3</button>
					<button class = 'each_review_pagenumber'>4</button>
					<button class = 'each_review_pagenumber'>5</button>
				</div>
			</div>
			</c:if>
		</div>
		
	</div>	<!-- end of eachmainpage -->	
	<%@ include file= "customer_footer.jsp" %>
	
</body>
</html>