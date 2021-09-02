package com.jg.dao;

import java.util.List;

import com.jg.dto.CeoOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;

public interface CeoDao {
	//사장 회원가입
	int register(String ceo_id,String ceo_pw, String ceo_store_name,String ceo_phone, String ceo_address);
	//사장 로그인
	String login(String ceo_id,String ceo_pw);
	//사장 메인페이지 총 주문건수
	String orderAmount(String ceo_number);
	//사장 메인페이지 총 가격
	int priceAmount(String ceo_number);
	//사장 메인페이지 배송준비중/배송중/배송완료
	int deliveryAmount(String ceo_number,int delivery_whether);
	//사장 상품 등록 페이지
	int registerProduct(CeoRegisterProductDto dto);
	//사장 제품 찾기 이름으로
	List<CeoProductDto> searchProductByName(String ceo_number,String product_k_name);
	//사장 제품 찾기 번호로
	List<CeoProductDto> searchProductByNumber(String ceo_number,String product_number);
	//사장 제품 목록 소비자아이디별
	List<CeoOrderDto> orderListByCustomerID(String ceo_number,String customer_id);
	//사장 제품 한개의 가격 구하는거
	String getEachProductPrice(String ceo_number, String product_number);
	//사장 제품 이름 구하기
	String getProductName(String ceo_number, String product_number);
	//사장 리뷰 목록 보여주기
	List<CeoReviewDto> reviewList(String ceo_number);
	
	
}
