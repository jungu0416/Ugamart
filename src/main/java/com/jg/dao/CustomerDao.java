package com.jg.dao;

import java.util.List;
import java.util.Map;

import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;

public interface CustomerDao {
	//소비자 메인페이지 화면 노출부분
	List<CustomerStoreDto> showAllStore();
	//소비자 로그인 액션
	int checkLogin(String id, String pw);
	//소비자 회원가입 액션
	int registerAction(CustomerDto dto);
	//마이페이지 메인
	CustomerDto myPage(String id);
	//마이페이지 회원탈퇴
	int dropMember(String id);
	//마이페이지 비번 변경
	int changePW(String id,String pw);
	//마이페이지 주문목록
	List<CustomerOrderDto> orderList(String id);
	//해당 상품 이름 가져오기
	String getProductName(String ceo_number, String product_number);
	//해당 상품 가격 가져오기
	String getProductPrice(String ceo_number, String product_number);
	//마이페이지 리뷰
	List<CustomerReviewDto> getReviewList(String id);
	//마이페이지 폰번호 바꾸기
	int modifyPhone(String customer_id , String customer_phone);
	//마이페이지 이메일 바꾸기
	int modifyEmail(String customer_id, String customer_email);
	
	//사용자의 주소 구해오기
	String getAddress(String customer_id);
	//사용자가 제품 구매함
	int buyProduct(String id,String product_number_amount,String ceo_number, String price,String required_address);
	//사용자가 리뷰를 수정
	int modifyReview(String order_number,String customer_id , String customer_content);
	//사용자가 리뷰를 삭제
	int deleteReview(String customer_id,String order_number);
	//사용자가 이제품을 구매했었는지 확인
	int checkOrder(String customer_id, String ceo_number, String product_number);
	//리뷰쓸떄 등록할 오더넘버를 구하는 메서드
	List<Integer> getOrderNumber(String customer_id,String ceo_number, String product_number);
	//구한 오더넘버가 이미 리뷰에 등록되어있는지 아닌지확인
	Map<String,Integer> checkReview(List<Integer> order_number);
	//리뷰작성
	int writeReview(String customer_id, int order_number,String product_number,String ceo_number,String customer_content,String rating);
}
