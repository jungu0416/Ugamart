package com.jg.dto;

public class CeoEachOrderDto {
	private String order_number;
	private String customer_id;
	private String product_number;
	private String amount; 
	private String price; //두번째
	private String order_date;
	private String required_address;
	private String delivery_whether;
	private String product_k_name;
	
	public CeoEachOrderDto() {}
	public CeoEachOrderDto(String order_number, String customer_id, String product_number, String amount, String price,
			String order_date, String required_address, String delivery_whether, String product_k_name) {
		super();
		this.order_number = order_number;
		this.customer_id = customer_id;
		this.product_number = product_number;
		this.amount = amount;
		this.price = price;
		this.order_date = order_date;
		this.required_address = required_address;
		this.delivery_whether = delivery_whether;
		this.product_k_name = product_k_name;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	public String getProduct_k_name() {
		return product_k_name;
	}
	public void setProduct_k_name(String product_k_name) {
		this.product_k_name = product_k_name;
	}
	@Override
	public String toString() {
		return "CeoEachOrderDto [order_number=" + order_number + ", customer_id=" + customer_id + ", product_number="
				+ product_number + ", amount=" + amount + ", price=" + price + ", order_date=" + order_date
				+ ", required_address=" + required_address + ", delivery_whether=" + delivery_whether
				+ ", product_k_name=" + product_k_name + "]";
	}
}
