package kr.or.dw.service;

import java.sql.SQLException;

public interface PointService {

	/**
	 * 전날 상영한 영화 예매한 사람들한테 포인트 적립해주는 메서드
	 */
	void insertMoviePoint() throws SQLException;

}
