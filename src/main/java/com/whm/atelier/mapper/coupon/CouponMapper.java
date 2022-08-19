package com.whm.atelier.mapper.coupon;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.whm.atelier.vo.Coupon;
import com.whm.atelier.vo.CouponMake;

public interface CouponMapper {
	
	public void insertCoupon(Coupon coupon);

	public ArrayList<Coupon> selectAllCou();
	
	public void deleteCoupon(int coupon_no);
	
	//지정 couponMake no 전체
	public CouponMake selectByNoCouMake(int coupon_make_no);
	
	//지정 coupon no 전체
	public Coupon selectByNoCoupon(int coupon_no);
	
//	//지정 couponMakeList 전체
//	public ArrayList<CouponMake> selectAllCouMake();
	
	public List<Map<String, Object>> selectAllCouMake(Map<String, Object>  param);
	
//	구현 해야할것
	//유저에게 쿠폰 주기
	public void giveToCoupon(CouponMake couponMake);
	//중복 확인 쿠폰
	public int selectOverLap(CouponMake couponMake);
	
	//선착순 쿠폰 
	public void firstComeExpiredCoupon(int couponMake_no);
	
	//유저가 사용, 만료된 쿠폰 리스트 출력
	public ArrayList<CouponMake> expiredConsumerCoupon(int consumer_no);

	//int 남은 카운트 개수
	public int remainingCouponCount(int coupon_no);
	
	public int myCouponCount(int consumer_no);
	
	
	
//	public CouponMake remainingCouponCount(CouponMake CouponMake);

	
	
}
