package com.whm.atelier.service.customer;

import java.util.ArrayList;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.mapper.customer.CustomerOrderMapper;
import com.whm.atelier.vo.ConsumerAddress;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Product;

@Service
public class CustomerOrderServiceImpl {

	@Autowired
	CustomerOrderMapper customerOrderMapper;
	@Autowired
	CustomerMainMapper customerMainMapper;
	

	
	public ArrayList<HashMap<String , Object>>totalOrderListData(int storeNo){
		
		
		ArrayList<Product> arrProduct= customerOrderMapper.selectMyProduct(storeNo);
		
		
		ArrayList<HashMap<String, Object>> temp = new ArrayList<HashMap<String,Object>>();
		
		
		
		for(Product p : arrProduct) {
			
			
			ArrayList<Order> temp2 = new ArrayList<Order>();
		
			temp2 = customerOrderMapper.selectMyOrder(p.getProduct_no());
			
			
			if(temp2 !=null) {
				for(Order or : temp2) {
					HashMap<String , Object> map = new HashMap<String, Object>();
					
					map.put("nick", customerMainMapper.selectProductDetail(or.getProduct_no()));
					map.put("arrOrderList", or);
					
					temp.add(map);
				}
				
			}
			
			
		}
		
		return temp;
	}
	
	
	
	public ArrayList<HashMap<String , Object>>RestTotalOrderListData(int storeNo, String orderStatus){
		
		
		ArrayList<Product> arrProduct= customerOrderMapper.selectMyProduct(storeNo);
		
		
		ArrayList<HashMap<String, Object>> temp = new ArrayList<HashMap<String,Object>>();
		
		
		
		for(Product p : arrProduct) {
		
			ArrayList<Order> temp2 = new ArrayList<Order>();
			System.out.println(p.getProduct_no());
			temp2 = customerOrderMapper.restSelectMyOrder(p.getProduct_no(), orderStatus);
			System.out.println(temp2);
			if(temp2 !=null) {
				for(Order or : temp2) {
				
					HashMap<String , Object> map = new HashMap<String, Object>();
					map.put("restnick", customerMainMapper.selectProductDetail(or.getProduct_no()));
					map.put("restarrOrderList", or);
					
					temp.add(map);
				}
			}
			
			
		}
			
		return temp;
	}
	
	
	//필요한 정보 구매자 이름, 주문 내역, 주소 
	public HashMap<String, Object> detailOrderData(int orderNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
			Order order = customerOrderMapper.selectDetailOrder(orderNo);
			int productNo =  customerOrderMapper.selectDetailOrder(orderNo).getProduct_no();
			Product product1 =customerOrderMapper.selectDetailProduct(productNo); 
			ConsumerAddress consumerAddress = customerOrderMapper.restSelectAddress(order.getConsumer_no());
			
		 map.put("consumerAddress", consumerAddress);
		 map.put("Product", product1);
		 map.put("Order",order); 
		 
		return map;
	}
	
	
}


