package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.TheaterVO;

public interface SysAdminService {

	/////////////////theater admin////////////////////////
	// 해당 점포리스트 불러오기
	Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void theaterRegist(TheaterVO thr) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 해당 지점 정보 수정
	void theaterModify(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void theaterDelete(String thr_name) throws SQLException;

	//////////////movie admin////////////////////////
	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

}
