package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.TheaterVO;

public interface TheaterService {

	/**
	 * 지역에 따른 극장 가져오는 메서드
	 * @param string
	 * @return
	 */
	String[] getThrListByLoc(String loc) throws SQLException;

	/**
	 * 극장 정보 가져오는 메서드
	 * @param thr_name
	 * @return
	 */
	TheaterVO getTheaterInfo(String thr_name) throws SQLException;

	/**
	 * 선호 극장 버튼 눌렀을 때 메서드
	 * @param thr_name
	 * @param mem_cd
	 * @return
	 */
	String clickLikeThr(String thr_name, String mem_cd) throws SQLException;

	/**
	 * 선호극장인지 아닌지 확인하는 메서드
	 * @param thr_name
	 * @param mem_cd
	 * @return
	 */
	int likeThrYN(String thr_name, String mem_cd) throws SQLException;

	/**
	 * 해당 날짜에 해당 지점에서 상영하는 모든 영화 리스트 가져오는 메서드
	 * @param thr_name
	 * @param date
	 * @return
	 */
	List<List<List<Map<String,Object>>>> getAllScreenList(String thr_name, Date date) throws SQLException;

	/**
	 * 극장 공지사항 5개만 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getThrNotice() throws SQLException;

	/**
	 * 해당 극장의 공지사항 5개만 가져오는 메서드
	 * @param thr_name
	 * @return
	 */
	List<NoticeVO> getThisThrNotice(String thr_name) throws SQLException;

	/**
	 * 극장 이벤트 4개 가져오는 메서드
	 * @return
	 */
	List<EventVO> getThrEvent() throws SQLException;

	/**
	 * 해당 지점의 이벤트 4개 
	 * @param thr_name
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> getThisThrEvent4(String thr_name) throws SQLException;

}
