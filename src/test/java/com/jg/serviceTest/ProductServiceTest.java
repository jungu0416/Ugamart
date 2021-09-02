package com.jg.serviceTest;


import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jg.dto.ProductByCategoryDto;
import com.jg.dto.ProductDto;
import com.jg.dto.ProductReviewDto;
import com.jg.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductServiceTest {
	@Autowired
	ProductService service;
	
	@Test
	public void eachProduct(){
		ProductDto dto = service.eachProduct("9999", "1001");
		System.out.println(dto);
		
	}
	
	@Test
	public void productReview() {
		List<ProductReviewDto> list = service.productReview("9999", "1001");
		for(ProductReviewDto dto : list) System.out.println(dto);
	}
	
	@Test
	public void productByCategory() {
		List<ProductByCategoryDto> list = service.productByCategory("1");
		for(ProductByCategoryDto dto : list) System.out.println(dto);
	} 
	
	
	@Test
	public void findAddress() {
		Map<String,String> map1 = service.findAddress(null, "9999");
		
		System.out.println(map1.get("customer_address"));
		System.out.println(map1.get("ceo_address"));
	}
	
	
	
}
	
