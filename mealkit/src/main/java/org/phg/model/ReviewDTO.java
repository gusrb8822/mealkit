package org.phg.model;

import java.util.ArrayList;

public class ReviewDTO {
	private int review_no;
	private String writer_id;
	private String writer_name;
	private int order_no;
	private int review_point;
	private String review_content;
	private ArrayList<OrderProductDTO> opdto;
	private ArrayList<AttachFileDTO> attach;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getReview_point() {
		return review_point;
	}
	public void setReview_point(int review_point) {
		this.review_point = review_point;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public ArrayList<OrderProductDTO> getOpdto() {
		return opdto;
	}
	public void setOpdto(ArrayList<OrderProductDTO> opdto) {
		this.opdto = opdto;
	}
	public ArrayList<AttachFileDTO> getAttach() {
		return attach;
	}
	public void setAttach(ArrayList<AttachFileDTO> attach) {
		this.attach = attach;
	}
	
	
	@Override
	public String toString() {
		return "ReviewDTO [review_no=" + review_no + ", writer_id=" + writer_id + ", writer_name=" + writer_name
				+ ", order_no=" + order_no + ", review_point=" + review_point + ", review_content=" + review_content
				+ ", opdto=" + opdto + ", attach=" + attach + "]";
	}
	
}
