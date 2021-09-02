package com.jg.dto;

public class GeocodingAddress {
	private String address;
	
	public GeocodingAddress() {}
	public GeocodingAddress(String address) {
		super();
		this.address = address;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "GeocodingAddress [address=" + address + "]";
	}
}
