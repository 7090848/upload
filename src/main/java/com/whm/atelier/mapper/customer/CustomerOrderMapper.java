package com.whm.atelier.mapper.customer;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.ConsumerAddress;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Product;

public interface CustomerOrderMapper {

	public ArrayList<Product> selectMyProduct(int storeNo);
	
	public ArrayList<Order> selectMyOrder(int productNo);
	
	public ArrayList<Order> restSelectMyOrder(
			@Param("productNo") int productNo,
			@Param("orderStatus") String orderStatus
			);

	
	public Order selectDetailOrder(int orderNo);
	public Product selectDetailProduct(int productNo);
	public ConsumerAddress restSelectAddress(int consumerNo);
}
