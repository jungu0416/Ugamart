package com.jg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jg.dto.ProductByCategoryDto;
import com.jg.dto.ProductDto;
import com.jg.dto.ProductReviewDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public ProductDto eachProduct(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectOne("com.jg.mapper.productMapper.eachProduct",map1);
	}


	@Override
	public List<ProductReviewDto> getReview(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectList("com.jg.mapper.productMapper.productReview",map1);
	}


	@Override
	public List<ProductByCategoryDto> productByCategory(String category) {
		return sqlSession.selectList("com.jg.mapper.productMapper.productByCategory",category);
	}


	@Override
	public String findAddress(String customer_id) {
		return sqlSession.selectOne("com.jg.mapper.productMapper.findAddress",customer_id);
	}


	@Override
	public String findCeoAddress(String ceo_number) {
		return sqlSession.selectOne("com.jg.mapper.productMapper.findCeoAddress",ceo_number);
	}

}
