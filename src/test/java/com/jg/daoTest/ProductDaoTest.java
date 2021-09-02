package com.jg.daoTest;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dao.ProductDao;
import com.jg.dto.ProductByCategoryDto;
import com.jg.dto.ProductDto;
import com.jg.dto.ProductReviewDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDaoTest {
	@Autowired
	ProductDao dao;
	
	@Test
	public void eachProduct() {
		ProductDto dto = dao.eachProduct("9999", "1001");
		System.out.println(dto);
	}
	
	@Test
	public void productReview() {
		List<ProductReviewDto> list = dao.getReview("9999", "1001");
		for(ProductReviewDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void productByCategory() {
		List<ProductByCategoryDto> list = dao.productByCategory("1");
		for(ProductByCategoryDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void findAddress() {
		String address = dao.findAddress("jungu");
		System.out.println(address);
	}
	
	@Test
	public void findCeoAddress() {
		String ceoAddress = dao.findCeoAddress("9999");
		System.out.println(ceoAddress);
	}
	
	
}
