package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.PdsVO;

@Mapper
public interface PdsDAO {
	
	// 자료실 게시물 등록
	int insertPds(PdsVO pds) throws SQLException;

	// 자료실 게시물 리스트 조회
	List<PdsVO> selectSearchPdsList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 자료실 게시글 수 조회
	int selectSearchPdsListCount(SearchCriteria cri) throws SQLException;

	// 해당 자료실 게시글 조회
	PdsVO selectPdsByPno(int pno) throws SQLException;

	// 해당 자료실글 조회수 올리기
	void increaseViewCount(int pno) throws SQLException;

	

}
