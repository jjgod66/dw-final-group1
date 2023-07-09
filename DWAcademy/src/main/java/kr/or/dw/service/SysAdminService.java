package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;

public interface SysAdminService {

	// 해당 점포리스트 불러오기
	Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException;

}
