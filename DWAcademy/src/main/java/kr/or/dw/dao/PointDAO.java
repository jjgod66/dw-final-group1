package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointDAO {
	
	/**
	 * 전날 상영한 영화 예매한 사람한테 포인트 적립해주는 메서드
	 * @param pointIn 
	 */
	void insertMoviePoint(Map<String, Object> pointIn) throws SQLException;

	/**
	 * 전날 상영한 영화 예매한 사람 리스트 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectpointInList() throws SQLException;

}
