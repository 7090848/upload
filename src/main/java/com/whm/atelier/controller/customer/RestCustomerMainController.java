package com.whm.atelier.controller.customer;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.whm.atelier.service.customer.CustomerOrderServiceImpl;
import com.whm.atelier.service.customer.CustomerServiceImpl;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Store;

@RestController
@RequestMapping("/customer/*")
public class RestCustomerMainController {

	@Autowired
	private CustomerServiceImpl customerservice;
	@Autowired
	private CustomerOrderServiceImpl customerOrderService;
	
	
	//id 중복확인
	@RequestMapping()
	public HashMap<String, Object>checkId(String name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("name", customerservice.checkIdData(name));
		return map;
	}
	
	
	//내 상품 T 출력
	@RequestMapping("productTable")
	public HashMap<String , Object> productTable(HttpSession session, @RequestParam(value = "type", defaultValue = "4")int type,
			@RequestParam(value = "productName", defaultValue = "") String productName, @RequestParam(value = "productYn", defaultValue = "") String productYn){
		System.out.println("myProduct 상품 호출");
	
		
		Store store =customerservice.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
	
		
		
		HashMap<String, Object>hash = new HashMap<String, Object>();
		hash.put("number",type);
		hash.put("Yn",productYn);
		hash.put("data", customerservice.productSearchData(store.getStore_no(),type, productName,productYn));
		
	return hash;	
	}
	
	
	//상품일시정지-정상 변경
	@RequestMapping("updateProductStatus")
	public void updateProductStatus(int productNo, String productYn) {
		System.out.println("rest호출");
		System.out.println("rest 넘버값" +productNo);
		System.out.println("문자값" +productYn);
		
		
			customerservice.updateProductStatusYn(productNo, productYn);
	
	}
	//상품등록
	@RequestMapping("productModifyProcess")
	public void productModifyProcess(HttpSession session, String productName, int productPrice, String productDesciption, int productPostPrice,int productCategoryNo){
		System.out.println("상품등록되나?");
		Product product = new Product();
	
		product.setStore_no(customerservice.storeNoSelect(((Customer)session.getAttribute("customer")).getCustomer_no()).getStore_no());
		product.setProduct_category_no(productCategoryNo);
		product.setProduct_description(productDesciption);
		product.setProduct_name(productName);
		product.setProduct_post_price(productPostPrice);
		product.setProduct_price(productPrice);
		
		customerservice.productInsertData(product);
		
		
	}
	
	
	
	
	
	
	//상품상새
	@RequestMapping("productDetailProcess")
	public HashMap<String, Object> productDetailProcess(HttpSession session, int productNo, Model model){
		
			//model.addAttribute("detail", customerservice.selectProductDetailData(productNo));
			HashMap<String , Object> map = new HashMap<String, Object>();
			map.put("DetailData",  customerservice.selectProductDetailData(productNo));
			return map;
	}
	
	
	
	//
	@RequestMapping("test")
	public HashMap<String, Object> test(HttpSession session, int productNo){
		System.out.println(productNo);
			session.setAttribute("datt", productNo);
			//model.addAttribute("detail", customerservice.selectProductDetailData(productNo));
			HashMap<String , Object> map = new HashMap<String, Object>();
			map.put("dat",  customerservice.selectProductDetailData(productNo));
			return map;
	}
	
	
	//주문상태별로보기
	@RequestMapping("OrderStatus")
	public HashMap<String, Object> OrderStatus(HttpSession session,  String orderStatus){
		
			System.out.println("REST응답받음");
			HashMap<String , Object> map = new HashMap<String, Object>();
			
			Store temp = customerservice.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
			
			 
			map.put("temp", temp);
			map.put("restOrderTotal", customerOrderService.RestTotalOrderListData(temp.getStore_no(),orderStatus));
			return map;
	}
	
	
	//주문상세보기
	@RequestMapping("detailOrder")
	public HashMap<String, Object> detailOrder(int orderNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("detail", customerOrderService.detailOrderData(orderNo));
		
		return map;
		
	}
	
	
	
	//내계좌관리페이지보기
	@RequestMapping("payPage")
	public HashMap<String, Object> payPage(int customerNo){
		System.out.println("restController" +customerNo );
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("customerWallet", customerservice.selectWalletData(customerNo));
		
		if(customerservice.selectWalletData(customerNo) != null) {
			map.put("centerBank", customerservice.selectBankData( customerservice.selectWalletData(customerNo).getCustomer_wallet_no()));
		}
		
		map.put("fail", "계좌를 등록해주세요.");
		return map;
		
	}
	
	//계좌등록
	@RequestMapping("insertAccount")
	public HashMap<String, Object> insertAccount(int customerNo, String account, String bank){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		customerservice.insertAccontData(customerNo, account, bank);
		customerservice.selectWalletData(customerNo);
		 
		  map.put("fail", "알 수 없는 이유로 실패..");
		  map.put("wallet", customerservice.selectWalletData(customerNo));
		return map;
		
	}
	
	//뱅크 자동 등록
	@RequestMapping("insertBank")
	public HashMap<String, Object> insertBank(int walletNo){
	
		customerservice.insertBankData(walletNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		  map.put("fail", "알 수 없는 이유로 실패..");
		 
		  
		return map;
		
	}
	
	
	//계좌수정
	@RequestMapping("updateAccount")
	public HashMap<String, Object> updateAccount(int customerNo, String account, String bank){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		customerservice.updateAccountData(customerNo, account, bank);
	
		 
		  map.put("fail", "알 수 없는 이유로 실패..");
		  
		return map;
		
	}
	
	
	
	@RequestMapping("test11")
	public HashMap<String, Object>test11(Customer account){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(account);
		System.out.println(account.getCustomer_no());
		System.out.println(account.getCustomer_id());  
		return map;
		
	}
}
