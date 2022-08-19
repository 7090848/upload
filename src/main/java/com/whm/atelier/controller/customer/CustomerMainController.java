package com.whm.atelier.controller.customer;



import java.util.HashMap;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whm.atelier.service.customer.CustomerOrderServiceImpl;
import com.whm.atelier.service.customer.CustomerServiceImpl;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Store;


@Controller
@RequestMapping("/customer/*")
public class CustomerMainController {
	
	@Autowired
	private CustomerServiceImpl customerService;
	@Autowired
	private CustomerOrderServiceImpl customerOrderService;
	//페이지 이동
	
	@RequestMapping("m/myInfomation")
	public String myInfomation(HttpSession session, Model model) {
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
		Store temp = customerService.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
		model.addAttribute("temp", temp);
		return "customer/m/myInfomation";
		}
	}
	
	
	//회원가입 진입
	@RequestMapping("lg/register")
	public String registerPage() {
		System.out.println("회원가입사이트 이동");
		return "customer/lg/register";
	}
	
	//myOrder 메뉴 진입.
	@RequestMapping("m/totalOrder")
	public String totalOrder(HttpSession session, Model model) {
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
		Store temp = customerService.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
	
		System.out.println("상점번호"+temp.getCustomer_no());
		 
		model.addAttribute("temp", temp);
		model.addAttribute("orderTotal", customerOrderService.totalOrderListData(temp.getStore_no()));
		return "customer/m/totalOrder";
		}
	}
	
	
	@RequestMapping("lg/login")
	public String login() {	
		return "customer/lg/login";
	}
	

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../m/main";
	}
	
	@RequestMapping("m/profileRegister")
	public String profileRegister(){
	
		
			return "customer/m/profileRegister";
		
			
	}
	
	@RequestMapping("m/profileModify")
	public String profileModify(int customerNo ,HttpSession session){
	
		if(session.getAttribute("customer")==null) {
			
			return"customer/lg/login";
		}else {
			System.out.println("상점이 등록되어있음");
			return "customer/m/profileModify";
		}
			
	}
	
	@RequestMapping("m/myProduct")
	public String myProduct(HttpSession session, Model model,  @RequestParam(value = "productName", defaultValue = "") String productName, @RequestParam(value = "confirmNo", defaultValue = "4") int confirmNo) {
		System.out.println(confirmNo);
		HashMap<String , Object> nullfind = new HashMap<String, Object>();
		nullfind.put("find", productName);
		nullfind.put("findNo", confirmNo);
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
			
			
			model.addAttribute("storeInfo",customerService.storeNoSelect(((Customer)session.getAttribute("customer")).getCustomer_no()));
			//이렇게 하니까 PAGE에서 customer_no을 보낼 필요가 없네.. 물론 이건 현재 로그인 된 유저 정보를 보내는거다
			return "customer/m/myProduct";
				
		}
	}
	
	@RequestMapping("m/productRegister")
	public String productRegister(HttpSession session){
		
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
			return "customer/m/productRegister";
		}
		
		
	}
	@RequestMapping("m/productDetail")
	public String productDetail(HttpSession session, int productNo, Model model){
		
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
			model.addAttribute("detail", customerService.selectProductDetailData(productNo));
			
			return "customer/m/productDetail";
		}
		
		
	}
	@RequestMapping("m/productModify")
	public String productModify(int productNo, Model model) {
		model.addAttribute("detail", customerService.selectProductDetailData(productNo));
		
		return "customer/m/productModify";
	}
	
	@RequestMapping("m/myRank")
	public String myRank(HttpSession session, Model model) {
		if(session.getAttribute("customer")==null) {
			System.out.println("로그인이 안되어있음");
			return"customer/lg/login";
		}else {
			HashMap<String, Object> tempHash = new HashMap<String, Object>();
			Store temp = customerService.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
			tempHash.put("rank",customerService.selectStoreTierData(temp.getStore_tier_no()));
			tempHash.put("store",temp);
			System.out.println(tempHash);
			model.addAttribute("model", tempHash);
			
			//위의 값으로 랭크 티어에 값 출력ㄱ
			return "customer/m/myRank";
		}
		
	}
	
	@RequestMapping("m/myProductReviewList")
	public String myProductReviewList(int productNo, Model model) {
		
		 model.addAttribute("review", customerService.selectReviewTable(productNo)); 
		
		return "customer/m/myProductReviewList";
	}
	
	
	@RequestMapping("m/myProductReviewAllList")
	public String myProductReviewAllList(int storeNo, Model model) {

		 model.addAttribute("review", customerService.selectReviewTablebAll(storeNo)); 

		return "customer/m/myProductReviewAllList";
	}
	
	
	@RequestMapping("m/myProductAskList")
	public String myProductAskList(int productNo, Model model) {
		
		 model.addAttribute("ask", customerService.selectAskTable(productNo)); 
		
		return "customer/m/myProductAskList";
	}
	
	
	@RequestMapping("m/myProductAskAllList")
	public String myProductAskAllList(int storeNo, Model model) {

		 model.addAttribute("ask", customerService.selectAskTablebAll(storeNo)); 

		return "customer/m/myProductAskAllList";
	}
	
	@RequestMapping("m/myAskCenter")
	public String myAskCenter( Model model, HttpSession session) {
		
		Store temp = customerService.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
		HashMap<String , Object> hashTemp = new HashMap<String, Object>();
		hashTemp.put("store", temp);
		hashTemp.put("cusQna", customerService.getCusAskList(((Customer)session.getAttribute("customer")).getCustomer_no()));
		model.addAttribute("temp", hashTemp);
		return "customer/m/myAskCenter";
	}
	
	
	
	@RequestMapping("m/askWriteToAdmin")
	public String askWriteToAdmin() {
		
		return "customer/m/askWriteToAdmin";
	}
	
	@RequestMapping("m/askWriteToAdminDetail")
	public String CustomerQnaWriteDetail(int cusCenterNo, Model model) {
		HashMap<String,Object> cusAskData = customerService.getCusAskDetail(cusCenterNo); 
		
		model.addAttribute("cusAskData", cusAskData);
		
		return "customer/m/askWriteToAdminDetail";
	}
	
	//프로세스 실행
	
	
	@RequestMapping("lg/loginProcess")
	public String loginProcess(Customer param, HttpSession session, Model model) {
		
		
		Customer customer = customerService.login(param);
		
		if(customer == null ) {
			return "common/loginFail";
		}
		
		else {
			session.setAttribute("customer", customer);
		
			if(customerService.storeNoSelect(customer.getCustomer_no())==null) {
				return "redirect: ../m/profileRegister";
			}else {
				return "redirect: ../m/myInfomation";
			}
		}
	}
	

	@RequestMapping("lg/logoutProcess")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate(); //세션 객체 소멸.. 재생성..
		
		return "redirect:../lg/login";
	}
	

	@RequestMapping("lg/registerProcess")
	public String registerProcess(Customer customer) {
		
		 //세션 객체 소멸.. 재생성..
		
		return "redirect:../lg/login";
	}
	
	
	
	@RequestMapping("m/profileRegisterProcess")
	public String profileRegisterProcess(Store store) {
		System.out.println(store.getCustomer_no());
		
		customerService.StoreNameAndProfile(store);
		
		return "redirect:../m/myInfomation";
	}
	
	@RequestMapping("m/profileModifyProcess")
	public String profileModifyProcess(Store store){
		
		customerService.updateStoreProfile(store);
		
		return "redirect:./myInfomation";
	}

	@RequestMapping("m/productRegisterProcess")
	public String productRegisterProcess(Product product, HttpSession session) {
		

		
		product.setStore_no(customerService.storeNoSelect(((Customer)session.getAttribute("customer")).getCustomer_no()).getStore_no());
		customerService.productInsertData(product);
		return "redirect:./myProduct";
	}
	
	@RequestMapping("m/productModifyProcess")
	public String productModifyProcess(Product product){
		System.out.println("?");
		System.out.println(product.getProduct_no());
		customerService.updateProductProfile(product);
		
		return "redirect:./myProduct";
	}
	
	
	@RequestMapping("m/CustomerQnaWriteProcess")
	public String CustomerQnaWriteProcess(CustomerCenter param, HttpSession session) {		
		
		param.setCustomer_no( ((Customer)session.getAttribute("customer")).getCustomer_no());
		
		customerService.writeCustomerQna(param);

		return "redirect: ./myAskCenter";
	}
	
	@RequestMapping("m/deleteCustomerProcess")
	public String deleteCustomerProcess(int cusCenterNo) {
		
		customerService.deleteCustomerAsk(cusCenterNo);
		
		return "redirect: ./myAskCenter";
	}


	
}
