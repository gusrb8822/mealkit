package org.phg.model;

public class CartSubDTO {
	private int cart_no;
	private int element_no;
	private String element_name;
	private int element_price;
	private int element_quantity;
	
	
	public CartSubDTO() {
		super();
	}
	public CartSubDTO(int element_no, String element_name, int element_price, int element_quantity) {
		super();
		this.element_no = element_no;
		this.element_name = element_name;
		this.element_price = element_price;
		this.element_quantity = element_quantity;
	}
	
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
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
	public int getElement_price() {
		return element_price;
	}
	public void setElement_price(int element_price) {
		this.element_price = element_price;
	}
	public int getElement_quantity() {
		return element_quantity;
	}
	public void setElement_quantity(int element_quantity) {
		this.element_quantity = element_quantity;
	}
	
	@Override
	public String toString() {
		return "CartSubDTO [cart_no=" + cart_no + ", element_no=" + element_no + ", element_name=" + element_name
				+ ", element_price=" + element_price + ", element_quantity=" + element_quantity + "]";
	}

	
}
