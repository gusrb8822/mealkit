package org.phg.model;

public class BaseMenuDTO {
	private int base_no;
	private String base_name;
	private String base_group;
	private int base_price;
	
	
	public int getBase_no() {
		return base_no;
	}
	public void setBase_no(int base_no) {
		this.base_no = base_no;
	}
	public String getBase_name() {
		return base_name;
	}
	public void setBase_name(String base_name) {
		this.base_name = base_name;
	}
	public String getBase_group() {
		return base_group;
	}
	public void setBase_group(String base_group) {
		this.base_group = base_group;
	}
	public int getBase_price() {
		return base_price;
	}
	public void setBase_price(int base_price) {
		this.base_price = base_price;
	}
	
	
	@Override
	public String toString() {
		return "BaseMenuDTO [base_no=" + base_no + ", base_name=" + base_name + ", base_group=" + base_group
				+ ", base_price=" + base_price + "]";
	}
	
}
