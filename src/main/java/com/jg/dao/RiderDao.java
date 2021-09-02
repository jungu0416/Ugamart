package com.jg.dao;

import java.util.List;

import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;
import com.jg.dto.RiderOrderDto;

public interface RiderDao {
	//라이더 로그인 액션
	int loginAction(String id,String pw);
	//라이더 주문목록 리스트 // 물품이름 - 상점이름 구하기
	List<RiderEachOrderDto> orderList();
	//라이더 회원가입
	int registerAction(RiderDto dto);
	//라이더 딜리버리 리스트에 넣기
	int insertIntoRiderDelivery(String rider_id,String order_number);
	//소비자 오더리스트에 배송중이라고 update해주기
	int updateOrderList(String order_number);
	//해당 라이더 주문 넘버 찾기
	List<String> riderOrderNumber(String rider_id);
	//라이더의 배달중인 사항 리스트들
	RiderOrderDto riderDeliveryList(String order_number);
	//라이더 [제품명 찾기]
	String findProductName(String ceo_number,String product_number);
	//라이더 [스토어명 찾기]
	String findCeoStoreName(String ceo_number);
	//라이더 [사업자 주소 찾기]
	String findCeoAddress(String ceo_number);
	//라이더 픽업완료 버튼
	int updateDelivery(String order_number);
	//라이더 배달완료 버튼
	int deliveryDone(String order_number);
	//라이더 배달완료한 리스트
	RiderOrderDto riderDeliveryDoneList(String order_number);
	
}
