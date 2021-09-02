package com.jg.dto;

public class CeoDto {
	private String ceo_id;
	private String ceo_pw;
	private String ceo_store_name;
	private String ceo_phone;
	private String ceo_address;
	private String ceo_number;
	
	public CeoDto() {}
	public CeoDto(String ceo_id, String ceo_pw, String ceo_store_name, String ceo_phone, String ceo_address,
			String ceo_number) {
		this.ceo_id = ceo_id;
		this.ceo_pw = ceo_pw;
		this.ceo_store_name = ceo_store_name;
		this.ceo_phone = ceo_phone;
		this.ceo_address = ceo_address;
		this.ceo_number = ceo_number;
	}
	public String getCeo_id() {
		return ceo_id;
	}
	public void setCeo_id(String ceo_id) {
		this.ceo_id = ceo_id;
	}
	public String getCeo_pw() {
		return ceo_pw;
	}
	public void setCeo_pw(String ceo_pw) {
		this.ceo_pw = ceo_pw;
	}
	public String getCeo_store_name() {
		return ceo_store_name;
	}
	public void setCeo_store_name(String ceo_store_name) {
		this.ceo_store_name = ceo_store_name;
	}
	public String getCeo_phone() {
		return ceo_phone;
	}
	public void setCeo_phone(String ceo_phone) {
		this.ceo_phone = ceo_phone;
	}
	public String getCeo_address() {
		return ceo_address;
	}
	public void setCeo_address(String ceo_address) {
		this.ceo_address = ceo_address;
	}
	public String getCeo_number() {
		return ceo_number;
	}
	public void setCeo_number(String ceo_number) {
		this.ceo_number = ceo_number;
	}
	@Override
	public String toString() {
		return "CeoDto [ceo_id=" + ceo_id + ", ceo_pw=" + ceo_pw + ", ceo_store_name=" + ceo_store_name + ", ceo_phone="
				+ ceo_phone + ", ceo_address=" + ceo_address + ", ceo_number=" + ceo_number + "]";
	}
}
