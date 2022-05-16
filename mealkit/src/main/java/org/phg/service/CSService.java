package org.phg.service;

import org.phg.model.PageDTO;
import org.springframework.ui.Model;

public interface CSService {
	// pageNum와 amount에 맞게 QnA항목을 select해서 model에 집어넣음
	public void getQnA(PageDTO pdto, Model model);
}
