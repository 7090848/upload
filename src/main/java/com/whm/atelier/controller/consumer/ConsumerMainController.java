package com.whm.atelier.controller.consumer;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whm.atelier.service.consumer.ConsumerServiceImpl;
import com.whm.atelier.service.product.ProductServiceImpl;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerAddress;
import com.whm.atelier.vo.Coupon;
import com.whm.atelier.vo.CouponMake;
import com.whm.atelier.vo.ProductCategory;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.ProductSearchLog;
import com.whm.atelier.vo.Review;

@Controller
@RequestMapping("/consumer/*")
public class ConsumerMainController {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ConsumerMainController.class);
	
	@Autowired
	private ConsumerServiceImpl consumerService;
	@Autowired
	private ProductServiceImpl productService; 

	@RequestMapping("error")
	public String error() {
		return "consumer/common/error";
	}
	
	@RequestMapping("test")
	public String test() {
		return "";
	}
	
	@RequestMapping("m/main")
	public String main(Model model, HttpSession session) {
		Consumer consumer =  (Consumer)session.getAttribute("consumer");
		if(consumer == null) {
			return "redirect:../lg/login";
		}
		
		String listType = "all";
		List<Map<String, Object>> productList = productService.getProductList(listType, null, null);
		
		model.addAttribute("productList", productList);
		return "consumer/m/main";
	}
	
	@RequestMapping("m/category")
	public String productCategorySelectPage(Model model) {
		
		List<ProductCategory> categoryList = productService.getProductCategoryList();
		LOGGER.info("productCategoryList : " + categoryList);
		
		model.addAttribute("categoryList", categoryList);
		return "consumer/m/category";
	}
	
	@RequestMapping("m/categoryProductList")
	public String categoryProductList(Integer category_no, Model model) {
		
		List<Map<String, Object>> productList = productService.getProductListByCategory(category_no, null);
		LOGGER.info("productListByCategory! category_no=" + category_no + productList);
		
		ProductCategory category = productService.getProductCategory(category_no);
		System.out.println("category : " + category.toString());
		
		model.addAttribute("productList", productList);
		model.addAttribute("category", category);
		
		return "consumer/m/categoryProductList";
	}
	
	@RequestMapping("m/search")
	public String search(Model model, HttpSession session) {
		Consumer consumer = (Consumer) session.getAttribute("consumer");
		if(consumer == null) {
			return "redirect:../lg/login";
		}
		
		model.addAttribute("popularKeywordList", productService.getPopularSearchWord());
		model.addAttribute("mySearchList", productService.getMyRecentSearchWord(consumer.getConsumer_no()));
		
		return "consumer/m/search";
	}
	
	@RequestMapping("m/searchProduct")
	public String searchProduct(String searchWord, HttpSession session, Model model) {
		Consumer consumer = (Consumer) session.getAttribute("consumer");
		if(consumer == null) {
			return "redirect:../lg/login";
		}
		
		// 검색어 로그 추가
		ProductSearchLog productSearchLog = new ProductSearchLog(consumer.getConsumer_no(), searchWord);
		LOGGER.info("ConsumerMainController searchProduct! productSearchLog = " + productSearchLog);
		
		// 검색
		List<Map<String, Object>> searchList = productService.getProductList(null, searchWord, null);
		LOGGER.info("ConsumerMainController searchProduct! searchList = " + searchList);
		model.addAttribute("productList", searchList);
		model.addAttribute("searchWord", searchWord);
		
		productService.addSearchLog(productSearchLog);
		return "consumer/m/searchProductList";
	}
	
	
	
	@RequestMapping("pd/productDetail")
	public String productDetail(int product_no, Model model) {
		
		Map<String, Object> product = productService.getProductOne(product_no);
		List<ProductImage> imgList = productService.getProductImgList(product_no);
		
		LOGGER.info("product_no : " + product_no + " [" + product);
		LOGGER.info("productImgList[" + imgList);

		
		model.addAttribute("product", product);
		model.addAttribute("imgList", imgList);
		
		return "consumer/pd/productDetail";
	}
	
	@RequestMapping("st/storeDetail")
	public String storeDetail(int store_no, Model model) {
		
		
		List<Map<String, Object>> productList = productService.getStoreProductList(store_no);
		Map<String, Object> store = productService.getStoreInfoByPdNo(store_no);
		
		LOGGER.info("ConsumerMainController storeDetail - productList : " + productList);
		LOGGER.info("ConsumerMainController storeDetail -  store : " + store);
		
		model.addAttribute("productList", productList);
		model.addAttribute("store", store);
		
		return "consumer/st/storeDetail";
	}
	
	@RequestMapping("lg/login")
	public String login() {
		return "consumer/lg/login";
	}
	
	@RequestMapping("lg/loginProcess")
	public String loginProcess(Consumer param, HttpSession session) {
		Consumer consumer = consumerService.login(param);
		if(consumer == null) {
			// TODO: 로그인 실패 시 로직 처리 수정 필요
			return "common/loginFail";
		} else {
			ConsumerAddress address = consumerService.selectConsumerAddress(consumer.getConsumer_no());
			consumer.setAddress(address);
			
			session.setAttribute("consumer", consumer);
			return "redirect:../m/main";
		}
	}
	
	@RequestMapping("lg/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../m/main";
	}
	
	@RequestMapping("rg/register")
	public String register() {
		return "consumer/rg/register";
	}
	
	@RequestMapping("rg/registerProcess")
	public String registerProcess(Consumer param, HttpSession session) {
		
		try {
			int consumer_no = consumerService.createConsumerPk();
			param.setConsumer_no(consumer_no);
			
			consumerService.register(param);

			Consumer sessionConsumer = consumerService.getConsumerInfo(consumer_no);
			session.setAttribute("consumer", sessionConsumer);
			
			LOGGER.info("Consumer register Success! [Consumer:" + sessionConsumer.toString());
			
			return "redirect:./registerComplete";
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", e.getMessage());
			return "redirect:../error";
		}
	}
	
	@RequestMapping("rg/registerComplete")
	public String registerComplete() {
		return "consumer/rg/registerComplete";
	}
	
	// TODO: 아이디찾기
	@RequestMapping("lg/findId")
	public String findId() {
		return "";
	}
	
	@RequestMapping("lg/findIdProcess")
	public String findIdProcess() {
		return "";
	}
	
	@RequestMapping("lg/findIdComplete")
	public String findIdComplete() {
		return "";
	}
	
	// TODO: 임시비밀번호 발급. 비밀번호 재설정
	@RequestMapping("lg/changePassword")
	public String changePassword() {
		return "";
	}
	
	@RequestMapping("lg/changePasswordProcess")
	public String changePasswordProcess() {
		return "";
	}
	
	@RequestMapping("lg/changePasswordComplete")
	public String changePasswordComplete() {
		return "";
	}
	
	/**
	 * 쿠폰
	 * */
	@RequestMapping("mp/coupon")
	public String coupon(Model model,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		System.out.println("consumerNO " + consumerNo);
		map.put("consumer_no", consumerNo);
		System.out.println("map" + map);
		List<Map<String, Object>> couponDataList = consumerService.couponList(map);	
		model.addAttribute("couponDataList", couponDataList);
		return "consumer/mp/coupon";
	}
	
	@RequestMapping("mp/couponDataExpiredList")
	public String couponExpiredList(Model model, int consumer_no) {
		ArrayList<HashMap<String, Object>> couponDataExpiredList = consumerService.conCouponExpiredList(consumer_no);
		model.addAttribute("couponDataExpiredList", couponDataExpiredList);
		return "consumer/mp/couponDataExpiredList";
	}
	
	@RequestMapping("mp/throwingCoupon")
	public String throwingCoupon(Model model) {
		ArrayList<Coupon> dataList = consumerService.consumerCoupon_list();
		model.addAttribute("dataList", dataList);
		return "consumer/mp/throwingCoupon";
	}
	
	@RequestMapping("mp/throwingCouponProcess")
	public String throwingCouponProcess(CouponMake couponMake, int coupon_no) {
		//카운트가 0일경우 바꿔야됨
		
		if(consumerService.remainingCouponCount(coupon_no) > 0 ) {
			//카운트 개수 계산해서 계산해서 남은 수량이 1이상이면 실행됨 0이하로 떨어지면 실행이 안됨
		if(consumerService.selectOverLap(couponMake) == 0) {
			//중복일 경우 못받게 처음 받을때 실행이됨
			consumerService.giveToCoupon(couponMake);
//			return"redirect:../mp/coupon";
			}
		}
//		return"redirect:../mp/downloadingFail";
		return"redirect:../mp/throwingCoupon";
	}
	
	@RequestMapping("mp/myReview")
	public String myReview(HttpSession session, Model model) { 
		
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "0");
		ratingOptions.put(1, "1");
		ratingOptions.put(2, "2");
		ratingOptions.put(3, "3");
		ratingOptions.put(4, "4");
		ratingOptions.put(5, "5");
		
		model.addAttribute("ratingOptions", ratingOptions);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		map.put("consumer_no", consumerNo);
		System.out.println("맵 들어오냐" + map);
		
		List<Map<String, Object>> dataList = consumerService.myReview(map);
		model.addAttribute("dataList", dataList);
		
		System.out.println("리뷰 확인 " + dataList);
		
		return"consumer/mp/myReview";
	}
	
	
	@RequestMapping("m/myPage")
	public String myPage(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		map.put("consumer_no", consumer.getConsumer_no());
		Map<String, Object> tier = consumerService.myTierInfo(map);
		int con = consumerService.myCouponCount(consumer.getConsumer_no());
		model.addAttribute("tier", tier);
		model.addAttribute("con", con);

		return "consumer/m/myPage";
	}
	
	@RequestMapping("mp/myWishList")
	public String myWishList(Model model, HttpSession session) {
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		List<Map<String, Object>> wish = productService.selectWishPdInfoList(consumerNo);
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "0");
		ratingOptions.put(1, "1");
		ratingOptions.put(2, "2");
		ratingOptions.put(3, "3");
		ratingOptions.put(4, "4");
		ratingOptions.put(5, "5");
		
		model.addAttribute("wish", wish);
		model.addAttribute("ratingOptions", ratingOptions);
		
		return "consumer/mp/myWishList";
	}
	
	@RequestMapping("mp/registerReview")
	public String registerReview(Review param ,Model model, HttpSession session, HttpServletRequest request) {
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		int productNo = Integer.parseInt(request.getParameter("product_no"));
		int orderNo = Integer.parseInt(request.getParameter("order_no"));
		int storeNo = Integer.parseInt(request.getParameter("store_no"));
		param.setConsumer_no(consumerNo);
		param.setOrder_no(orderNo);
		param.setProduct_no(productNo);
		param.setStore_no(storeNo);
		model.addAttribute("list",consumerService.reviewIns(param));
		return "consumer/mp/registerReview";
	}
	
	
	@RequestMapping("mp/registerReviewProcess")
	public String insertReviewProcess(Review param, HttpSession session, HttpServletRequest request, Model model){
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		int productNo = Integer.parseInt(request.getParameter("product_no"));
		int storeNo = Integer.parseInt(request.getParameter("store_no"));
		int orderNo = Integer.parseInt(request.getParameter("order_no"));
		param.setConsumer_no(consumerNo);
		param.setProduct_no(productNo);
		param.setStore_no(storeNo);
		param.setOrder_no(orderNo);
		System.out.println(param);
		consumerService.insertReview(param);
//		model.addAttribute("data", param);
		
		return "consumer/mp/registerReviewProcess";
	}
	
	
}
