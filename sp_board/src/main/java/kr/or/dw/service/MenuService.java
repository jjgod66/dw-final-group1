package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.MenuVO;

public interface MenuService {
	
	// 전체 메인메뉴 목록 조회
	List<MenuVO> selectMainMenuList() throws SQLException;

	// 서브메뉴 목록 조회
	List<MenuVO> selectSubMenuList(String mcode) throws SQLException;

	// 해당 메뉴 조회
	MenuVO selectMenuByMcode(String mcode) throws SQLException;
}
