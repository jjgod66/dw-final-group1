package kr.or.dw.dao;

import java.sql.SQLException;

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

}
