package com.jg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jg.dao.ProductDao;
import com.jg.dto.ProductByCategoryDto;
import com.jg.dto.ProductDto;
import com.jg.dto.ProductReviewDto;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	
	@Override
	public ProductDto eachProduct(String ceo_number, String product_number) {
		return dao.eachProduct(ceo_number, product_number);
	}


	@Override
	public List<ProductReviewDto> productReview(String ceo_number, String product_number) {
		return dao.getReview(ceo_number, product_number);
	}


	@Override
	public List<ProductByCategoryDto> productByCategory(String category) {
		return dao.productByCategory(category);
	}


	@Override
	public Map<String, String> findAddress(String customer_id, String ceo_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		if(customer_id == null) { customer_id = "null";}
		
		String customer_address = dao.findAddress(customer_id);
		if(customer_address == null) {customer_address = "서울 중구 세종대로 110";}
		
		map1.put("customer_address", customer_address);
		map1.put("ceo_address", dao.findCeoAddress(ceo_number));
		
		return map1;
	}
	
}
