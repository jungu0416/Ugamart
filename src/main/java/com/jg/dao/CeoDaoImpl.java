package com.jg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jg.dto.CeoOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;

@Repository
public class CeoDaoImpl implements CeoDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override //사장 회원가입
	public int register(String ceo_id, String ceo_pw, String ceo_store_name, String ceo_phone, String ceo_address) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_id", ceo_id);
		map1.put("ceo_pw", ceo_pw);
		map1.put("ceo_store_name", ceo_store_name);
		map1.put("ceo_phone", ceo_phone);
		map1.put("ceo_address", ceo_address);
		
		return sqlSession.insert("com.jg.mapper.ceoMapper.register",map1);
	}

	@Override //사장 로그인
	public String login(String ceo_id, String ceo_pw) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_id", ceo_id);
		map1.put("ceo_pw", ceo_pw);
		return sqlSession.selectOne("com.jg.mapper.ceoMapper.login",map1);
	}

	@Override //사장 메인페이지 총 주문건수
	public String orderAmount(String ceo_number) {
		return sqlSession.selectOne("com.jg.mapper.ceoMapper.orderAmount",ceo_number);
	}

	@Override
	public int priceAmount(String ceo_number) {
		Integer result = sqlSession.selectOne("com.jg.mapper.ceoMapper.priceAmount",ceo_number);
		if(result==null) result = 0;
		return result;
	}

	@Override
	public int deliveryAmount(String ceo_number,int delivery_whether) {
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("ceo_number", ceo_number);
		map1.put("delivery_whether", delivery_whether);
		return sqlSession.selectOne("com.jg.mapper.ceoMapper.deliveryAmount",map1);
	}

	@Override
	public int registerProduct(CeoRegisterProductDto dto) {
		return sqlSession.insert("com.jg.mapper.ceoMapper.registerProduct",dto);
	}

	@Override
	public List<CeoProductDto> searchProductByName(String ceo_number, String product_k_name) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_k_name", product_k_name);
		
		return sqlSession.selectList("com.jg.mapper.ceoMapper.searchByName",map1);
	}

	@Override
	public List<CeoProductDto> searchProductByNumber(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectList("com.jg.mapper.ceoMapper.searchByNumber",map1);
	}

	@Override
	public List<CeoOrderDto> orderListByCustomerID(String ceo_number, String customer_id) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("customer_id", customer_id);
		return sqlSession.selectList("com.jg.mapper.ceoMapper.orderListByCustomerID",map1);
	}

	@Override
	public String getEachProductPrice(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		return sqlSession.selectOne("com.jg.mapper.ceoMapper.findEachProductPrice",map1);
	}

	@Override
	public String getProductName(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		return sqlSession.selectOne("com.jg.mapper.ceoMapper.findProductName",map1);
	}

	@Override
	public List<CeoReviewDto> reviewList(String ceo_number) {
		return sqlSession.selectList("com.jg.mapper.ceoMapper.reviewList",ceo_number);
	}

}
