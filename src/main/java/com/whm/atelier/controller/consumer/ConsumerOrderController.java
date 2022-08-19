package com.whm.atelier.controller.consumer;

import java.util.ArrayList;
import java.util.Enumeration;
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

import com.whm.atelier.service.consumer.ConsumerOrderServiceImpl;
import com.whm.atelier.service.consumer.ConsumerServiceImpl;
import com.whm.atelier.vo.Cart;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerPointLog;
import com.whm.atelier.vo.ConsumerTier;
import com.whm.atelier.vo.Order;

@Controller
@RequestMapping("/consumer/*")
public class ConsumerOrderController {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ConsumerMainController.class);
	
	@Autowired
	private ConsumerServiceImpl consumerService;
	@Autowired
	private	ConsumerOrderServiceImpl consumerOrderService;

	@RequestMapping("cart/myCart")
	public String cart(HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		try {
				
			Consumer loginConsumer = (Consumer) session.getAttribute("consumer");
			
			List<Cart> cartList = consumerOrderService.selectAllCart(loginConsumer.getConsumer_no());
			
			LOGGER.info("consumerOrderService.selectAllCart Success! [cartList=" + cartList.toString() + "]");
			
			int totalProductPrice = 0;	// 전체 제품 가격
			int totalPostPrice = 0;		// 전체 배송비 가격
			int totalOrderPrice = 0;	// 총 결제 금액
	
			if(cartList != null && cartList.size() > 0) {
				for(Cart item : cartList) {
					totalProductPrice += item.getProduct_price();
					totalPostPrice += item.getProduct_post_price();
				}
				
				totalOrderPrice = totalProductPrice + totalPostPrice;
			}
			
			model.addAttribute("cartList", cartList);
			model.addAttribute("totalProductPrice", totalProductPrice);
			model.addAttribute("totalPostPrice", totalPostPrice);

			map.put("cartList", cartList);
			map.put("totalProductPrice", totalProductPrice);
			map.put("totalPostPrice", totalPostPrice);
			map.put("totalOrderPrice", totalOrderPrice);
			
			session.setAttribute("order", map);
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			
		}
		
		return "consumer/cart/myCart";
	}
	
	@RequestMapping("cart/removeProductProcess")
	public String removeCart(int cart_no) {
		
		try {
			consumerOrderService.removeCart(cart_no);
			LOGGER.info("consumerOrderService.removeCart Success! [cart_no=" + cart_no + "]");
			
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.info("consumerOrderService.removeCart Error! [cart_no=" + cart_no + "]");
		}
		return "redirect:./myCart";
	}
	
	@RequestMapping("cart/modifyProductCntProcess")
	public String modifyProductCnt(int cart_no, int cart_product_count) {
		
		try {
			consumerOrderService.modifyProductCnt(cart_no, cart_product_count);
			LOGGER.info("consumerOrderService.modifyProductCnt Success! [cart_no=" + cart_no + ", cart_product_count=" + cart_product_count + "]");
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.info("consumerOrderService.modifyProductCnt Error! [cart_no=" + cart_no + ", cart_product_count=" + cart_product_count + "]");
		}
		
		return "redirect:./myCart";
	}
	
	@RequestMapping("p/pay")
	public String pay(HttpSession session, Model model) {
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("order");
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		if(consumer == null) {
			return "redirect:../lg/login";
		}
		
		/**
		 * 구매 적립금
		 **/
		ConsumerTier tier = consumerService.selectConsumerTier(consumer.getConsumer_tier_no());
		int totalOrderPrice = (int) map.get("totalOrderPrice");
		double saveRate = tier.getConsumer_tier_save_rate() * 0.01;	// 적립률
		int savePoint = (int)Math.ceil(totalOrderPrice * saveRate);	// 구매 적립금
		map.put("savePoint", savePoint);
		
		return "consumer/p/pay";
	}
	
	@RequestMapping("p/payProcess")
	public String payProcess(HttpServletRequest request, HttpSession session) {
		Enumeration<String> paramKeys = request.getParameterNames();
		while(paramKeys.hasMoreElements()) {
			String key = paramKeys.nextElement();
			LOGGER.info(key + " : " + request.getParameter(key));
		}
		
		try {
			consumerOrderService.setOrder(request, session);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("consumerOrderMapper insertPayment Error!");
		}
		
		return "redirect:./completePay";
	}
	
	@RequestMapping("p/completePay")
	public String completePay(HttpSession session, Model model) {
		
		Map<String, Object> sessionOrder = (Map<String, Object>) session.getAttribute("order");
		
		model.addAttribute("order", sessionOrder);
		session.removeAttribute("order");
		
		// 장바구니 비우기
		Consumer consumer = (Consumer) session.getAttribute("consumer");
		consumerOrderService.removeCartAll(consumer.getConsumer_no());
		
		return "consumer/p/completePay";
	}
	
	//내가 구매한 오더만 출력
	//HttpServletRequest request로 한다
	//request.getparameter("컬럼 이름")
	
	//내가 주문한 구매 리스트
	@RequestMapping("mp/orderList")
	public String orderList(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Consumer consumer = (Consumer)session.getAttribute("consumer");
//			System.out.println(consumer.toString());
		//session으로 받아온값 출력
		map.put("consumer_no", consumer.getConsumer_no());
		System.out.println("map입니다" + map);
		System.out.println("컨슈머 입니다." + consumer);
		List<Map<String, Object>> data = consumerOrderService.addressPayPriceData(map);
		System.out.println("오더리스트 : " + data);
		//Map으로 받을때는 대문자로 받아야됨
		//다른것도 똑같음
//			System.out.println(data);
		//Map안에 있는 값 출력
		model.addAttribute("data",data);
		return"consumer/mp/orderList";
	}
	
	@RequestMapping("mp/orderDetailList")
	public String orderDetailList(Order order , Model model, HttpSession session, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		
		int orderNo = Integer.parseInt(request.getParameter("order_no"));
		int payment = Integer.parseInt(request.getParameter("payment_no"));

		map.put("consumer_no", consumer.getConsumer_no());
		map.put("payment_no", payment);
		map.put("order_no", orderNo);
		Map<String, Object> address = consumerOrderService.addressPayPriceDataDetail(map);
		model.addAttribute("address", address);
		return"consumer/mp/orderDetailList";	
	}
	
	@RequestMapping("mp/conPointLog")
	public String conPointLog(ConsumerPointLog consumerPointLog, Model model, HttpSession session) {
		int consumerNo = ((Consumer)session.getAttribute("consumer")).getConsumer_no();
		consumerPointLog.setConsumer_no(consumerNo);
		ArrayList<ConsumerPointLog> list = consumerOrderService.conPointLog(consumerPointLog);
		System.out.println("list 출력 : " + list);
		model.addAttribute("list", list);
		System.out.println("model 출력 : " + model);
		return "consumer/mp/conPointLog";
	}
		
		
		
		
	
	
}
