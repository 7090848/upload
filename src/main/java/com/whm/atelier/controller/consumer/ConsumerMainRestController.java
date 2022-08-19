package com.whm.atelier.controller.consumer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.whm.atelier.service.consumer.ConsumerOrderServiceImpl;
import com.whm.atelier.service.consumer.ConsumerServiceImpl;
import com.whm.atelier.service.product.ProductServiceImpl;
import com.whm.atelier.vo.Cart;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerWish;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.OrderTb;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.ProductSearchLog;
import com.whm.atelier.vo.Review;

@RestController
@RequestMapping("/consumer/*")
public class ConsumerMainRestController {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ConsumerMainController.class);
	
	@Autowired
	private ConsumerServiceImpl consumerService;
	@Autowired
	private ConsumerOrderServiceImpl consumerOrderService;
	@Autowired
	private ProductServiceImpl productService;
	
	/**
	 * Hyejin
	 *  
	 **/
	@RequestMapping("rg/isExistsId")
	public Map<String, Object> isExistsId(String consumer_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("result", "success");
			map.put("data", consumerService.isExistConsumerId(consumer_id));
			LOGGER.info("Consumer Register ExitsId Ajax Success! [consumer_id=" + consumer_id + ", isExists=" + consumerService.isExistConsumerId(consumer_id) + "]");
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("Consumer Register ExitsId Ajax Error! [consumer_id=" + consumer_id + "]");
		}
		return map;
	}
	
	@RequestMapping("pd/getInfo")
	public Map<String, Object> getProduct(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> product = productService.getProductOne(product_no);
		List<ProductImage> imgList = productService.getProductImgList(product_no);
		product.put("imgList", imgList);
		
		LOGGER.info("product_no : " + product_no + " [" + product);
		
		map.put("data", product);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("pd/getReview")
	public Map<String, Object> getReviewList(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> reviewList = productService.getProductReviewList(product_no);
		LOGGER.info("productReviewList " + reviewList);
		
		map.put("data", reviewList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("pd/getAsk")
	public Map<String, Object> getAskList(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> askList = productService.getProductAskList(product_no);
		LOGGER.info("productAskList " + askList);
		
		map.put("data", askList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("pd/getStore")
	public Map<String, Object> getStore(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> store = productService.getStoreInfoByPdNo(product_no);
		LOGGER.info("store [" + store + "]");
		
		map.put("data", store);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("pd/addWish")
	public Map<String, Object> addWish(HttpSession session, int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");

		try {
			
			productService.addOrRemoveWish(new ConsumerWish(consumer.getConsumer_no(), product_no));
			LOGGER.info("ConsumerMainRestController addWish Success! [product_no=" + product_no + ", consumer_no=" + consumer.getConsumer_no() + "]");
			
			map.put("consumer_no", consumer.getConsumer_no());
			map.put("result", "success");
			
		} catch (Exception e) {
			map.put("result", "error");
			if(consumer == null) {
				map.put("msg", "consumerIsNull");
			} else {
				map.put("msg", e.getMessage());
			}
			
		}
		
		return map;
	}
	
	@RequestMapping("pd/isWish")
	public Map<String, Object> getWishAndCart(HttpSession session, int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer) session.getAttribute("consumer");
		if(consumer == null) {
			return null;
		}
		
		boolean isWish = productService.isExistsWishPd(new ConsumerWish(consumer.getConsumer_no(), product_no));	// true : 이미 찜상태 , false: 찜 X

		map.put("isWish", isWish);
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("pd/addCart")
	public Map<String, Object> addCart(HttpSession session, int product_no, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		try {
			consumerOrderService.addCart(new Cart(consumer.getConsumer_no(), product_no, count));
			map.put("result", "success");
			
		} catch (Exception e) {
			map.put("result", "error");
			
			if(consumer == null) {
				map.put("msg", "consumerIsNull");			
			} else {
				map.put("msg", e.getMessage());
			}
		}
		return map;
	}

	
	@RequestMapping("m/removeOneMySearchLog")
	public Map<String, Object> removeOneMySearchLog(int product_search_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		productService.deleteMySearchLog(product_search_no);
		LOGGER.info("ConsumerMainRestController removeOneMySearchLog! product_search_no=" + product_search_no);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("m/removeAllMySearchLog")
	public Map<String, Object> removeAllMySearchLog(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		productService.deleteMyAllSearchLog(consumer.getConsumer_no());
		LOGGER.info("ConsumerMainRestController removeAllMySearchLog! consumer_no=" + consumer.getConsumer_no());
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("m/getRecentSearchLog")
	public Map<String, Object> getRecentSearchLog(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		if(consumer != null) {
			List<ProductSearchLog> searchLogList = productService.getMyRecentSearchWord(consumer.getConsumer_no());
			LOGGER.info("ConsumerMainRestController getRecentSearchLog! consumer_no=" + consumer.getConsumer_no() + ", searchLogList=" + searchLogList);
			map.put("data", searchLogList);
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@RequestMapping("m/getPopularKeywordList")
	public Map<String, Object> getPopularKeywordList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = productService.getPopularSearchWord();
		
		map.put("data", list);
		map.put("result" , "success");
		return map;
	}
	
	
	@RequestMapping("m/getCategory")
	public Map<String, Object> category() {
		Map<String, Object> map = new HashMap<String, Object>();
		
//		List<ProductCategory> categoryList = productService.getProductCategoryList(null);
//		LOGGER.info("productCategoryList : " + categoryList);
		
//		map.put("data", categoryList);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("m/getProductList")
	public Map<String, Object> productList(String listType, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer) session.getAttribute("consumer");

		List<Map<String, Object>> productList = productService.getProductList(listType, null, null);
		LOGGER.info("productList : " + productList);
		
		List<Map<String, Object>> resultProductList = new ArrayList<Map<String,Object>>();
		boolean isWish = false;
		
		Integer product_no = null;
		for(Map<String, Object> product : productList) {
//			System.out.println("product : " + product.toString());
//			System.out.println("product_no : " + product.get("PRODUCT_NO"));
			
			product_no = Integer.parseInt(String.valueOf(product.get("PRODUCT_NO")));
			isWish = productService.isExistsWishPd(new ConsumerWish(consumer.getConsumer_no(), product_no));
			product.put("isWish", isWish);
			
//			System.out.println("isWish : " + isWish);
			resultProductList.add(product);
		}
		
		LOGGER.info("ConsumerMainRestController getProductList! type=" + listType +  " [" + resultProductList + "]");
		
		map.put("data", resultProductList);
		map.put("result", "success");
		
		return map;
	}
	
	
	
	/**
	 * woojin
	 **/ 
	//오더
	@RequestMapping("orderConfirm")
	public HashMap<String, Object> orderConfirm(HttpServletRequest request, HttpSession session, Order ord, int payment_no, int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//구매확정을 하고
		
		
		//payment에 있는 savepoint를 가져오고  
		int save = consumerOrderService.setSavePoint(payment_no);
		
		int consumerData = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		int orderNo = Integer.parseInt(request.getParameter("order_no"));
		//session에서 consumer에 대한 정보를 가져온 후 필요한건 consumer_no만 필요하니까
		
		//그 지정된 consumer를 consu에 넣고 consu라는 getConsumer_totalpoint와 payment_savepoint를 가져온걸 더하면 됨
		ord.setConsumer_no(consumerData);
		map.put("consumerData", consumerData);
		map.put("orderNo", orderNo);
		if(consumerOrderService.completeDelivery(map) == 1) {
			consumerOrderService.completeConfirmation(ord);
		}
		
		
		Consumer consu = consumerOrderService.selectByNoCon(consumerData);
		
		int sum =  consu.getConsumer_totalpoint()+save;
		consumerOrderService.updatePoint(consumerData, sum);
		consumerOrderService.insertPointLog(consumerData, save);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("orderList")
	public List<Map<String, Object>> orderDetailList(OrderTb order , HttpSession session, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		int payment = Integer.parseInt(request.getParameter("payment_no"));
		
		map.put("consumer_no", consumer.getConsumer_no());
		map.put("payment_no", payment);
		List<Map<String, Object>> data = consumerOrderService.addressPayPriceData(map);
		
		return data;	
	}
	
	
	
	@RequestMapping("st/getReviewByStoreNo")
	public Map<String, Object> reviewList(int store_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> reviewList = productService.getReviewListByStoreNo(store_no);
		LOGGER.info("reviewList : " + reviewList);
		
		map.put("data", reviewList);
		map.put("result", "success");
		
		return map;
	}
	
	
	@RequestMapping("st/getProductByStoreNo")
	public Map<String, Object> getProductList(int store_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> productList = productService.getStoreProductList(store_no);
		map.put("data", productList);
		map.put("result", "success");
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
