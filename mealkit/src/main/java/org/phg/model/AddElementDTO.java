package org.phg.model;

public class AddElementDTO {
	
	private int element_no;
	private String element_name;
	private String element_group;
	private int element_price;
	
	
	public int getElement_no() {
		return element_no;
	}
	public void setElement_no(int element_no) {
		this.element_no = element_no;
	}
	public String getElement_name() {
		return element_name;
	}
	public void setElement_name(String element_name) {
		this.element_name = element_name;
	}
	public String getElement_group() {
		return element_group;
	}
	public void setElement_group(String element_group) {
		this.element_group = element_group;
	}
	public int getElement_price() {
		return element_price;
	}
	public void setElement_price(int element_price) {
		this.element_price = element_price;
	}
	
	
	@Override
	public String toString() {
		return "AddElementDTO [element_no=" + element_no + ", element_name=" + element_name + ", element_group="
				+ element_group + ", element_price=" + element_price + "]";
	}
	
	
}
