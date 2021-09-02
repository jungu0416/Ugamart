package com.jg.daoTest;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dao.CustomerDao;
import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerDaoTest {
	@Autowired
	CustomerDao dao;
	
	@Test
	public void showStore() {
		List<CustomerStoreDto> list = dao.showAllStore();
		for(CustomerStoreDto store : list) System.out.println(store);
	}
	
	@Test
	public void loginAction() {
		int result=dao.checkLogin("jungu", "0000");
		System.out.println(result);
	}
	
	@Test
	public void registerAction() {
		int result = dao.registerAction(new CustomerDto("아이디1","비밀번호1","이름1","폰번호1","주소1","이메일1"));
		System.out.println(result);
	}
	
	@Test
	public void myPage() {
		CustomerDto dto = dao.myPage("jungu");
		System.out.println(dto);
	}
	
	@Test
	public void dropMember() {
		int result = dao.dropMember("2");
		System.out.println(result);
	}
	
	@Test
	public void changePW() {
		int result = dao.changePW("jungu", "222");
		System.out.println(result);
	}
	
	@Test
	public void orderList() {
		List<CustomerOrderDto> list = dao.orderList("jungu");
		for(CustomerOrderDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void getProductNumber() {
		String str = dao.getProductName("9999", "1001");
		System.out.println(str);
	}
	
	@Test
	public void getProductPrice() {
		String price = dao.getProductPrice("9999", "1001");
		System.out.println(price);
	}
	
	@Test
	public void getReivewList() {
		List<CustomerReviewDto> list = dao.getReviewList("jungu");
		for(CustomerReviewDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void modifyPhone() {
		int result = dao.modifyPhone("jungu", "11");
		System.out.println(result);
	}
	
	@Test
	public void modifyEmail() {
		int result = dao.modifyEmail("jungu", "abab");
		System.out.println(result);
	}
	
	@Test
	public void getAddress() {
		String address = dao.getAddress("jungu");
		System.out.println(address);
	}
	
	@Test
	public void buyProduct() {
		int result = dao.buyProduct("jungu", "1019_4", "9899", "4000","서울");
		System.out.println(result);
	}
	
	
	@Test
	public void modifyReview() {
		int result = dao.modifyReview("1", "jungu", "수저어어엉");
		System.out.println(result);
	}
	
	@Test
	public void deleteReview() {
		int result = dao.deleteReview("1", "2");
		System.out.println(result);
	}
	
	@Test
	public void checkOrder() {
		int result = dao.checkOrder("jungu", "9999", "1001");
		System.out.println(result);
	}
	
	@Test
	public void getOrderNumber() {
		List<Integer> result = dao.getOrderNumber("jungu", "9999", "1001");
		for(Integer a : result) System.out.println(a);
	}
	
	@Test
	public void checkReview() {
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		
		Map<String,Integer> map1 = dao.checkReview(list);
		
		System.out.println("result : " + map1.get("result"));
		System.out.println("getOrderNumber : " + map1.get("getOrderNumber"));
	}
	
	@Test
	public void writeReview() {
		int result = dao.writeReview("jungu", 2, "1001", "9999", "리뷰우", "4");
		System.out.println(result);
	}
	
}
