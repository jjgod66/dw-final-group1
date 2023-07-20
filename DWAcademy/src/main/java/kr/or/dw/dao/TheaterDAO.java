package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

}
