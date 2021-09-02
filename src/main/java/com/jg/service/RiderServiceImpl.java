package com.jg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jg.dao.RiderDao;
import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;
import com.jg.dto.RiderOrderDto;

@Service
public class RiderServiceImpl implements RiderService {
	@Autowired
	RiderDao dao;
	
	@Override
	public int loginAction(String id, String pw) {
		return dao.loginAction(id, pw);
	}

	@Override
	public List<RiderEachOrderDto> orderList() {
		return dao.orderList();
	}

	@Override
	public int registerAction(RiderDto dto) {
		return dao.registerAction(dto);
	}

	@Override
	public int pickOrder(String rider_id, String order_number) {
		int result = dao.insertIntoRiderDelivery(rider_id, order_number);
		
		if(result == 1) {result = dao.updateOrderList(order_number);}
		else {result = -1;}
		
		return result;
	}

	@Override
	public List<RiderEachOrderDto> riderDeliveryList(String rider_id) {

		List<RiderEachOrderDto> riderEachOrderDto = new ArrayList<>();
		List<RiderOrderDto> list = new ArrayList<>();
		List<String> orderNumberList = dao.riderOrderNumber(rider_id);
		
		for(String s : orderNumberList) {
			RiderOrderDto riderOrderDto = dao.riderDeliveryList(s);
			list.add(riderOrderDto);
		}
		
		for(RiderOrderDto dto : list) {
			RiderEachOrderDto each = new RiderEachOrderDto();
			String[] arr;
			if(dto!=null) {
				arr = dto.getProduct_number_amount().split("_");
			}else {
				return null;
			}
			each.setOrder_number(dto.getOrder_number());
			each.setCustomer_id(dto.getCustomer_id());
			each.setProduct_number(arr[0]);
			each.setProduct_amount(arr[1]);
			each.setProduct_k_name(dao.findProductName(dto.getCeo_number(), arr[1]));
			each.setCeo_number(dto.getCeo_number());
			each.setOrder_date(dto.getOrder_date());
			each.setTotal_price(dto.getTotal_price());
			each.setRequired_address(dto.getRequired_address());
			each.setDelivery_whether(dto.getDelivery_whether());
			each.setCeo_store_name(dao.findCeoStoreName(dto.getCeo_number()));
			each.setCeo_address(dao.findCeoAddress(dto.getCeo_number()));
			
			riderEachOrderDto.add(each);
		}
		
		return riderEachOrderDto;
	}

	@Override
	public int updateDelivery(String order_number) {
		return dao.updateDelivery(order_number);
	}

	@Override
	public int deliveryDone(String order_number) {
		return dao.deliveryDone(order_number);
	}

	@Override
	public List<RiderEachOrderDto> deliveryDoneList(String rider_id) {
		List<RiderEachOrderDto> riderEachOrderDto = new ArrayList<>();
		List<RiderOrderDto> list = new ArrayList<>();
		List<String> orderNumberList = dao.riderOrderNumber(rider_id);
		
		for(String s : orderNumberList) {
			RiderOrderDto riderOrderDto = dao.riderDeliveryDoneList(s);
			list.add(riderOrderDto);
		}
		
		for(RiderOrderDto dto : list) {
			RiderEachOrderDto each = new RiderEachOrderDto();
			String[] arr;
			if(dto!=null) {
				arr = dto.getProduct_number_amount().split("_");
			}else {
				return null;
			}
			
			each.setOrder_number(dto.getOrder_number());
			each.setCustomer_id(dto.getCustomer_id());
			each.setProduct_number(arr[0]);
			each.setProduct_amount(arr[1]);
			each.setProduct_k_name(dao.findProductName(dto.getCeo_number(), arr[1]));
			each.setCeo_number(dto.getCeo_number());
			each.setOrder_date(dto.getOrder_date());
			each.setTotal_price(dto.getTotal_price());
			each.setRequired_address(dto.getRequired_address());
			each.setDelivery_whether(dto.getDelivery_whether());
			each.setCeo_store_name(dao.findCeoStoreName(dto.getCeo_number()));
			each.setCeo_address(dao.findCeoAddress(dto.getCeo_number()));
			
			riderEachOrderDto.add(each);
		}
		
		return riderEachOrderDto;
	}

}
