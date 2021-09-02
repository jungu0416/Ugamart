package com.jg.daoTest;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dao.RiderDao;
import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;
import com.jg.dto.RiderOrderDto;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RiderDaoTest {
	@Autowired
	RiderDao dao;
	
	@Test
	public void loginAction() {
		int result = dao.loginAction("abc", "abc");
		System.out.println(result);
	}
	
	@Test
	public void orderList() {
		List<RiderEachOrderDto> list = dao.orderList();
		for(RiderEachOrderDto dto : list) System.out.println(dto);
		
	}
	
	@Test
	public void registerAction() {
		int result = dao.registerAction(new RiderDto("1","1","1","1","1"));
		System.out.println(result);
	}
	
	@Test
	public void insertIntoRiderDeliveryList() {
		int result = dao.insertIntoRiderDelivery("abc", "2");
		System.out.println(result);
	}
	
	@Test
	public void updateOrderList() {
		int result = dao.updateOrderList("2");
		System.out.println(result);
	}
	
	@Test
	public void riderOrderNumber() {
		List<String> list = dao.riderOrderNumber("abc");
		for(String s : list )System.out.println(s);
	}
	
	@Test
	public void riderDeliveryList() {
		RiderOrderDto dto = dao.riderDeliveryList("2");
		System.out.println(dto);
	}
	
	@Test
	public void findproductName() {
		String pn = dao.findProductName("9999", "1001");
		System.out.println(pn);
	}
	
	@Test
	public void findCeoStoreName() {
		String name = dao.findCeoStoreName("9999");
		System.out.println(name);
	}
	
	@Test
	public void findCeoAddress() {
		String address = dao.findCeoAddress("9999");
		System.out.println(address);
	}
	
	@Test
	public void updateDelivery() {
		int result = dao.updateDelivery("2");
		System.out.println(result);
	}
	
	@Test
	public void deliveryDone() {
		int result = dao.deliveryDone("2");
		System.out.println(result);
	}
	
	@Test
	public void deliveryDoneList() {
		RiderOrderDto dto = dao.riderDeliveryDoneList("2");
		System.out.println(dto);
	}
	
}

