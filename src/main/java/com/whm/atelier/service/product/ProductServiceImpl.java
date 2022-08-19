package com.whm.atelier.service.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.product.ProductMapper;
import com.whm.atelier.vo.ConsumerWish;
import com.whm.atelier.vo.ProductCategory;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.ProductSearchLog;
import com.whm.atelier.vo.Review;

@Service
public class ProductServiceImpl {

	private static final Integer PRODUCT_STUS_UNAPPROVED = 1;	// 미승인
	private static final Integer PRODUCT_STUS_DELETE = 2;		// 삭제
	private static final Integer PRODUCT_STUS_TEMP_PAUSE = 3;	// 일시정지
	private static final Integer PRODUCT_STUS_APPROVED = 4;		// 승인
	
	@Autowired
	private ProductMapper productMapper;
	
	// 메인화면 상품 리스트
	public List<Map<String, Object>> getProductList(String type, String searchWord, Integer product_category_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("confirm_status_no", PRODUCT_STUS_APPROVED);
		param.put("category_no", product_category_no);
		param.put("condition", type);
		param.put("searchWord", searchWord);
		
		return productMapper.selectProductList(param);
	}
	
	// 상품 카테고리별 리스트
	public List<Map<String, Object>> getProductListByCategory(Integer product_category_no, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("category_no", product_category_no);
		param.put("condition", type);
		return productMapper.selectProductList(param);
	}
	
	// 특정 상품 정보 출력
	public Map<String, Object> getProductOne(int product_no) {
		return productMapper.selectProductOne(product_no, null);
	}
	
	// 상품 이미지 조회
	public List<ProductImage> getProductImgList(int product_no) {
		return productMapper.selectProductImgList(product_no);
	}
	
	// 상품 리뷰 조회
	public List<Map<String, Object>> getProductReviewList(int product_no) {
		return productMapper.selectProductReviewList(product_no);
	}
	
	// 상품 문의 조회
	public List<Map<String, Object>> getProductAskList(int product_no) {
		return productMapper.selectProductAskList(product_no);
	}
	
	// 상품 번호로 상점 조회
	public Map<String, Object> getStoreInfoByPdNo(int product_no) {
		return productMapper.selectStoreInfoByNo(product_no, null); 
	}
	
	// 상점 번호로 상점 조회
	public Map<String, Object> getStoreInfoByStNo(int store_no) {
		return productMapper.selectStoreInfoByNo(null, store_no); 
	}
	
	// 상점번호로 전체 상품 조회
	public List<Map<String, Object>> getStoreProductList(int store_no) {
		return productMapper.selectStoreProductList(PRODUCT_STUS_APPROVED, store_no);
	}
	
	// 상품 찜
	public void addOrRemoveWish(ConsumerWish consumerWish) {
		
		if(isExistsWishPd(consumerWish)) {
			ConsumerWish wish = getConsumerWishByNo(consumerWish);
			removeWish(wish.getConsumer_wish_no());
			// 기존에 찜이 되어있다면 찜 삭제
		} else {
			productMapper.addWish(consumerWish);
		}
		
	}
	
	public boolean isExistsWishPd(ConsumerWish consumerWish) {
		ConsumerWish wish = getConsumerWishByNo(consumerWish);
		if(wish != null)
			return true;
		else
			return false;
	}
	
	public ConsumerWish getConsumerWishByNo(ConsumerWish consumerWish) {
		return productMapper.selectCountWishPdByConsumerNo(consumerWish);
	}
	
	public void removeWish(int consumer_wish_no) {
		productMapper.removeWish(consumer_wish_no);
	}
	
	// 상품 카테고리 전체 출력
	public List<ProductCategory> getProductCategoryList() {
		return productMapper.selectProductCategory(null);
	}
	
	// 카테고리번호로 카테고리 조회
	public ProductCategory getProductCategory(Integer product_category_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("product_category_no", product_category_no);
		return productMapper.selectProductCategory(param).get(0);	
	}
	
	// 검색어 로그 추가
	public void addSearchLog(ProductSearchLog productSearchLog) {
		List<ProductSearchLog> list = getMyRecentSearchWord(productSearchLog.getConsumer_no());
		if(list.size() > 0) {
			
			boolean isExistWord = false;							// 현재 검색한 단어가 기록에 존재하는지?
			String searchWord = productSearchLog.getProduct_search_keyword();	// 현재 검색 단어
			
			for(ProductSearchLog log : list) {
				// 검색한 단어가 기록에 이미 존재하면 true
				if(searchWord.equals(log.getProduct_search_keyword())) {
					isExistWord = true;
				}
			}
			
			if(!isExistWord) {
				productMapper.addSearchLog(productSearchLog);
			}
			
		} else {
			productMapper.addSearchLog(productSearchLog);
		}
		
	}
	
	// 인기 검색어 조회
	public List<String> getPopularSearchWord() {
		return productMapper.selectPopularSearchWord();
	}
	
	// 내 최근 검색어 조회
	public List<ProductSearchLog> getMyRecentSearchWord(int consumer_no) {
		List<ProductSearchLog> searchRecentLog = productMapper.selectMyRecentSearchWord(consumer_no);
		List<ProductSearchLog> searchAllLog = productMapper.selectMyAllSearchLog(consumer_no);
		
		List<Integer> deleteProductLog = new ArrayList<Integer>();
		
		System.out.println("searchRecentLog : " + searchRecentLog);
		System.out.println("searchAllLog : " + searchAllLog);
		if(searchAllLog != null && searchAllLog.size() > 0 && searchRecentLog != null && searchRecentLog.size() > 0) {
			for(ProductSearchLog allLog : searchAllLog) {
				boolean flag = false;
				
				for(ProductSearchLog recentLog : searchRecentLog) {
					if(allLog.getProduct_search_no() == recentLog.getProduct_search_no()) {
						flag = true;
					}
				}
				
				if(!flag) {
					deleteProductLog.add(allLog.getProduct_search_no());
				}
			}
		
			for(int log : deleteProductLog) {
				deleteMySearchLog(log);
			}
		}
		
		return searchRecentLog; 
	}
	
	// 내 최근 검색어 기록 삭제
	public void deleteMySearchLog(int product_search_no) {
		productMapper.deleteMySearchLog(product_search_no);
	}
	
	public void deleteMyAllSearchLog(int consumer_no) {
		productMapper.deleteMyAllSearchLog(consumer_no);
	}
	
	public List<Map<String, Object>> getReviewListByStoreNo(int store_no) {
		return productMapper.selectReviewListByStoreNo(store_no);
	}
	
	public List<Map<String, Object>> selectWishPdInfoList(int consumer_no){
		return productMapper.selectWishPdInfoList(PRODUCT_STUS_APPROVED, consumer_no);
	}
	
}
