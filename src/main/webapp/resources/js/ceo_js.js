$(function(){
	//[메인페이지] 사업자 페이지 메뉴바 슬라이드
	$(".ceo_main_bar_list").click(function(){
		var sib_display = $(this).siblings(".ceo_main_bar_list_detail").css("display");
		if(sib_display == "none"){
			$(this).siblings(".ceo_main_bar_list_detail").show();
		}else{
			$(this).siblings(".ceo_main_bar_list_detail").hide();
		}
	});
	
	
	
	
	
	
	
	
});