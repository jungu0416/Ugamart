package com.jg.serviceTest;


import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dto.CeoEachOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;
import com.jg.service.CeoService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CeoServiceTest {
	@Autowired
	CeoService service;
	
	@Test
	public void registerTest() {
		service.register("아이디1", "비번1", "상점이름1", "폰번호1", "주소1");
	}

	@Test
	public void loginTest() {
		String ceo_number = service.login("admin", "admin");
		System.out.println(ceo_number);
	}

	@Test
	public void orderAmountTest() {
		String ceo_number = service.orderAmount("9999");
		System.out.println(ceo_number);
	}

	@Test
	public void priceAmountTest() {
		int priceAmount = service.priceAmount("9999");
		System.out.println(priceAmount);
	}
	
	@Test
	public void deliveryAmount() {
		int deliveryAmount = service.deliveryAmount("9999", 0);
		System.out.println(deliveryAmount);
	}
	
	@Test
	public void registerProduct() {
		int registerProduct = service.registerProduct(new CeoRegisterProductDto("2","2","2","2","2","2","2"));
		System.out.println(registerProduct);
	}
	
	@Test
	public void searchProductByName() {
		List<CeoProductDto> list = new ArrayList<>();
		list = service.searchProductByName("9999", "음료수다");
		for(CeoProductDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void searchProductByNumber() {
		List<CeoProductDto> list = new ArrayList<>();
		list = service.searchProductByNumber("9999", "10042");
		for(CeoProductDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void OrderListByCustomerID() {
		List<CeoEachOrderDto> list = service.orderEachListByCustomerID("9999", "jungu0416");
		for(CeoEachOrderDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void reivewList() {
		List<CeoReviewDto> list = new ArrayList<>();
		list = service.reviewList("9999");
		for(CeoReviewDto dto : list) System.out.println(dto);
	}
	
	
}
	
