package com.whm.atelier.mapper.customer;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.CenterBank;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;
import com.whm.atelier.vo.CustomerWallet;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.ProductAsk;
import com.whm.atelier.vo.Review;
import com.whm.atelier.vo.Store;
import com.whm.atelier.vo.StoreTier;

public interface CustomerMainMapper {

	// 아이디와 패스워드로 계정 정보 불러오기
	public Customer selectByIdAndPw(Customer param);
	
	public Customer selectCheckId(String name);
	
	public void insertStoreNameAndProfile(Store store);
	public Store selectStoreNo(int customerNo);
	public void insertProductProfile(Product product);
	
	public ArrayList<Product> selectMyProduct(
			@Param("storeNo") int storeNo,
			@Param("type") int type);
	
	public ArrayList<Product> searchMyProduct(
			@Param("storeNo") int storeNo,
			@Param("productName") String productName,			
			@Param("confirmNo") int confirmNo,
			@Param("productYn") String productYn
			);
	
	
	public Product selectProductDetail(int productNo);
	
	public void updateStoreProfile(Store store);
	
	public void updateProductProfile(Product product);
	
	public void updateProductStatusStop(int productNo);
	public void updateProductStatusStart(int productNo);
	public void updateProductStatusYn(
			@Param("productNo") int productNo,
			@Param("productYn") String productYn
			);
	
	
	public StoreTier selectTier(int storeTierNo);
	
	public ArrayList<Review> selectReview(int productNo);
	
	public ArrayList<Review> selectReviewByStoreNo(int storeNo);
	
	
	public ArrayList<ProductAsk> selectAsk(int productNo);
	
	public ArrayList<ProductAsk> selectAskByStoreNo(int storeNo);
	
	public CustomerWallet selectMyWallet(int customerNo);
	
	public CenterBank selectBank(int customerWalletNo);
	
	
	public void insertCustomerQna(CustomerCenter customerCenter);
	public ArrayList<CustomerCenter> selectCusAskList (int customerNo);
	public CustomerCenter selectCusAskDetail (int cusCenterNo);
	public void deleteCusAsk (int cusCenterNo);
	
	public void insertCustomerWallet(
			@Param("customerNo") int customerNo,
			@Param("account") String account,
			@Param("bank") String bank
			);
	public void insertBank(int walletNo);
	
	public void updateCustomerWallet(
			@Param("customerNo") int customerNo,
			@Param("account") String account,
			@Param("bank") String bank
			);
		
}
