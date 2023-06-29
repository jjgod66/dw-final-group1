package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BoardVO;

@Mapper
public interface BoardDAO {

	// 해당하는 게시글목록 조회
	List<BoardVO> selectSearchBoardList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 게시글 수 조회
	int selectSearchBoardListCount(SearchCriteria cri) throws SQLException;

	// 글 등록
	void insertBoard(BoardVO board) throws SQLException;

	// 해당 글 조회
	BoardVO selectBoard(int bno) throws SQLException;;

	// 해당 글 조회수 올리기
	void increaseViewCnt(int bno) throws SQLException;

	// 해당 글 수정
	void updateBoard(BoardVO board) throws SQLException;

	// 해당 글 삭제
	void deleteBoard(int bno) throws SQLException;

	
}
