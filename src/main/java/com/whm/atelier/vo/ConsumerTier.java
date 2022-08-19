package com.whm.atelier.vo;

/**
 * 일반 회원
 등급 VO
 * */
public class ConsumerTier {
	private int consumer_tier_no;
	private String consumer_tier_name;
	private int consumer_tier_achieved_amount;
	private double consumer_tier_save_rate;
	/**
	 * 
	 */
	public ConsumerTier() {
		super();
	}
	
	/**
	 * @param consumer_tier_no
	 * @param consumer_tier_name
	 * @param consumer_tier_achieved_amount
	 * @param consumer_tier_save_rate
	 */
	public ConsumerTier(int consumer_tier_no, String consumer_tier_name,
			int consumer_tier_achieved_amount, double consumer_tier_save_rate) {
		super();
		this.consumer_tier_no = consumer_tier_no;
		this.consumer_tier_name = consumer_tier_name;
		this.consumer_tier_achieved_amount = consumer_tier_achieved_amount;
		this.consumer_tier_save_rate = consumer_tier_save_rate;
	}
	
	public int getConsumer_tier_no() {
		return consumer_tier_no;
	}
	public void setConsumer_tier_no(int consumer_tier_no) {
		this.consumer_tier_no = consumer_tier_no;
	}
	public String getConsumer_tier_name() {
		return consumer_tier_name;
	}
	public void setConsumer_tier_name(String consumer_tier_name) {
		this.consumer_tier_name = consumer_tier_name;
	}
	public int getConsumer_tier_achieved_amount() {
		return consumer_tier_achieved_amount;
	}
	public void setConsumer_tier_achieved_amount(int consumer_tier_achieved_amount) {
		this.consumer_tier_achieved_amount = consumer_tier_achieved_amount;
	}
	public double getConsumer_tier_save_rate() {
		return consumer_tier_save_rate;
	}
	public void setConsumer_tier_save_rate(double consumer_tier_save_rate) {
		this.consumer_tier_save_rate = consumer_tier_save_rate;
	}
	
	@Override
	public String toString() {
		return "ConsumerTier : [consumer_tier_no=" + consumer_tier_no
				+ ", consumer_tier_name=" + consumer_tier_name
				+ ", consumer_tier_achieved_amount=" + consumer_tier_achieved_amount
				+ ", consumer_tier_save_rate=" + consumer_tier_save_rate
				+ "]";
	}
	
}
