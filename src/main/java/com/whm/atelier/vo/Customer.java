package com.whm.atelier.vo;

import java.util.Date;

public class Customer {
	private int customer_no;
	private String customer_id;
	private String customer_pw;
	private String customer_name;
	private String customer_email;
	private String customer_business_number;
	private Date customer_joindate;
	private String customer_delete_yn;
	private String customer_confirm_yn;
	/**
	 * 
	 */
	public Customer() {
		super();
	}
	
	public Customer(String customer_id, String customer_pw) {
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
	}

	/**
	 * @param customer_no
	 * @param customer_id
	 * @param customer_pw
	 * @param customer_name
	 * @param customer_email
	 * @param customer_business_number
	 * @param customer_joindate
	 * @param customer_delete_yn
	 * @param customer_confirm_yn
	 */
	public Customer(int customer_no, String customer_id, String customer_pw, String customer_name,
			String customer_email, String customer_business_number, Date customer_joindate, String customer_delete_yn,
			String customer_confirm_yn) {
		super();
		this.customer_no = customer_no;
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_name = customer_name;
		this.customer_email = customer_email;
		this.customer_business_number = customer_business_number;
		this.customer_joindate = customer_joindate;
		this.customer_delete_yn = customer_delete_yn;
		this.customer_confirm_yn = customer_confirm_yn;
	}
	
	
	
	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_business_number() {
		return customer_business_number;
	}

	public void setCustomer_business_number(String customer_business_number) {
		this.customer_business_number = customer_business_number;
	}

	public Date getCustomer_joindate() {
		return customer_joindate;
	}

	public void setCustomer_joindate(Date customer_joindate) {
		this.customer_joindate = customer_joindate;
	}

	public String getCustomer_delete_yn() {
		return customer_delete_yn;
	}

	public void setCustomer_delete_yn(String customer_delete_yn) {
		this.customer_delete_yn = customer_delete_yn;
	}

	public String getCustomer_confirm_yn() {
		return customer_confirm_yn;
	}

	public void setCustomer_confirm_yn(String customer_confirm_yn) {
		this.customer_confirm_yn = customer_confirm_yn;
	}

	@Override
	public String toString() {
		return "Customer[customer_no=" + customer_no
				+ "customer_id=" + customer_id
				+ "customer_pw=" + customer_pw
				+ "customer_name=" + customer_name
				+ "customer_email=" + customer_email
				+ "customer_business_number=" + customer_business_number
				+ "customer_joindate=" + customer_joindate
				+ "customer_delete_yn=" + customer_delete_yn
				+ "customer_confirm_yn=" + customer_confirm_yn
				+ "]";
	}
}
