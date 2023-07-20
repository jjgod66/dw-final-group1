package kr.or.dw.service;

import java.sql.SQLException;

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

}
