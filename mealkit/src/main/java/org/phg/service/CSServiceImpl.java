package org.phg.service;

import java.util.ArrayList;
import org.phg.dao.CSDAO;
import org.phg.model.PageDTO;
import org.phg.model.QnADTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CSServiceImpl implements CSService{
	@Autowired
	CSDAO cdao;
	
	// pageNum와 amount에 맞게 QnA항목을 select해서 model에 집어넣음
	public void getQnA(PageDTO pdto, Model model) {
		ArrayList<QnADTO> qadto = cdao.getQnA(pdto);
		int totalQnA = cdao.getQnACount();
		pdto.settotalCount(totalQnA);
		pdto.setPageMaker();
		pdto.setQnas(qadto);

		model.addAttribute("csPage", pdto);
	}
}
