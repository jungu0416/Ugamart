package com.jg.service;

import java.util.List;

import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;

public interface RiderService {
	//라이더 로그인 액션
	int loginAction(String id, String pw);
	//라이더 주문보기 
	List<RiderEachOrderDto> orderList();
	//라이더 회원가입
	int registerAction(RiderDto dto);
	//라이더가 주문접수하는것
	int pickOrder(String rider_id,String order_number);
	//라이더가 배달중인 리스트들
	List<RiderEachOrderDto> riderDeliveryList(String rider_id);
	//라이더 픽업완료 버튼
	int updateDelivery(String order_number);
	//라이더 배달완료 버튼
	int deliveryDone(String order_number);
	//배달완료된 리스트
	List<RiderEachOrderDto> deliveryDoneList(String rider_id);

}
