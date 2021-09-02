package com.jg.daoTest;


import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dao.CeoDao;
import com.jg.dto.CeoOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CeoDaoTest {
	@Autowired
	CeoDao dao;
	
	@Test
	public void registerTest() {
		int result = dao.register("아이디1", "비밀번호1", "상점이름1", "핸드폰번호1", "주소1");
		System.out.println(result);
	}
	
	@Test
	public void loginTest() {
		String ceo_number = dao.login("admin", "admin");
		System.out.println(ceo_number);
	}

	@Test
	public void orderAmount() {
		String orderAmount = dao.orderAmount("9999");
		System.out.println(orderAmount);
	}

	@Test
	public void priceAmount() {
		int priceAmount = dao.priceAmount("9999");
		System.out.println(priceAmount);
	}
	
	@Test
	public void deliveryAmount() {
		int deliveryAmount = dao.deliveryAmount("9999",2);
		System.out.println(deliveryAmount);
	}

	@Test
	public void registerProduct() {
		int registerProduct = dao.registerProduct(new CeoRegisterProductDto("1","1","1","1","1","1","1"));
		System.out.println(registerProduct);
	}
	
	@Test
	public void searchProductByName() {
		List<CeoProductDto> list = new ArrayList<>();
		list = dao.searchProductByName("9999", "음료수다");
		for(CeoProductDto dto : list) {System.out.println(dto);}
	}
	
	@Test
	public void searchProductByNumber() {
		List<CeoProductDto> list = new ArrayList<>();
		list = dao.searchProductByNumber("9999", "10042");
		for(CeoProductDto dto : list) {System.out.println(dto);}
	}
	
	@Test
	public void orderListByCustomerID() {
		List<CeoOrderDto> list = new ArrayList<>();
		list = dao.orderListByCustomerID("9999", "jungu0416");
		for(CeoOrderDto dto : list) System.out.println(dto);
	}

	@Test
	public void getEachProductPrice() {
		String result = dao.getEachProductPrice("9999", "1001");
		System.out.println(result);
	}
	
	@Test
	public void getEachProductName() {
		String result = dao.getProductName("9999", "1001");
		System.out.println(result);
	}
	
	@Test
	public void reviewList() {
		List<CeoReviewDto> list = new ArrayList<>();
		list = dao.reviewList("9999");
		for(CeoReviewDto dto : list) System.out.println(dto);
		
	}
	
	
}
