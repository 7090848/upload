package com.whm.atelier.vo;

public class CouponMake {
	private int coupon_make_no;
	private int consumer_no;
	private int coupon_no;
	private int admin_no;
	private String coupon_status;
	public CouponMake() {
		super();
	}
	public CouponMake(int coupon_make_no, int consumer_no, int coupon_no, int admin_no, String coupon_status) {
		super();
		this.coupon_make_no = coupon_make_no;
		this.consumer_no = consumer_no;
		this.coupon_no = coupon_no;
		this.admin_no = admin_no;
		this.coupon_status = coupon_status;
	}
	public int getCoupon_make_no() {
		return coupon_make_no;
	}
	public void setCoupon_make_no(int coupon_make_no) {
		this.coupon_make_no = coupon_make_no;
	}
	public int getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}
	
	
}
