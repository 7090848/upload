package com.whm.atelier.vo;

public class ConsumerAddress {
	private int address_no;
	private int consumer_no;
	private String address_postcd;
	private String address_street_addr;
	private String address_detail_addr;
	private String address_name;
	private String address_phone;
	private String address_message;
	/**
	 * 
	 */
	public ConsumerAddress() {
		super();
	}
	/**
	 * @param address_no
	 * @param consumer_no
	 * @param address_postcd
	 * @param address_street_addr
	 * @param address_detail_addr
	 * @param address_name
	 * @param address_phone
	 * @param address_message
	 */
	public ConsumerAddress(int address_no, int consumer_no, String address_postcd, String address_street_addr,
			String address_detail_addr, String address_name, String address_phone, String address_message) {
		super();
		this.address_no = address_no;
		this.consumer_no = consumer_no;
		this.address_postcd = address_postcd;
		this.address_street_addr = address_street_addr;
		this.address_detail_addr = address_detail_addr;
		this.address_name = address_name;
		this.address_phone = address_phone;
		this.address_message = address_message;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public int getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	public String getAddress_postcd() {
		return address_postcd;
	}
	public void setAddress_postcd(String address_postcd) {
		this.address_postcd = address_postcd;
	}
	public String getAddress_street_addr() {
		return address_street_addr;
	}
	public void setAddress_street_addr(String address_street_addr) {
		this.address_street_addr = address_street_addr;
	}
	public String getAddress_detail_addr() {
		return address_detail_addr;
	}
	public void setAddress_detail_addr(String address_detail_addr) {
		this.address_detail_addr = address_detail_addr;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_phone() {
		return address_phone;
	}
	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}
	public String getAddress_message() {
		return address_message;
	}
	public void setAddress_message(String address_message) {
		this.address_message = address_message;
	}
	
	@Override
	public String toString() {
		return "ConsumerAddress : [address_no=" + address_no
				+ "consumer_no=" + consumer_no
				+ "address_postcd=" + address_postcd
				+ "address_street_addr=" + address_street_addr
				+ "address_detail_addr=" + address_detail_addr
				+ "address_name=" + address_name
				+ "address_phone=" + address_phone
				+ "address_message=" + address_message
				+ "]";
	}
}
