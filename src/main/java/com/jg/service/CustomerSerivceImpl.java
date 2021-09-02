package com.jg.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jg.dao.CustomerDao;
import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerEachOrderDto;
import com.jg.dto.CustomerOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;

@Service
public class CustomerSerivceImpl implements CustomerService{
	@Autowired
	CustomerDao dao;
	
	@Override
	public List<CustomerStoreDto> showAllStore() {
		return dao.showAllStore();
	}

	@Override
	public int checkLogin(String id, String pw) {
		return dao.checkLogin(id, pw);
	}

	@Override
	public int registerAction(CustomerDto dto) {
		return dao.registerAction(dto);
	}

	@Override
	public CustomerDto myPage(String id) {
		return dao.myPage(id);
	}

	@Override
	public int dropMember(String id) {
		return dao.dropMember(id);
	}

	@Override
	public int changPW(String id, String pw) {
		return dao.changePW(id, pw);
	}

	@Override
	public List<CustomerEachOrderDto> getOrderList(String id) {
		List<CustomerOrderDto> orderDto = dao.orderList(id);
		List<CustomerEachOrderDto> list = new ArrayList<>();
		
		for(CustomerOrderDto dto : orderDto) {
			String[] arr = dto.getProduct_number_amount().split("_");
			
			if(arr.length>2) {
				for(int i=0; i<=arr.length-1; i=i+2) {
					CustomerEachOrderDto eachDto = new CustomerEachOrderDto();

					eachDto.setOrder_number(dto.getOrder_number());
					eachDto.setCustomer_id(dto.getCustomer_id());
					eachDto.setProduct_number(arr[i]);
					eachDto.setAmount(arr[i+1]);
					eachDto.setOrder_date(dto.getOrder_date());
					eachDto.setRequired_address(dto.getRequired_address());
					eachDto.setDelivery_whether(dto.getDelivery_whether());
					eachDto.setPrice(dao.getProductPrice(dto.getCeo_number(), arr[i]));
					eachDto.setProduct_k_name(dao.getProductName(dto.getCeo_number(), arr[i]));
					eachDto.setCeo_number(dto.getCeo_number());
					
					list.add(eachDto);
				}
			}else {
				CustomerEachOrderDto eachDto = new CustomerEachOrderDto();
				
				eachDto.setOrder_number(dto.getOrder_number());
				eachDto.setCustomer_id(dto.getCustomer_id());
				eachDto.setProduct_number(arr[0]);
				eachDto.setAmount(arr[1]);
				eachDto.setPrice(dto.getTotal_price());
				eachDto.setOrder_date(dto.getOrder_date());
				eachDto.setRequired_address(dto.getRequired_address());
				eachDto.setDelivery_whether(dto.getDelivery_whether());
				eachDto.setProduct_k_name(dao.getProductName(dto.getCeo_number(), arr[0]));
				eachDto.setCeo_number(dto.getCeo_number());

				list.add(eachDto);
			}
		}
		
		return list;
	}

	@Override
	public List<CustomerReviewDto> getReviewList(String id) {
		return dao.getReviewList(id);
	}

	@Override
	public int modifyPhone(String id, String phone) {
		return dao.modifyPhone(id, phone);
	}

	@Override
	public int modifyEmail(String id, String email) {
		return dao.modifyEmail(id, email);
	}

	@Override
	public String getAddress(String customer_id) {
		return dao.getAddress(customer_id);
	}

	@Override
	public int buyProduct(String id, String product_number_amount, String ceo_number, String price) {
		
		String required_address = dao.getAddress(id);
		
		return dao.buyProduct(id, product_number_amount, ceo_number, price, required_address);
	}

	@Override
	public int modifyReview(String order_number, String customer_id, String customer_content) {
		return dao.modifyReview(order_number, customer_id, customer_content);
	}

	@Override
	public int deleteReview(String customer_id, String order_number) {
		return dao.deleteReview(customer_id, order_number);
	}

	@Override
	public int checkOrder(String customer_id, String ceo_number, String product_number) {
		return dao.checkOrder(customer_id, ceo_number, product_number);
	}

	@Override
	public int writeReview(String customer_id, String ceo_number, String product_number,String rating,String customer_content) {
		List<Integer> orderNumberList = dao.getOrderNumber(customer_id, ceo_number, product_number);
		Map<String,Integer> checkReview = dao.checkReview(orderNumberList);
		
		if(checkReview.get("result") == 1) {
			return 0;
		}else {
			int order_number = checkReview.get("getOrderNumber");
			
			int result = dao.writeReview(customer_id, order_number, product_number, ceo_number, customer_content, rating);
			return result;
		}
		
	}

}
