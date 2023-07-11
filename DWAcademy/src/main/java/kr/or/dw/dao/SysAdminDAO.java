package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.TheaterVO;


@Mapper
public interface SysAdminDAO {
	
	// 해당하는 극장 목록을 불러온다.
	List<TheaterVO> selectSearchTheaterList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 극장의 총 개수를 불러온다.
	int selectSearchTheaterListCount(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void insertTheater(TheaterVO thr) throws SQLException;
	
	// 새 관리자 등록
	void insertAdmin(AdminVO adminVO) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 지점 관리자 아이디/패스워드 수정
	void updateAdmin(AdminVO adminVO) throws SQLException;

	// 해당 극장 지점 정보 수정
	void updateTheater(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void updateDelTheater(String thr_name) throws SQLException;

	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 상영등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

}
