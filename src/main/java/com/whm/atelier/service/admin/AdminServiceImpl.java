package com.whm.atelier.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerMainMapper;
import com.whm.atelier.mapper.coupon.CouponMapper;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Coupon;

@Service
public class AdminServiceImpl {

	@Autowired
	private AdminMainMapper adminMainMapper;
	
	@Autowired
	private ConsumerMainMapper consumerMainMapper;
	
	@Autowired
	private CouponMapper couponMapper;
	
	
	
	public Admin login(Admin param) {
		Admin admin = adminMainMapper.selectByIdAndPw(param);
		return admin;
	}
	
	public void createCoupon(Coupon coupon) {
		couponMapper.insertCoupon(coupon);
	}
	
	public ArrayList<Coupon> adminCouponList() {
		ArrayList<Coupon> data = couponMapper.selectAllCou();
		return data;
	}
	
	
	public void couponDelete(int coupon_no) {
		couponMapper.deleteCoupon(coupon_no);
	}
	
	public ArrayList<Consumer> consumerList(){
		ArrayList<Consumer> data = consumerMainMapper.selectAllCon();
		return data;
	}
	
	
//	쿠폰관련된 모든 데이터
	public HashMap<String, Object> consumerData(int consumer_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Consumer conResult = consumerMainMapper.selectByNoCon(consumer_no); 
		map.put("conResult", conResult);
		return map;
	}
	public List<Map<String, Object>> totalGetPrice(){
		return adminMainMapper.totalGetPrice();
	}
	
	
	
}
