package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.TheaterVO;

public interface SysAdminService {

	// 해당 점포리스트 불러오기
	Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void theaterRegist(TheaterVO thr) throws SQLException;

}
