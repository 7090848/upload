package com.whm.atelier.vo;

import java.util.Date;

public class CenterBank {
	private int center_bank_no ;
	private int customer_wallet_no ;
	private int center_bank_saving_money ;
	private Date center_bank_date ;


	public CenterBank() {
		super();
	}


	public CenterBank(int center_bank_no, int customer_wallet_no, int center_bank_saving_money, Date center_bank_date) {
		super();
		this.center_bank_no = center_bank_no;
		this.customer_wallet_no = customer_wallet_no;
		this.center_bank_saving_money = center_bank_saving_money;
		this.center_bank_date = center_bank_date;
	}


	public int getCenter_bank_no() {
		return center_bank_no;
	}


	public void setCenter_bank_no(int center_bank_no) {
		this.center_bank_no = center_bank_no;
	}


	public int getCustomer_wallet_no() {
		return customer_wallet_no;
	}


	public void setCustomer_wallet_no(int customer_wallet_no) {
		this.customer_wallet_no = customer_wallet_no;
	}


	public int getCenter_bank_saving_money() {
		return center_bank_saving_money;
	}


	public void setCenter_bank_saving_money(int center_bank_saving_money) {
		this.center_bank_saving_money = center_bank_saving_money;
	}


	public Date getCenter_bank_date() {
		return center_bank_date;
	}


	public void setCenter_bank_date(Date center_bank_date) {
		this.center_bank_date = center_bank_date;
	}
	
	
	
	
	
}
