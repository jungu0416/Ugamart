package com.jg.dto;

public class CeoReviewDto {
	private String customer_id;
	private String order_number;
	private String product_number;
	private String ceo_number;
	private String customer_title;
	private String customer_content;
	private String rating;
	private String review_date;
	private String ceo_reply;
	
	public CeoReviewDto(){}
	public CeoReviewDto(String customer_id, String order_number, String product_number, String ceo_number,
			String customer_title, String customer_content, String rating, String review_date, String ceo_reply) {
		super();
		this.customer_id = customer_id;
		this.order_number = order_number;
		this.product_number = product_number;
		this.ceo_number = ceo_number;
		this.customer_title = customer_title;
		this.customer_content = customer_content;
		this.rating = rating;
		this.review_date = review_date;
		this.ceo_reply = ceo_reply;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getProduct_number() {
		return product_number;
	}
	public void setProduct_number(String product_number) {
		this.product_number = product_number;
	}
	public String getCeo_number() {
		return ceo_number;
	}
	public void setCeo_number(String ceo_number) {
		this.ceo_number = ceo_number;
	}
	public String getCustomer_title() {
		return customer_title;
	}
	public void setCustomer_title(String customer_title) {
		this.customer_title = customer_title;
	}
	public String getCustomer_content() {
		return customer_content;
	}
	public void setCustomer_content(String customer_content) {
		this.customer_content = customer_content;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getCeo_reply() {
		return ceo_reply;
	}
	public void setCeo_reply(String ceo_reply) {
		this.ceo_reply = ceo_reply;
	}
	@Override
	public String toString() {
		return "CeoReviewDto [customer_id=" + customer_id + ", order_number=" + order_number + ", product_number="
				+ product_number + ", ceo_number=" + ceo_number + ", customer_title=" + customer_title
				+ ", customer_content=" + customer_content + ", rating=" + rating + ", review_date=" + review_date
				+ ", ceo_reply=" + ceo_reply + "]";
	}
	
}
