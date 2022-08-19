package com.whm.atelier.service.consumer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerReviewMapper;
import com.whm.atelier.mapper.coupon.CouponMapper;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerAddress;
import com.whm.atelier.vo.ConsumerPointLog;
import com.whm.atelier.vo.ConsumerTier;
import com.whm.atelier.vo.Coupon;
import com.whm.atelier.vo.CouponMake;
import com.whm.atelier.vo.Review;

@Service
public class ConsumerServiceImpl {

	@Autowired
	private ConsumerMainMapper consumerMainMapper;
	
	@Autowired
	private CouponMapper couponMapper;
	
	@Autowired
	private AdminMainMapper adminMainMapper;
	
	@Autowired
	private ConsumerReviewMapper consumerReviewMapper;
	
	// consumer_no pk
	public int createConsumerPk() {
		return consumerMainMapper.createConsumerPk();
	}
	
	// 로그인
	public Consumer login(Consumer param) {
		Consumer consumer = consumerMainMapper.selectByIdAndPw(param);
		return consumer;
	}
	
	// 회원가입
	public void register(Consumer param) {
		
		try {

			/**
			 * 추천인 코드 입력 시 로직
			 *  
			 */
			
			// 적립금 기본 0원
			param.setConsumer_totalpoint(0);
			
			// 내 추천인 코드 생성
			String recommendCode = RandomStringUtils.randomAlphabetic(10);
			param.setConsumer_rec_code(recommendCode);
			
			// 입력한 추천인 코드
			String inputRecCode = param.getConsumer_input_rec_code();
			
			if(inputRecCode != null) {
				Consumer recommender = getConsumerByRecCode(inputRecCode);
			
				if(recommender != null) {	// 추천인이 존재 한다면 포인트 적립
					int savePoint = 2000;	// 양측 적립금
					
					// 추천한 회원 포인트 적립
					updateConsumerPoint(recommender.getConsumer_no(), savePoint);
					// 추천받은 회원
					param.setConsumer_totalpoint(savePoint);
				}
			}
			
			consumerMainMapper.register(param);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원번호로 전체 정보 출력
	public Consumer getConsumerInfo(int consumer_no) {
		return consumerMainMapper.selectByConsumerNo(consumer_no);
	}
	
	// 추천인 코드로 회원정보 찾기
	public Consumer getConsumerByRecCode(String recommendCode) {
		return consumerMainMapper.selectByRecCode(recommendCode);
	}
	
	// 추천인 회원 입력 될 시 추천한 회원 포인트 적립
	public void updateConsumerPoint(int consumer_no, int point) {
		consumerMainMapper.updateConsumerPoint(consumer_no, point);
	}
	
	// 아이디로 회원 존재여부 확인(중복체크)
	public boolean isExistConsumerId(String consumer_id) {
		
		Consumer consumer = consumerMainMapper.selectByIdAndPw(new Consumer(consumer_id, null));
		if(consumer != null) {
			return true;
		}
		return false;
	}
	
	// 회원 등급 변경
	public void updateConsumerTier(int consumer_tier_no, int consumer_no) {
		consumerMainMapper.updateConsumerTier(consumer_tier_no, consumer_no);
	}
	
	// 등급별 정보 조회
	public ConsumerTier selectConsumerTier(int consumer_tier_no) {
		return consumerMainMapper.selectConsumerTier(consumer_tier_no);
	}
	
	// 회원 배송지 정보 조회
	public ConsumerAddress selectConsumerAddress(int consumer_no) {
		return consumerMainMapper.selectConsumerAddress(consumer_no);
	}
	
	// 포인트 사용/차감 로그 추가
	public void insertConsumerPointLog(ConsumerPointLog consumerPointLog) {
		consumerMainMapper.insertConsumerPointLog(consumerPointLog);
	}
	
	public List<Map<String, Object>> couponList(Map<String, Object> param){
		System.out.println(param);
		System.out.println("service" + couponMapper.selectAllCouMake(param));
		return couponMapper.selectAllCouMake(param);
	}
		
	//만료된 유저의 쿠폰 리스트 전체 출력
	public ArrayList<HashMap<String, Object>> conCouponExpiredList(int consumer_no){
		ArrayList<HashMap<String, Object>> conExpiredCouponList = new ArrayList<HashMap<String,Object>>();
		ArrayList<CouponMake> couponExList = couponMapper.expiredConsumerCoupon(consumer_no);
		
		for(CouponMake couponMake : couponExList) {
			int couponNo = couponMake.getCoupon_no();
			Coupon coupon = couponMapper.selectByNoCoupon(couponNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("coupon", coupon);
			map.put("couponMake", couponMake);
			conExpiredCouponList.add(map);
		}
		
		return conExpiredCouponList;
	}
		
		//쿠폰테이블의 전체 데이터
		public HashMap<String, Object> couponMakeData(int coupon_make_no) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			CouponMake couponMake = couponMapper.selectByNoCouMake(coupon_make_no);
			int adminNo = couponMake.getAdmin_no();
			Admin admin = adminMainMapper.selectByNoAd(adminNo);
			
			
			int consumerNo = couponMake.getConsumer_no();
			Consumer consumer = consumerMainMapper.selectByNoCon(consumerNo);
			int couponNo = couponMake.getCoupon_no();
			Coupon coupon = couponMapper.selectByNoCoupon(couponNo);
			
			map.put("couponMake", couponMake);
			map.put("admin", admin);
			map.put("consumer", consumer);
			map.put("coupon", coupon);
			
			return map;
		}

		public int selectOverLap(CouponMake couponMake) {
			return couponMapper.selectOverLap(couponMake);
		}
		
		public void giveToCoupon(CouponMake couponMake) {
			couponMapper.giveToCoupon(couponMake);
		}
		
		public ArrayList<Coupon> consumerCoupon_list() {
			ArrayList<Coupon> data = couponMapper.selectAllCou();
			return data;
		}
		
		public int remainingCouponCount(int coupon_no) {
			return couponMapper.remainingCouponCount(coupon_no);	
		}
		
		public void firstComeExpiredCouponsv(int coupon_no) {
			couponMapper.firstComeExpiredCoupon(coupon_no);
		}
		
		public List<Map<String, Object>> myReview(Map<String, Object> param){
			return consumerReviewMapper.myReview(param);
		}
		//리뷰 시작
		
		//리뷰 리스트 마이 페이지에 있는 리뷰 
		
		//별 색채우기
		public int starReview(Review review_no) {
			return consumerReviewMapper.starReview(review_no);
		}
		
		
		public Review myReviewData(Review param){
			return consumerReviewMapper.myReviewData(param);
		}
		
		public void insertReview(Review param) {
			consumerReviewMapper.insertReview(param);
		}
		
		public List<Map<String, Object>> myWishList(Map<String, Object> param){
			return consumerReviewMapper.myWishList(param);
		}
		
		public int myCouponCount(int param){
			
			return couponMapper.myCouponCount(param);
		}
		
		public Map<String, Object> myTierInfo(Map<String, Object> param){
			return consumerMainMapper.myTierInfo(param);
		}
		
		public int avgReview(int param) {
			return consumerReviewMapper.avgReview(param);
		}
		
		public Review reviewIns(Review param) {
			return consumerReviewMapper.reviewIns(param);
		}
	
}
