package com.whm.atelier.service.consumer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.consumer.ConsumerMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerOrderMapper;
import com.whm.atelier.vo.Cart;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerPointLog;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Payment;

@Service
public class ConsumerOrderServiceImpl {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ConsumerOrderServiceImpl.class);
	
	@Autowired
	private ConsumerOrderMapper consumerOrderMapper;
	@Autowired
	private ConsumerMainMapper consumerMainMapper;
	
	// Payment PK 생성
	public int createPaymentPk() {
		return consumerOrderMapper.createPaymentPk();
	}
	
	// 장바구니에 추가
	public void addCart(Cart param) {
		Cart cart = getCart(param);
		
		if(cart != null) {
			// 이미 장바구니에 담긴 상품일 때 수량 증가
			int count = cart.getCart_product_count() + param.getCart_product_count();
			modifyProductCnt(cart.getCart_no(), count);
			
		} else {
			// 장바구니에 없는 상품 insert
			consumerOrderMapper.addCart(param);
		}
	}
	
	// 장바구니 출력
	public Cart getCart(Cart param) {
		return consumerOrderMapper.selectCart(param);
	}
	
	// 장바구니 수량 변경
	public void modifyProductCnt(int cart_no, int cart_product_count) {
		consumerOrderMapper.modifyProductCnt(cart_no, cart_product_count);
	}
	
	// 장바구니 제품 삭제
	public void removeCart(int cart_no) {
		consumerOrderMapper.removeCart(cart_no);
	}
	
	// 장바구니 제품 전체 삭제
	public void removeCartAll(int consumer_no) {
		consumerOrderMapper.removeCartAll(consumer_no);
	}
	
	// 장바구니 전체 불러오기
	public List<Cart> selectAllCart(int consumer_no) {
		List<Cart> cartList = null;
		try {
			cartList = consumerOrderMapper.selectAllCart(consumer_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cartList;
	}
	
	// 주문하기
	public void setOrder(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO: 배송지 보류~~~~~~~~~~~~~~~~~~~~~~~
		/*
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		String addrName = request.getParameter("addrName");
		String addrPhone = request.getParameter("addrPhone");
		String addrPostcd = request.getParameter("addrPostcd");
		String addrStreetAddr = request.getParameter("addrStreetAddr");
		String addrDetailAddr = request.getParameter("addrDetailAddr");
		String addrMsg = request.getParameter("addrMsg");
		*/
		
		Map<String, Object> orderData = (Map<String, Object>) session.getAttribute("order");
		List<Cart> cartList = (List<Cart>) orderData.get("cartList");
		Consumer consumer = (Consumer) session.getAttribute("consumer");
		
		// TODO: 쿠폰/포인트 사용
		int useCouponPrice = Integer.parseInt(request.getParameter("use_coupon"));
		int usePointPrice = Integer.parseInt(request.getParameter("use_point"));
		
		// TODO: 결제 타입
		String payType = request.getParameter("payType");
		
		// 금액
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int postPrice = Integer.parseInt(request.getParameter("postPrice"));
		int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int savePoint = Integer.parseInt(request.getParameter("savePoint"));
		
		Order order = new Order();
		List<Order> orderList = new ArrayList<Order>();
		int paymentPk = createPaymentPk();

		String orderNumber = String.valueOf(System.currentTimeMillis());
		orderNumber = orderNumber.substring(5, orderNumber.length());
		
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("order");
		map.put("totalProductPrice", productPrice);
		map.put("totalPostPrice", postPrice);
		map.put("totalOrderPrice", totalPrice);
		map.put("savePoint", savePoint);
		
		try {
			// Order 주문 Insert
			for(Cart cart : cartList) {
				order.setProduct_no(cart.getProduct_no());
				order.setPayment_no(paymentPk);
				order.setConsumer_no(consumer.getConsumer_no());
				order.setOrder_product_count(cart.getCart_product_count());
				order.setOrder_number(orderNumber);
				consumerOrderMapper.insertOrder(order);
				orderList.add(order);
				LOGGER.info("consumerOrderMapper insertOrder Success! Order[" + order.toString() + "]");
			}
			
			
			map.put("orderNumber", orderNumber);
			session.setAttribute("order", map);
			
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
			
		Payment payment = new Payment();
		try {
			
			int totalPoint = consumer.getConsumer_totalpoint();
			totalPoint -= usePointPrice;	// 포인트 사용금액차감
			consumer.setConsumer_totalpoint(totalPoint);
			session.setAttribute("consumer", consumer);
			
			// 포인트 사용 로그 추가
			int point = usePointPrice * -1;
			consumerMainMapper.insertConsumerPointLog(new ConsumerPointLog(consumer.getConsumer_no(), point));
			
			// Payment 결제
			payment.setPayment_no(paymentPk);
			payment.setPayment_origin_price(productPrice + postPrice);
			payment.setPayment_use_point(usePointPrice);
			payment.setPayment_use_coupon(useCouponPrice);
			payment.setPayment_total_price(totalPrice);
			payment.setPayment_savepoint(savePoint);
			payment.setOrderList(orderList);
			
			insertPayment(payment);
			LOGGER.info("consumerOrderMapper insertPayment Success! Payment[" + payment.toString() + "]");
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		
	}
	
	// 주문내역 불러오기
	public List<Map<String, Object>> selectOrderList(Map<String, Object> param) {
		return consumerOrderMapper.selectOrderList(param);
	}
	
	// 결제하기
	public void insertPayment(Payment param) {
		consumerOrderMapper.insertPayment(param);
	}
	
	public List<Map<String, Object>> addressPayPriceData(Map<String, Object> param){
		
		return consumerOrderMapper.addressPayPriceData(param);
	}
	
	public Map<String, Object> addressPayPriceDataDetail(Map<String, Object> param) {
		return consumerOrderMapper.addressPayPriceDataDetail(param);
	}
	
	//구매 확정
	public void completeConfirmation(Order order) {
		consumerOrderMapper.completeConfirmation(order);
	}
	
	
	public int completeOverlap(int orderTb_no) {
		return consumerOrderMapper.completeOverlap(orderTb_no);
	}
	
	public int setSavePoint(int payment_no) {
		return consumerOrderMapper.setSavePoint(payment_no);
	}
	//리턴값 Consumer 받고자 하는것
	public Consumer selectByNoCon(int consumer_no) {
		return consumerOrderMapper.selectByNoCon(consumer_no);
	}
	
	public void updatePoint(int consumer_no, int sum) {
		consumerOrderMapper.updatePoint(consumer_no, sum);
	}
	
	public void insertPointLog(int consumer_no, int save) {
		consumerOrderMapper.insertPointLog(consumer_no, save);
	}
	//구매확정 중복금지 이미 있는경우 
	public Order orderLab(Order order) {
	
		System.out.println("service: " + order);
		System.out.println(consumerOrderMapper.orderset(order));
		
		return  consumerOrderMapper.orderset(order);
	}
	
	public ArrayList<ConsumerPointLog> conPointLog(ConsumerPointLog param) {
		return consumerOrderMapper.conPointLog(param);
	}
	
	public int completeDelivery (Map<String, Object> param){
		return consumerOrderMapper.completeDelivery(param);
	}
	
	
	
}
