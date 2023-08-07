package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;

public interface PointService {

	/**
	 * 전날 상영한 영화 예매한 사람들한테 포인트 적립해주는 메서드
	 */
	void insertMoviePoint() throws SQLException;

	/**
	 * 회원 포인트 리스트
	 * @param mem_cd
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getMemPointList(String mem_cd, SearchCriteria cri) throws SQLException;

}
