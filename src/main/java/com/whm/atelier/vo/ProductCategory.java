package com.whm.atelier.vo;

public class ProductCategory {
	private Integer product_category_no;
	private String product_category_name;
	private String product_category_image_path;
	
	/**
	 * 
	 */
	public ProductCategory() {
		super();
	}

	/**
	 * @param product_category_no
	 * @param product_category_name
	 * @param product_category_image_path
	 */
	public ProductCategory(Integer product_category_no, String product_category_name, String product_category_image_path) {
		super();
		this.product_category_no = product_category_no;
		this.product_category_name = product_category_name;
		this.product_category_image_path = product_category_image_path;
	}

	public Integer getProduct_category_no() {
		return product_category_no;
	}

	public void setProduct_category_no(Integer product_category_no) {
		this.product_category_no = product_category_no;
	}

	public String getProduct_category_name() {
		return product_category_name;
	}

	public void setProduct_category_name(String product_category_name) {
		this.product_category_name = product_category_name;
	}

	public String getProduct_category_image_path() {
		return product_category_image_path;
	}

	public void setProduct_category_image_path(String product_category_image_path) {
		this.product_category_image_path = product_category_image_path;
	}

	@Override
	public String toString() {
		return "ProductCategory [product_category_no=" +product_category_no
				+ ", product_category_name=" + product_category_name
				+ ", product_category_image_path=" + product_category_image_path
				+ "]";
	}
}
