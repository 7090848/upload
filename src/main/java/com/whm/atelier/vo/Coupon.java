package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Coupon {
	private int coupon_no;
	private String coupon_name;
	private int coupon_saleprice;
//	private String coupon_img_original_name;
//	private String coupon_link;
	private String coupon_img;
	private int coupon_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_lastdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_startdate;
	public Coupon() {
		super();
	}
	public Coupon(int coupon_no, String coupon_name, int coupon_saleprice, String coupon_img, int coupon_count,
			Date coupon_lastdate, Date coupon_startdate) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_saleprice = coupon_saleprice;
		this.coupon_img = coupon_img;
		this.coupon_count = coupon_count;
		this.coupon_lastdate = coupon_lastdate;
		this.coupon_startdate = coupon_startdate;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_saleprice() {
		return coupon_saleprice;
	}
	public void setCoupon_saleprice(int coupon_saleprice) {
		this.coupon_saleprice = coupon_saleprice;
	}
	public String getCoupon_img() {
		return coupon_img;
	}
	public void setCoupon_img(String coupon_img) {
		this.coupon_img = coupon_img;
	}
	public int getCoupon_count() {
		return coupon_count;
	}
	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}
	public Date getCoupon_lastdate() {
		return coupon_lastdate;
	}
	public void setCoupon_lastdate(Date coupon_lastdate) {
		this.coupon_lastdate = coupon_lastdate;
	}
	public Date getCoupon_startdate() {
		return coupon_startdate;
	}
	public void setCoupon_startdate(Date coupon_startdate) {
		this.coupon_startdate = coupon_startdate;
	}
}