package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.FaqVO;

@Mapper
public interface SupportDAO {

	/**
	 * 자주묻는질문 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<FaqVO> selectFaQList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 자주묻는질문 갯수
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectFaQListCount(SearchCriteria cri) throws SQLException;

}
