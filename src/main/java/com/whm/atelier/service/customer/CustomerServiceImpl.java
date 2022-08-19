package com.whm.atelier.service.customer;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.CenterBank;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;
import com.whm.atelier.vo.CustomerWallet;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.ProductAsk;
import com.whm.atelier.vo.Review;
import com.whm.atelier.vo.Store;
import com.whm.atelier.vo.StoreTier;

@Service
public class CustomerServiceImpl {

	@Autowired
	private CustomerMainMapper customerMainMapper;
	
	public Customer login(Customer param) {
		System.out.println("로그인 서비스");
		Customer customer = customerMainMapper.selectByIdAndPw(param);
		
		return customer;
	}
	
	public Customer checkIdData(String name) {

		return 	customerMainMapper.selectCheckId(name);
	}
	
	
	public void StoreNameAndProfile(Store store) {
		customerMainMapper.insertStoreNameAndProfile(store);
		
	}
	
	public Store storeNoSelect(int customerNo) {
		
		return customerMainMapper.selectStoreNo(customerNo);
	}
	
	

	public void productInsertData(Product product) {
		customerMainMapper.insertProductProfile(product);
		
	}
	
	
	public ArrayList<Product> productSelectData(int storeNo,int type){
		ArrayList<Product> temp = new ArrayList<Product>();
		for (Product p  :  customerMainMapper.selectMyProduct(storeNo, type)) {
			temp.add(p);
			
		}
		
		return temp;
	}
	
	public ArrayList<Product> productSearchData(int storeNo,int confirmNo, String productName, String productYn){
		ArrayList<Product> temp = new ArrayList<Product>();
		for (Product p  :  customerMainMapper.searchMyProduct(storeNo, productName, confirmNo, productYn)) {
			temp.add(p);
			
		}
		
		return temp;
	}
	
	
	
	public Product selectProductDetailData(int productNo) {
		
		return customerMainMapper.selectProductDetail(productNo);
	}
	
	public void updateStoreProfile(Store store) {
		
		customerMainMapper.updateStoreProfile(store);
	}
	
	public void updateProductProfile(Product product) {
		
		customerMainMapper.updateProductProfile(product);
	}
	
	
	public void updateProductStatusStop(int productNo) {
		customerMainMapper.updateProductStatusStop(productNo);
	}

	public void updateProductStatusStart(int productNo) {
		customerMainMapper.updateProductStatusStart(productNo);
	}
	
	public void updateProductStatusYn(int productNo, String productStatusYn) {
		
		customerMainMapper.updateProductStatusYn(productNo, productStatusYn);
		
	}
	public StoreTier selectStoreTierData(int storeTierNo) {
		
		return customerMainMapper.selectTier(storeTierNo);
	}
	
	public ArrayList<Review>selectReviewTable(int productNo) {
		
		return customerMainMapper.selectReview(productNo);
	}
	
	public ArrayList<Review>selectReviewTablebAll(int storeNo) {
		
		return customerMainMapper.selectReviewByStoreNo(storeNo);
	}
	
	
	public ArrayList<ProductAsk>selectAskTable(int productNo) {
		
		return customerMainMapper.selectAsk(productNo);
	}
	
	public ArrayList<ProductAsk>selectAskTablebAll(int storeNo) {
		
		return customerMainMapper.selectAskByStoreNo(storeNo);
	}
	
	//내 계좌정보 확인
	public CustomerWallet selectWalletData(int customerNo) {
		
		
		return customerMainMapper.selectMyWallet(customerNo); 
	}
	
	//중앙뱅크 연결 
	public CenterBank selectBankData(int customerWalletNo) {
		
		
		return customerMainMapper.selectBank(customerWalletNo); 
	}
	
	//판매자가 문의 글 쓰기
	
	public void writeCustomerQna(CustomerCenter customerCenter) {
		customerMainMapper.insertCustomerQna(customerCenter);
	}
	
	//판매자가 자신의 문의 리스트 보기
	
	public ArrayList<CustomerCenter> getCusAskList(int customerNo){
		ArrayList<CustomerCenter> temp = new ArrayList<CustomerCenter>();
		for(CustomerCenter customer : customerMainMapper.selectCusAskList(customerNo)) {
			temp.add(customer);
		}
	
		return temp;
	}
	
	//판매자가 자신의 문의 자세히 보기
	public HashMap<String, Object> getCusAskDetail(int cusCenterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CustomerCenter customerCenter = customerMainMapper.selectCusAskDetail(cusCenterNo);
		int adminNo = customerCenter.getAdmin_no();
		
		
		map.put("customerCenter", customerCenter);
		
		
		return map;
	}
	
	//판매자가 자신의 문의 삭제하기
	
	public void deleteCustomerAsk(int cusCenterNo) {
		customerMainMapper.deleteCusAsk(cusCenterNo);
	}
	
	//지갑정보추가
	public void insertAccontData(int customerNo, String account, String bank) {
		
		customerMainMapper.insertCustomerWallet(customerNo, account, bank);
	}
	
	public void insertBankData(int walletNo) {
		customerMainMapper.insertBank(walletNo);
	}
	
	public void updateAccountData(int customerNo, String account, String bank) {
		
		
		customerMainMapper.updateCustomerWallet(customerNo, account, bank);
	}
}
