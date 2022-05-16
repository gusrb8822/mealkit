package org.phg.dao;

import java.util.ArrayList;

import org.phg.model.AttachFileDTO;

public interface AttachDAO {
	// 첨부파일 정보를 insert함
	public void AttachWrite(AttachFileDTO adto);
	
	// review_no 값으로 첨부파일 목록을 불러 옴
	public ArrayList<AttachFileDTO> getAttach(int review_no);
	
}
