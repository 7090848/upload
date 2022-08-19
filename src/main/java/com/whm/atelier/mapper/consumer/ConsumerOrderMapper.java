package com.whm.atelier.mapper.consumer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.Cart;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerPointLog;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Payment;

public interface ConsumerOrderMapper {
	
	// Payment PK 생성
	public int createPaymentPk();
	
	// 장바구니에 추가
	public void addCart(Cart cart);
	
	// 장바구니 조회
	public Cart selectCart(Cart cart);
	
	// 장바구니 수량 변경
	public void modifyProductCnt(@Param("cart_no") int cart_no, 
			@Param("cart_product_count") int cart_product_count);
	
	// 장바구니 제품 삭제
	public void removeCart(int cart_no);
	
	// 장바구니 제품 전체 삭제
	public void removeCartAll(int consumer_no);
	
	// 장바구니 전체 불러오기
	public List<Cart> selectAllCart(int consumer_no);
	
	// 주문하기
	public void insertOrder(Order order);
	
	// 주문내역
	public List<Map<String, Object>> selectOrderList(Map<String, Object> param);
	
	// 결제하기
	public void insertPayment(Payment payment);
	
	//유저가 주문한 리스트
	public List<Map<String, Object>> addressPayPriceData(Map<String, Object> param); 
	
	//유저가 구매한 리스트 상세보기
	public Map<String, Object> addressPayPriceDataDetail(Map<String, Object> param);

	public ArrayList<Order> testList(Order order);
	
	//여기부터 시작
	
	//구매확정
	public void completeConfirmation(Order order);
	
	//중복확인
	public int completeOverlap(int orderTb_no);
	
	//save포인트 값 뺴오기
	public int setSavePoint(int payment_no);
	
	//consumer_no만 가져옴
	public Consumer selectByNoCon(int consumer_no);
	
	public void updatePoint(@Param("consumer_no") int consumer_no, @Param("sum") int sum);
	
	//point_log 기록 insert
	public void insertPointLog(@Param("consumer_no") int consumer_no, @Param("save") int save);
	
	//order 중복확인? purch일경우 리뷰 버튼 활성화 purch가 아닐경우는 기존 버튼 활성화
	public int orderLab(Order param);
	
	public Order orderset(Order param);
	
	public ArrayList<ConsumerPointLog> conPointLog(ConsumerPointLog param);
	
	
	public int completeDelivery(Map<String, Object> param);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
