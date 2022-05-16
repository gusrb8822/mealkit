package org.phg.dao;

import java.util.ArrayList;
import org.phg.model.PageDTO;
import org.phg.model.QnADTO;

public interface CSDAO {
	// pageNum와 amount에 맞게 qna_table의 내용의 select해옴
	public ArrayList<QnADTO> getQnA(PageDTO pdto);
	
	// qna_table의 전체항목 개수를 가져옴
	public int getQnACount();
	
	
}
