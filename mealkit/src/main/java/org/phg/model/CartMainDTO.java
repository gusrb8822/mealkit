package org.phg.model;

import java.util.ArrayList;

public class CartMainDTO {
	private int cart_no;
	private String member_id;
	private int base_no;
	private String base_name;
	private int base_price;
	private ArrayList<CartSubDTO> csdto;
	
	// discount 항목 때문에 만든 값
	private int cno;
	
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
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
	public int getBase_price() {
		return base_price;
	}
	public void setBase_price(int base_price) {
		this.base_price = base_price;
	}
	public ArrayList<CartSubDTO> getCsdto() {
		return csdto;
	}
	public void setCsdto(ArrayList<CartSubDTO> csdto) {
		this.csdto = csdto;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
	
	@Override
	public String toString() {
		return "CartMainDTO [cart_no=" + cart_no + ", member_id=" + member_id + ", base_no=" + base_no + ", base_name="
				+ base_name + ", base_price=" + base_price + ", csdto=" + csdto + "]";
	}
	
	
}
