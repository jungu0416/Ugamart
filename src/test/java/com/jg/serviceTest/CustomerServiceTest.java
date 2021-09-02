package com.jg.serviceTest;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerEachOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;
import com.jg.service.CustomerService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerServiceTest {
	@Autowired
	CustomerService service;
	
	@Test
	public void showAllStore() {
		List<CustomerStoreDto> list = service.showAllStore();
		for(CustomerStoreDto store : list) System.out.println(store);
	}
	
	@Test
	public void checkLogin() {
		int result = service.checkLogin("jungu", "0000");
		System.out.println(result);
	}
	
	@Test
	public void registerAction() {
		int result = service.registerAction(new CustomerDto("아이디","비밀번호","이름","폰번호","주소","이메일"));
		System.out.println(result);
	}
	
	@Test
	public void myPage() {
		CustomerDto dto = service.myPage("jungu");
		System.out.println(dto);
	}
	
	@Test
	public void dropMember() {
		int result = service.dropMember("아이디1");
		System.out.println(result);
	}

	@Test
	public void changePW() {
		int result = service.changPW("jungu", "0000");
		System.out.println(result);
	}
	
	@Test
	public void getOrderList() {
		List<CustomerEachOrderDto> list = service.getOrderList("jungu");
		for(CustomerEachOrderDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void getReivewList() {
		List<CustomerReviewDto> list = service.getReviewList("jungu");
		for(CustomerReviewDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void modifyPhone() {
		int result = service.modifyPhone("jungu", "01071647233");
		System.out.println(result);
	}
	
	@Test
	public void modifyEmail() {
		int result = service.modifyEmail("jungu", "jungu0416@naver.com");
		System.out.println(result);
	}
	
	@Test
	public void getAddress() {
		String address = service.getAddress("jungu");
		System.out.println(address);
	}
	
	@Test
	public void buyProdut() {
		int result = service.buyProduct("jungu", "1111_4", "9999", "5000");
		System.out.println(result);
	}

	@Test
	public void modifyReview() {
		int result = service.modifyReview("1", "jungu", "수정1번이요");
		System.out.println(result);
	}
	
	@Test
	public void deleteReview() {
		int result = service.deleteReview("1", "1");
		System.out.println(result);
		
	}

	@Test
	public void checkOrder() {
		int result = service.checkOrder("jungu", "9999" , "1002");
		System.out.println(result);
	}




}

	
