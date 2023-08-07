package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointDAO {
	
	/**
	 * 전날 상영한 영화 예매한 사람한테 포인트 적립해주는 메서드(일반등급)
	 * @param pointIn 
	 */
	void insertMoviePoint(Map<String, Object> pointIn) throws SQLException;

	/**
	 * 전날 상영한 영화 예매한 사람 리스트 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectpointInList() throws SQLException;

	/**
	 * 전날 상영한 영화 예매한 사람한테 포인트 적립해주는 메서드(VIP등급)
	 * @param pointIn 
	 */
	void insertMoviePointVIP(Map<String, Object> pointIn) throws SQLException;

	/**
	 * 포인트 리스트
	 * @param param
	 * @return
	 */
	List<Map<String, Object>> selectMemPointList(Map<String, Object> param) throws SQLException;

	/**
	 * 포인트 갯수
	 * @param param
	 * @return
	 */
	int selectMemPointCount(Map<String, Object> param) throws SQLException;

}
