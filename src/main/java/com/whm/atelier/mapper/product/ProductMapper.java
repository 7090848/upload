package com.whm.atelier.mapper.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.ConsumerWish;
import com.whm.atelier.vo.ProductCategory;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.ProductSearchLog;

public interface ProductMapper {
	
	// 상품 카테고리별 전체 리스트 출력
	public List<Map<String, Object>> selectProductList(Map<String, Object> param);
	
	// 특성 상품 정보 출력
	public Map<String, Object> selectProductOne(@Param("product_no") int product_no, @Param("condition") String condition);
	
	// 상품 이미지 조회
	public List<ProductImage> selectProductImgList(int product_no);

	// 상품 리뷰 조회
	public List<Map<String, Object>> selectProductReviewList(int product_no);
	
	// 상품 문의 조회
	public List<Map<String, Object>> selectProductAskList(int product_no);
	
	// 상점 정보 조회
	public Map<String, Object> selectStoreInfoByNo(@Param("product_no") Integer product_no, @Param("store_no") Integer store_no);
	
	// 상점의 전체 상품 조회
	public List<Map<String, Object>> selectStoreProductList(@Param("confirm_status_no") Integer confirm_status_no, @Param("store_no") int store_no);
	
	// 상품 찜
	public void addWish(ConsumerWish consumerWish);
	
	// 회원별 상품 특정 상품 찜 했는지 출력
	public ConsumerWish selectCountWishPdByConsumerNo(ConsumerWish consumerWish);
	
	// 찜 삭제
	public void removeWish(int consumer_wish_no);
	
	// 상품 전체 카테고리 조회
	public List<ProductCategory> selectProductCategory(Map<String, Object> map);
	
	// 검색어 로그 추가
	public void addSearchLog(ProductSearchLog productSearchLog);
	
	// 인기 검색어 출력
	public List<String> selectPopularSearchWord();
	
	// 내 최근 검색어 출력
	public List<ProductSearchLog> selectMyRecentSearchWord(int consumer_no);
	
	// 내 전체 검색로그 출력
	public List<ProductSearchLog> selectMyAllSearchLog(int consumer_no); 
	
	// 내 최근 검색기록 삭제
	public void deleteMySearchLog(int product_search_no);
	
	// 내 최근 검색기록 전체 삭제
	public void deleteMyAllSearchLog(int consumer_no);
	
	// 찜 목록 조회
//	public List<Map<String, Object>> selectWishList(@Param("confirm_status_no") Integer confirm_status_no, @Param("consumer_no") int consumer_no);
	
	// 상점별 모든 후기 조회
	public List<Map<String, Object>> selectReviewListByStoreNo(int store_no);
	
	
	public List<Map<String, Object>> selectWishPdInfoList (@Param("confirm_status_no") Integer product_confirm_status_no, 
		@Param("consumer_no") int consumer_no);
	
}
