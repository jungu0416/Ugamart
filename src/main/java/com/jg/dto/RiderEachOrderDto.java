package com.jg.dto;

public class RiderEachOrderDto {
	private String order_number;
	private String customer_id;
	private String product_number;
	private String product_amount;
	private String product_k_name;
	private String ceo_number;
	private String order_date;
	private String total_price;
	private String required_address;
	private String delivery_whether;
	private String ceo_store_name;
	private String ceo_address;
	
	public RiderEachOrderDto() {}
	public RiderEachOrderDto(String order_number, String customer_id, String product_number, String product_amount,
			String product_k_name, String ceo_number, String order_date, String total_price, String required_address,
			String delivery_whether, String ceo_store_name, String ceo_address) {
		super();
		this.order_number = order_number;
		this.customer_id = customer_id;
		this.product_number = product_number;
		this.product_amount = product_amount;
		this.product_k_name = product_k_name;
		this.ceo_number = ceo_number;
		this.order_date = order_date;
		this.total_price = total_price;
		this.required_address = required_address;
		this.delivery_whether = delivery_whether;
		this.ceo_store_name = ceo_store_name;
		this.ceo_address = ceo_address;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getProduct_number() {
		return product_number;
	}
	public void setProduct_number(String product_number) {
		this.product_number = product_number;
	}
	public String getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(String product_amount) {
		this.product_amount = product_amount;
	}
	public String getProduct_k_name() {
		return product_k_name;
	}
	public void setProduct_k_name(String product_k_name) {
		this.product_k_name = product_k_name;
	}
	public String getCeo_number() {
		return ceo_number;
	}
	public void setCeo_number(String ceo_number) {
		this.ceo_number = ceo_number;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getRequired_address() {
		return required_address;
	}
	public void setRequired_address(String required_address) {
		this.required_address = required_address;
	}
	public String getDelivery_whether() {
		return delivery_whether;
	}
	public void setDelivery_whether(String delivery_whether) {
		this.delivery_whether = delivery_whether;
	}
	public String getCeo_store_name() {
		return ceo_store_name;
	}
	public void setCeo_store_name(String ceo_store_name) {
		this.ceo_store_name = ceo_store_name;
	}
	public String getCeo_address() {
		return ceo_address;
	}
	public void setCeo_address(String ceo_address) {
		this.ceo_address = ceo_address;
	}
	@Override
	public String toString() {
		return "RiderEachOrderDto [order_number=" + order_number + ", customer_id=" + customer_id + ", product_number="
				+ product_number + ", product_amount=" + product_amount + ", product_k_name=" + product_k_name
				+ ", ceo_number=" + ceo_number + ", order_date=" + order_date + ", total_price=" + total_price
				+ ", required_address=" + required_address + ", delivery_whether=" + delivery_whether
				+ ", ceo_store_name=" + ceo_store_name + ", ceo_address=" + ceo_address + "]";
	}
	
}
