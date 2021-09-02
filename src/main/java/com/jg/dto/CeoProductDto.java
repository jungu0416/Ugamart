package com.jg.dto;

public class CeoProductDto {
	private String ceo_number;
	private String product_number;
	private String product_category;
	private String product_k_name;
	private String product_price;
	private String product_rating;
	private String product_stock;
	private String product_detail;
	private String product_date;

	public CeoProductDto() {}
	public CeoProductDto(String ceo_number, String product_number, String product_category, String product_k_name,
			String product_price, String product_rating, String product_stock, String product_detail,
			String product_date) {
		this.ceo_number = ceo_number;
		this.product_number = product_number;
		this.product_category = product_category;
		this.product_k_name = product_k_name;
		this.product_price = product_price;
		this.product_rating = product_rating;
		this.product_stock = product_stock;
		this.product_detail = product_detail;
		this.product_date = product_date;
	}
	public String getCeo_number() {
		return ceo_number;
	}
	public void setCeo_number(String ceo_number) {
		this.ceo_number = ceo_number;
	}
	public String getProduct_number() {
		return product_number;
	}
	public void setProduct_number(String product_number) {
		this.product_number = product_number;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_k_name() {
		return product_k_name;
	}
	public void setProduct_k_name(String product_k_name) {
		this.product_k_name = product_k_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_rating() {
		return product_rating;
	}
	public void setProduct_rating(String product_rating) {
		this.product_rating = product_rating;
	}
	public String getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(String product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	@Override
	public String toString() {
		return "CeoProductDto [ceo_number=" + ceo_number + ", product_number=" + product_number + ", product_category="
				+ product_category + ", product_k_name=" + product_k_name + ", product_price=" + product_price
				+ ", product_rating=" + product_rating + ", product_stock=" + product_stock + ", product_detail="
				+ product_detail + ", product_date=" + product_date + "]";
	}
	
}
