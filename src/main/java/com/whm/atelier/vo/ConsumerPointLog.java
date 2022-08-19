package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ConsumerPointLog {
	private int point_log_no;
	private int consumer_no;
	private int point_price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date point_date;
	
	/**
	 * 
	 */
	public ConsumerPointLog() {
		super();
	}
	
	/**
	 * @param consumer_no
	 * @param point_price
	 */
	public ConsumerPointLog(int consumer_no, int point_price) {
		this.consumer_no = consumer_no;
		this.point_price = point_price;
	}
	
	/**
	 * @param point_log_no
	 * @param consumer_no
	 * @param point_price
	 * @param point_date
	 */
	public ConsumerPointLog(int point_log_no, int consumer_no, int point_price, Date point_date) {
		super();
		this.point_log_no = point_log_no;
		this.consumer_no = consumer_no;
		this.point_price = point_price;
		this.point_date = point_date;
	}
	public int getPoint_log_no() {
		return point_log_no;
	}
	public void setPoint_log_no(int point_log_no) {
		this.point_log_no = point_log_no;
	}
	public int getConsumer_no() {
		return consumer_no;
	}
	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	
	@Override
	public String toString() {
		return "Consumer_point_log : [point_log_no=" + point_log_no
				+ "consumer_no=" + consumer_no
				+ "point_price=" + point_price
				+ "point_date=" + point_date
				+ "]";
	}
	
	
}
