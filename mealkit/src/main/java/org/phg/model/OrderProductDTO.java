package org.phg.model;

public class OrderProductDTO {
	private int order_no;
	private String member_id;
	private String base_name;
	private String add_element;
	private int total_price;
	private String order_date;
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBase_name() {
		return base_name;
	}
	public void setBase_name(String base_name) {
		this.base_name = base_name;
	}
	public String getAdd_element() {
		return add_element;
	}
	public void setAdd_element(String add_element) {
		this.add_element = add_element;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	
	
	@Override
	public String toString() {
		return "OrderProductDTO [order_no=" + order_no + ", member_id=" + member_id + ", base_name=" + base_name
				+ ", add_element=" + add_element + ", total_price=" + total_price + ", order_date=" + order_date + "]";
	}
	
}
