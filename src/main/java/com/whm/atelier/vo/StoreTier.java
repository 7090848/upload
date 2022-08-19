package com.whm.atelier.vo;

public class StoreTier {

	   private int store_tier_no ;
	   private String store_tier_name;
	   private int store_tier_achieved_amount;
	   private int store_tier_commition ;
	   
	   public StoreTier() {
			super();
			// TODO Auto-generated constructor stub
		}
	   
	   public StoreTier(int store_tier_no, String store_tier_name, int store_tier_achieved_amount,
				int store_tier_commition) {
			super();
			this.store_tier_no = store_tier_no;
			this.store_tier_name = store_tier_name;
			this.store_tier_achieved_amount = store_tier_achieved_amount;
			this.store_tier_commition = store_tier_commition;
		}
		
	   
	public int getStore_tier_no() {
		return store_tier_no;
	}
	public void setStore_tier_no(int store_tier_no) {
		this.store_tier_no = store_tier_no;
	}
	public String getStore_tier_name() {
		return store_tier_name;
	}
	public void setStore_tier_name(String store_tier_name) {
		this.store_tier_name = store_tier_name;
	}
	public int getStore_tier_achieved_amount() {
		return store_tier_achieved_amount;
	}
	public void setStore_tier_achieved_amount(int store_tier_achieved_amount) {
		this.store_tier_achieved_amount = store_tier_achieved_amount;
	}
	public int getStore_tier_commition() {
		return store_tier_commition;
	}
	public void setStore_tier_commition(int store_tier_commition) {
		this.store_tier_commition = store_tier_commition;
	}
	
}
