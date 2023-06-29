package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MenuVO;

@Mapper
public interface MenuDAO {

	// 전체 메인메뉴 목록 조회
	List<MenuVO> selectMainMenuList() throws SQLException;

	// 서브메뉴 목록 조회
	List<MenuVO> selectSubMenuList(String mcode) throws SQLException;
	
	// 해당 메뉴 조회
	MenuVO selectMenuByMcode(String mcode);
}
