package com.whm.atelier.vo;

import java.util.Date;

public class CustomerCenter {

	private int cus_center_no;
	private int customer_no;
	private int admin_no;
	private String cus_center_title;
	private String cus_center_content;
	private String cus_center_comment_by_admin;
	private Date cus_center_writedate;
	private Date cus_center_writedate_by_admin;
	private String cus_center_category_yn;
	
	public CustomerCenter() {
		super();
	}

	public CustomerCenter(int cus_center_no, int customer_no, int admin_no, String cus_center_title,
			String cus_center_content, String cus_center_comment_by_admin, Date cus_center_writedate,
			Date cus_center_writedate_by_admin, String cus_center_category_yn) {
		super();
		this.cus_center_no = cus_center_no;
		this.customer_no = customer_no;
		this.admin_no = admin_no;
		this.cus_center_title = cus_center_title;
		this.cus_center_content = cus_center_content;
		this.cus_center_comment_by_admin = cus_center_comment_by_admin;
		this.cus_center_writedate = cus_center_writedate;
		this.cus_center_writedate_by_admin = cus_center_writedate_by_admin;
		this.cus_center_category_yn = cus_center_category_yn;
	}

	public int getCus_center_no() {
		return cus_center_no;
	}

	public void setCus_center_no(int cus_center_no) {
		this.cus_center_no = cus_center_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getCus_center_title() {
		return cus_center_title;
	}

	public void setCus_center_title(String cus_center_title) {
		this.cus_center_title = cus_center_title;
	}

	public String getCus_center_content() {
		return cus_center_content;
	}

	public void setCus_center_content(String cus_center_content) {
		this.cus_center_content = cus_center_content;
	}

	public String getCus_center_comment_by_admin() {
		return cus_center_comment_by_admin;
	}

	public void setCus_center_comment_by_admin(String cus_center_comment_by_admin) {
		this.cus_center_comment_by_admin = cus_center_comment_by_admin;
	}

	public Date getCus_center_writedate() {
		return cus_center_writedate;
	}

	public void setCus_center_writedate(Date cus_center_writedate) {
		this.cus_center_writedate = cus_center_writedate;
	}

	public Date getCus_center_writedate_by_admin() {
		return cus_center_writedate_by_admin;
	}

	public void setCus_center_writedate_by_admin(Date cus_center_writedate_by_admin) {
		this.cus_center_writedate_by_admin = cus_center_writedate_by_admin;
	}

	public String getCus_center_category_yn() {
		return cus_center_category_yn;
	}

	public void setCus_center_category_yn(String cus_center_category_yn) {
		this.cus_center_category_yn = cus_center_category_yn;
	}	
	
}
