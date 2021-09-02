package com.jg.serviceTest;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;
import com.jg.service.RiderService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RiderServiceTest {
	@Autowired
	RiderService service;
	
	@Test
	public void loginAction(){
		int result = service.loginAction("abc", "abc");
		System.out.println(result);
	}
	
	@Test
	public void orderList() {
		List<RiderEachOrderDto> list = service.orderList();
		for(RiderEachOrderDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void registerAction() {
		int result = service.registerAction(new RiderDto("2","2","2","2","2"));
		System.out.println(result);
	}
	
	@Test
	public void pickOrder() {
		int result = service.pickOrder("abc", "1");
		System.out.println(result);
	}
	
	@Test
	public void riderDeliveryList() {
		List<RiderEachOrderDto> list = service.riderDeliveryList("abc");
		for(RiderEachOrderDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void updateDelivery(){
		int result= service.updateDelivery("2");
		System.out.println(result);
	}
	
	@Test
	public void deliveryDone() {
		int result = service.deliveryDone("2");
		System.out.println(result);
	}
	
	@Test
	public void deliveryDoneList() {
		List<RiderEachOrderDto> list = service.deliveryDoneList("abc");
		for(RiderEachOrderDto dto : list) System.out.println(dto);
	}
	
}
	
