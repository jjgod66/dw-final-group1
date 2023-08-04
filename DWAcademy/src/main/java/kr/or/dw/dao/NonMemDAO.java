package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.Non_MemberVO;

@Mapper
public interface NonMemDAO {

	/**
	 * 입력한 정보에 해당하는 비회원이 있는지 확인하는 메서드
	 * @param non_mem
	 * @return
	 * @throws SQLException
	 */
	int selectNonMemExist(Non_MemberVO non_mem) throws SQLException;

	/**
	 * 비회원 예매 목록
	 * @param param
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectNonMemResList(Map<String, Object> param, RowBounds rowBounds) throws SQLException;

	/**
	 * 비회원 예매 갯수
	 * @param param
	 * @param cri 
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectNonMemResCount(Map<String, Object> param) throws SQLException;

}
