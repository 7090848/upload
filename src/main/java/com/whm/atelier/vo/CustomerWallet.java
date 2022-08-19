package com.whm.atelier.vo;

import java.util.Date;

public class CustomerWallet {

	private int customer_wallet_no;
	private int customer_no;
	private String customer_wallet_account;
	private String customer_wallet_bank_name;
	private int customer_wallet_money;
	private Date customer_wallet_date;
	public CustomerWallet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomerWallet(int customer_wallet_no, int customer_no, String customer_wallet_account,
			String customer_wallet_bank_name, int customer_wallet_money, Date customer_wallet_date) {
		super();
		this.customer_wallet_no = customer_wallet_no;
		this.customer_no = customer_no;
		this.customer_wallet_account = customer_wallet_account;
		this.customer_wallet_bank_name = customer_wallet_bank_name;
		this.customer_wallet_money = customer_wallet_money;
		this.customer_wallet_date = customer_wallet_date;
	}
	public int getCustomer_wallet_no() {
		return customer_wallet_no;
	}
	public void setCustomer_wallet_no(int customer_wallet_no) {
		this.customer_wallet_no = customer_wallet_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_wallet_account() {
		return customer_wallet_account;
	}
	public void setCustomer_wallet_account(String customer_wallet_account) {
		this.customer_wallet_account = customer_wallet_account;
	}
	public String getCustomer_wallet_bank_name() {
		return customer_wallet_bank_name;
	}
	public void setCustomer_wallet_bank_name(String customer_wallet_bank_name) {
		this.customer_wallet_bank_name = customer_wallet_bank_name;
	}
	public int getCustomer_wallet_money() {
		return customer_wallet_money;
	}
	public void setCustomer_wallet_money(int customer_wallet_money) {
		this.customer_wallet_money = customer_wallet_money;
	}
	public Date getCustomer_wallet_date() {
		return customer_wallet_date;
	}
	public void setCustomer_wallet_date(Date customer_wallet_date) {
		this.customer_wallet_date = customer_wallet_date;
	}

	
}
