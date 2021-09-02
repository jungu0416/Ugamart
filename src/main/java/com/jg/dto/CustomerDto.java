package com.jg.dto;

public class CustomerDto {
	private String customer_id;
	private String customer_pw;
	private String customer_name;
	private String customer_address;
	private String customer_phone;
	private String customer_email;
	
	public CustomerDto() {}

	public CustomerDto(String customer_id, String customer_pw, String customer_name, String customer_address,
			String customer_phone, String customer_email) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_name = customer_name;
		this.customer_address = customer_address;
		this.customer_phone = customer_phone;
		this.customer_email = customer_email;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	@Override
	public String toString() {
		return "CustomerDto [customer_id=" + customer_id + ", customer_pw=" + customer_pw + ", customer_name="
				+ customer_name + ", customer_address=" + customer_address + ", customer_phone=" + customer_phone
				+ ", customer_email=" + customer_email + "]";
	}
	
	
	
}
