package com.jg.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jg.service.CustomerService;

@RestController
@RequestMapping(value="/ajax" , produces ="application/json; charset=utf-8")
public class Uga_RestController {
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value="/buyProduct")
	public int buyProduct(@RequestBody Map<String,String> param) {
		String id = param.get("id");
		String ceo_number = param.get("ceo_number");
		String product_number = param.get("product_number");
		String amount = param.get("amount");
		String price = param.get("price");
		price = price.replace(",", "");
		String product_number_amount = product_number + "_" + amount;
		
		int result = customerService.buyProduct(id, product_number_amount, ceo_number, price);
		
		return result;
	}
	
	@RequestMapping(value="/modifyReview")
	public int modifyReview(@RequestBody Map<String,String> param) {
		String customer_id = param.get("customer_id");
		String customer_content = param.get("customer_content");
		String order_number = param.get("order_number");
		
		int result = customerService.modifyReview(order_number, customer_id, customer_content);
		return result;
	}
	
	@RequestMapping(value="/deleteReview")
	public int deleteReview(@RequestBody Map<String,String> param) {
		String customer_id = param.get("customer_id");
		String order_number = param.get("order_number");
		
		int result = customerService.deleteReview(customer_id, order_number);
		return result;
	}
	
	@RequestMapping("/checkReview")
	public int checkReview(@RequestBody Map<String,String> param) {
		String customer_id = param.get("customer_id");
		String ceo_number = param.get("ceo_number");
		String product_number = param.get("product_number");
		
		int result = customerService.checkOrder(customer_id, ceo_number, product_number);
		
		return result;
	}
	
	
	
	
	
}
