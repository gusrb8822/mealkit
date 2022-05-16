package org.phg.model;

public class AttachFileDTO {
	// 파일이름
	private String fileName;
	// 파일경로
	private String uploadPath;
	// UUID
	private String uuid;
	// image여부
	private boolean image;
	// 리뷰 번호
	private int review_no;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	
	
	@Override
	public String toString() {
		return "AttachFileDTO [fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", image="
				+ image + ", review_no=" + review_no + "]";
	}
	
	
}
