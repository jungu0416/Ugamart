package com.jg.service;

import java.util.List;

import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerEachOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;

public interface CustomerService {
	//메인페이지 상품 보여주기
	List<CustomerStoreDto> showAllStore();
	//소비자 로그인 체크
	int checkLogin(String id,String pw);
	//소비자 회원가입 액션
	int registerAction(CustomerDto dto);
	//마이페이지 메인
	CustomerDto myPage(String id);
	//마이페이지 회원탈퇴
	int dropMember(String id);
	//마이페이지 비번변경
	int changPW(String id,String pw);
	//마이페이지 주문목록
	List<CustomerEachOrderDto> getOrderList(String id);
	//마이페이지 리뷰
	List<CustomerReviewDto> getReviewList(String id);
	//마이페이지 폰번호변경
	int modifyPhone(String id, String phone);
	//마이페이지 이메일변경
	int modifyEmail(String id,String email);
	
	//사용자의 주소구하기
	String getAddress(String customer_id);
	//사용자가 물품구매
	int buyProduct(String id, String product_number_amount, String ceo_number, String price);
	//사용자가 리뷰를 수정
	int modifyReview(String order_number, String customer_id, String customer_content);
	//사용자가 리뷰를 삭제
	int deleteReview(String customer_id, String order_number);
	//사용자가 이제품을 구매 했었는지 확인
	int checkOrder(String customer_id, String ceo_number, String product_number);
	
	//사용자가 리뷰를 작성하기 눌렀고 그때 리뷰가 이미 작성되어있는지 아닌지 확인하고 작성.
	int writeReview(String customer_id,String ceo_number,String product_number,String rating,String customer_content);
	
	
	
}
