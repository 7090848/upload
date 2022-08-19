package com.whm.atelier.mapper.consumer;

import java.util.List;
import java.util.Map;

import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Review;

public interface ConsumerReviewMapper {
	

	public Product selectByNoProduct(int product_no);
	
	public List<Map<String, Object>> myReview(Map<String, Object> param);
	
	public int starReview (Review review);
	
	public Review myReviewData(Review param);
	
	public void insertReview(Review param);
	
	public List<Map<String, Object>> myWishList(Map<String, Object> param);
	
	public int avgReview(int param);
	
	public Review reviewIns(Review param);
	
}
