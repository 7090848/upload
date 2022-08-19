package com.whm.atelier.vo;

public class ProductImage {
	
	private int pi_no;
	private int product_no;
	private String pi_original_filename;
	private String pi_path;
	private String pi_representive_yn;
	/**
	 * 
	 */
	public ProductImage() {
		super();
	}
	/**
	 * @param pi_no
	 * @param product_no
	 * @param pi_original_filename
	 * @param pi_path
	 * @param pi_representive_yn
	 */
	public ProductImage(int pi_no, int product_no, String pi_original_filename, String pi_path,
			String pi_representive_yn) {
		super();
		this.pi_no = pi_no;
		this.product_no = product_no;
		this.pi_original_filename = pi_original_filename;
		this.pi_path = pi_path;
		this.pi_representive_yn = pi_representive_yn;
	}
	public int getPi_no() {
		return pi_no;
	}
	public void setPi_no(int pi_no) {
		this.pi_no = pi_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getPi_original_filename() {
		return pi_original_filename;
	}
	public void setPi_original_filename(String pi_original_filename) {
		this.pi_original_filename = pi_original_filename;
	}
	public String getPi_path() {
		return pi_path;
	}
	public void setPi_path(String pi_path) {
		this.pi_path = pi_path;
	}
	public String getPi_representive_yn() {
		return pi_representive_yn;
	}
	public void setPi_representive_yn(String pi_representive_yn) {
		this.pi_representive_yn = pi_representive_yn;
	}
	
	@Override
	public String toString() {
		return "ProductImage [pi_no=" + pi_no
				+ ", product_no=" + product_no
				+ ", pi_original_filename=" + pi_original_filename
				+ ", pi_path=" + pi_path
				+ ", pi_representive_yn=" + pi_representive_yn
				+ "]";
	}
}
