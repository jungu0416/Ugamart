package com.jg.dto;

public class RiderOrderDto {
	private String order_number;
	private String customer_id;
	private String product_number_amount;
	private String ceo_number;
	private String order_date;
	private String total_price;
	private String required_address;
	private String delivery_whether;
	
	public RiderOrderDto() {}
	public RiderOrderDto(String order_number, String customer_id, String product_number_amount, String ceo_number,
			String order_date, String total_price, String required_address, String delivery_whether) {
		super();
		this.order_number = order_number;
		this.customer_id = customer_id;
		this.product_number_amount = product_number_amount;
		this.ceo_number = ceo_number;
		this.order_date = order_date;
		this.total_price = total_price;
		this.required_address = required_address;
		this.delivery_whether = delivery_whether;
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
	public String getProduct_number_amount() {
		return product_number_amount;
	}
	public void setProduct_number_amount(String product_number_amount) {
		this.product_number_amount = product_number_amount;
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
	@Override
	public String toString() {
		return "RiderOrderDto [order_number=" + order_number + ", customer_id=" + customer_id
				+ ", product_number_amount=" + product_number_amount + ", ceo_number=" + ceo_number + ", order_date="
				+ order_date + ", total_price=" + total_price + ", required_address=" + required_address
				+ ", delivery_whether=" + delivery_whether + "]";
	}
	
}
