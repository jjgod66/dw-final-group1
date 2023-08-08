package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.PointVO;

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

	/**
	 * 해당 기프트카드 존재하는지 확인
	 * @param mem_product_cd
	 * @return
	 * @throws SQLException
	 */
	int selectMemProCdExist(String mem_product_cd) throws SQLException;

	/**
	 * 해당 기프트카드 현재 상태 어떤지
	 * @param mem_product_cd
	 * @return
	 * @throws SQLException
	 */
	String selectMemProCdGbUse(String mem_product_cd) throws SQLException;

	/**
	 * 기프트카드 등록
	 * @param param
	 * @throws SQLException
	 */
	void insertMemGiftCard(Map<String, Object> param) throws SQLException;

	/**
	 * 기프트 카드 금액 얼만지 확인하는 메서드
	 * @param mem_product_cd
	 * @return
	 * @throws SQLException
	 */
	int selectPointByMemProCd(String mem_product_cd) throws SQLException;

	/**
	 * 기프트카드 사용으로 바꾸기
	 * @param mem_product_cd
	 * @throws SQLException
	 */
	void updateMemProGbUse(String mem_product_cd) throws SQLException;

	/**
	 * 회원 포인트 리스트
	 * @param mem_cd
	 * @return
	 * @throws SQLException
	 */
	List<PointVO> selectMemPoint(String mem_cd) throws SQLException;

}
