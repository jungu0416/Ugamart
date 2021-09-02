package com.jg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jg.dao.CeoDao;
import com.jg.dto.CeoEachOrderDto;
import com.jg.dto.CeoOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;

@Service
public class CeoServiceImpl implements CeoService{
	@Autowired
	CeoDao dao;
	
	@Override //사장 회원가입
	public int register(String ceo_id, String ceo_pw, String ceo_store_name, String ceo_phone, String ceo_address) {
		return dao.register(ceo_id, ceo_pw, ceo_store_name, ceo_phone, ceo_address);
	}

	@Override //사장 로그인
	public String login(String id, String pw) {
		return dao.login(id, pw);
	}

	@Override
	public String orderAmount(String ceo_number) {
		return dao.orderAmount(ceo_number);
	}

	@Override
	public int priceAmount(String ceo_number) {
		return dao.priceAmount(ceo_number);
	}

	@Override
	public int deliveryAmount(String ceo_number, int delivery_whether) {
		return dao.deliveryAmount(ceo_number, delivery_whether);
	}

	@Override
	public int registerProduct(CeoRegisterProductDto dto) {
		return dao.registerProduct(dto);
	}

	@Override
	public List<CeoProductDto> searchProductByName(String ceo_number, String product_k_name) {
		return dao.searchProductByName(ceo_number, product_k_name);
	}

	@Override
	public List<CeoProductDto> searchProductByNumber(String ceo_number, String product_number) {
		return dao.searchProductByNumber(ceo_number, product_number);
	}

	@Override
	public List<CeoEachOrderDto> orderEachListByCustomerID(String ceo_number, String customer_id) {
		List<CeoOrderDto> orderDto = dao.orderListByCustomerID(ceo_number, customer_id);
		List<CeoEachOrderDto> list = new ArrayList<>();
		
		for(CeoOrderDto dto : orderDto) {
			String[] arr = dto.getProduct_number_amount().split("_");
			
			if(arr.length>2) {
				for(int i=0; i<=arr.length-1; i=i+2) {
					CeoEachOrderDto eachDto = new CeoEachOrderDto();

					eachDto.setOrder_number(dto.getOrder_number());
					eachDto.setCustomer_id(dto.getCustomer_id());
					eachDto.setProduct_number(arr[i]);
					eachDto.setAmount(arr[i+1]);
					eachDto.setOrder_date(dto.getOrder_date());
					eachDto.setRequired_address(dto.getRequired_address());
					eachDto.setDelivery_whether(dto.getDelivery_whether());
					eachDto.setPrice(dao.getEachProductPrice(ceo_number, arr[i]));
					eachDto.setProduct_k_name(dao.getProductName(ceo_number, arr[i]));
					
					list.add(eachDto);
				}
			}else {
				CeoEachOrderDto eachDto = new CeoEachOrderDto();
				
				eachDto.setOrder_number(dto.getOrder_number());
				eachDto.setCustomer_id(dto.getCustomer_id());
				eachDto.setProduct_number(arr[0]);
				eachDto.setAmount(arr[1]);
				eachDto.setPrice(dto.getTotal_price());
				eachDto.setOrder_date(dto.getOrder_date());
				eachDto.setRequired_address(dto.getRequired_address());
				eachDto.setDelivery_whether(dto.getDelivery_whether());
				eachDto.setProduct_k_name(dao.getProductName(ceo_number, arr[0]));

				list.add(eachDto);
			}
		}
		return list;
	}

	@Override
	public List<CeoReviewDto> reviewList(String ceo_number) {
		return dao.reviewList(ceo_number);
	}

}
