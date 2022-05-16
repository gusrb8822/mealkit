package org.phg.dao;

import java.util.ArrayList;
import org.phg.model.AddElementDTO;
import org.phg.model.BaseMenuDTO;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;

public interface OrderDAO {
	
	//추가재료 고기/해산물 불러오기
	public ArrayList<AddElementDTO> getAddElement1();
	//추가재료 채소 불러오기
	public ArrayList<AddElementDTO> getAddElement2();
	//추가재료 면/빵 불러오기
	public ArrayList<AddElementDTO> getAddElement3();
	//추가재료 소스/향신료 불러오기
	public ArrayList<AddElementDTO> getAddElement4();

	// ajax를 이용해 베이스메뉴 항목 갱신
	public ArrayList<BaseMenuDTO> GetBaseMenu(String base_group);
	
	// CartMain DB에 데이터 넣기
	public void SaveCartMain(CartMainDTO cmdto);
	// CartSub DB에 데이터 넣기
	public void SaveCartSub(CartSubDTO csdto);
}
