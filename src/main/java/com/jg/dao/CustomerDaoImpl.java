package com.jg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<CustomerStoreDto> showAllStore() {
		return sqlSession.selectList("com.jg.mapper.customerMapper.showStore");
	}


	@Override
	public int checkLogin(String id, String pw) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", id);
		map1.put("customer_pw", pw);
		
		return sqlSession.selectOne("com.jg.mapper.customerMapper.loginAction",map1);
	}


	@Override
	public int registerAction(CustomerDto dto) {
		return sqlSession.insert("com.jg.mapper.customerMapper.registerAction",dto);
	}


	@Override
	public CustomerDto myPage(String id) {
		return sqlSession.selectOne("com.jg.mapper.customerMapper.myPage",id);
	}


	@Override
	public int dropMember(String id) {
		return sqlSession.delete("com.jg.mapper.customerMapper.dropMember",id);
	}


	@Override
	public int changePW(String id, String pw) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("id", id);
		map1.put("pw", pw);
		return sqlSession.update("com.jg.mapper.customerMapper.changePW",map1);
	}


	@Override
	public List<CustomerOrderDto> orderList(String id) {
		return sqlSession.selectList("com.jg.mapper.customerMapper.customerOrderList",id);
	}


	@Override
	public String getProductName(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectOne("com.jg.mapper.customerMapper.getProductName",map1);
	}


	@Override
	public String getProductPrice(String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectOne("com.jg.mapper.customerMapper.getProductPrice",map1);
	}


	@Override
	public List<CustomerReviewDto> getReviewList(String id) {
		List<CustomerReviewDto> list = sqlSession.selectList("com.jg.mapper.customerMapper.reviewList",id);
		
		return list;
	}


	@Override
	public int modifyPhone(String customer_id, String customer_phone) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", customer_id);
		map1.put("customer_phone", customer_phone);
		
		return sqlSession.update("com.jg.mapper.customerMapper.modifyPhone",map1);
	}


	@Override
	public int modifyEmail(String customer_id, String customer_email) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", customer_id);
		map1.put("customer_email", customer_email);
		
		return sqlSession.update("com.jg.mapper.customerMapper.modifyEmail",map1); 
	}


	@Override
	public String getAddress(String customer_id) {
		return sqlSession.selectOne("com.jg.mapper.customerMapper.getAddress",customer_id);
	}


	@Override
	public int buyProduct(String id, String product_number_amount, String ceo_number, String price,String required_address) {
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", id);
		map1.put("product_number_amount", product_number_amount);
		map1.put("ceo_number", ceo_number);
		map1.put("price", price);
		map1.put("required_address", required_address);
		
		return sqlSession.insert("com.jg.mapper.customerMapper.buyProduct",map1);
	}


	@Override
	public int modifyReview(String order_number, String customer_id, String customer_content) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("order_number", order_number);
		map1.put("customer_id", customer_id);
		map1.put("customer_content", customer_content);
		
		return sqlSession.update("com.jg.mapper.customerMapper.modifyReview",map1);
	}


	@Override
	public int deleteReview(String customer_id, String order_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", customer_id);
		map1.put("order_number", order_number);
		
		return sqlSession.delete("com.jg.mapper.customerMapper.deleteReview",map1);
	}


	@Override
	public int checkOrder(String customer_id, String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", customer_id);
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		
		return sqlSession.selectOne("com.jg.mapper.customerMapper.checkOrderList",map1);
	}


	@Override
	public List<Integer> getOrderNumber(String customer_id, String ceo_number, String product_number) {
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("customer_id", customer_id);
		map1.put("ceo_number", ceo_number);
		map1.put("product_number", product_number);
		return sqlSession.selectList("com.jg.mapper.customerMapper.getOrderNumber",map1);
	}


	@Override
	public Map<String,Integer> checkReview(List<Integer> order_number) {
		int result = -1;
		int getOrderNumber = -1;
		
		
		for(Integer it : order_number) {
			result = sqlSession.selectOne("com.jg.mapper.customerMapper.checkReview",it);
			
			if(result == 0) {
				getOrderNumber = it;
				break;
			}
		}
		
		Map<String,Integer> map1 = new HashMap<String,Integer>();
		
		map1.put("result", result);
		map1.put("getOrderNumber", getOrderNumber);
		
		return map1;
		
	}


	@Override
	public int writeReview(String customer_id, int order_number, String product_number, String ceo_number,String customer_content, String rating) {
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("customer_id", customer_id);
		map1.put("order_number",order_number);
		map1.put("product_number", product_number);
		map1.put("ceo_number", ceo_number);
		map1.put("customer_content", customer_content);
		map1.put("rating", rating);
		
		return sqlSession.insert("com.jg.mapper.customerMapper.writeReview",map1);
	}

}
