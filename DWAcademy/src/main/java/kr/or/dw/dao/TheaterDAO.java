package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.TheaterVO;

@Mapper
public interface TheaterDAO {

	/**
	 * 지역에 따른 극장 가져오는 메서드
	 * @param loc
	 * @return
	 */
	String[] selectThrByLoc(String loc) throws SQLException;

	/**
	 * 극장 정보를 가져오는 메서드
	 * @param thr_name
	 * @return
	 */
	TheaterVO selectTheaterInfo(String thr_name) throws SQLException;

	/**
	 * 회원의 선호극장 갯수 구하는 메서드
	 * @param mem_cd
	 * @return
	 */
	int selectLikeThrCount(String mem_cd) throws SQLException;

	/**
	 * 이 극장을 선호하는 극장으로 이미 선택했는지 안했는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int selectThisThrLikeYN(Map<String, String> param) throws SQLException;

	/**
	 * 선호극장 삭제 메서드
	 * @param param
	 * @throws SQLException
	 */
	void deleteLikeThr(Map<String, String> param) throws SQLException;

	/**
	 * 선호극장 등록 메서드
	 * @param param
	 * @throws SQLException
	 */
	void insertLikeThr(Map<String, String> param) throws SQLException;

	/**
	 * 해당 날짜의 해당 극장에서 상영하는 영화 리스트 가져오는 메서드
	 * @param param
	 * @return
	 */
	List<String> selectDayMovieList(Map<String, Object> param) throws SQLException;

	/**
	 * 해당날짜의 해당 극장에서 해당 영화를 상영하는 관 리스트 가져오는 메서드
	 * @param param
	 * @return
	 */
	List<String> selectDayHouseList(Map<String, Object> param) throws SQLException;

	/**
	 * 해당 날짜, 해당 극장, 해당 영화, 해당 상영관에서 상영하는 상영영화 리스트 가져오는 메서드
	 * @param param3
	 * @return
	 */
	List<Map<String, Object>> selectHouseScreenList(Map<String, Object> param3) throws SQLException;

	/**
	 * 극장 공지 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectThrNotice() throws SQLException;

	/**
	 * 해당 극장의 공지 가져오는 메서드
	 * @param thr_name
	 * @return
	 */
	List<NoticeVO> selectThisThrNotice(String thr_name) throws SQLException;

	/**
	 * 극장 이벤트 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectThrEvent() throws SQLException;

	/**
	 * 해당 지점 이벤트 4개
	 * @param thr_name
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectThisThrEvent4(String thr_name) throws SQLException;

}
