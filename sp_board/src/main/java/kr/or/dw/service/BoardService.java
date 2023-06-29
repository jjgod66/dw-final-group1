package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BoardVO;

public interface BoardService {

	// 해당하는 게시글목록 조회
	Map<String, Object> selectBoardList(SearchCriteria cri) throws SQLException;

	// 글 등록
	void write(BoardVO board) throws SQLException;

	// 해당 글 조회
	BoardVO selectBoard(int bno) throws SQLException;

	// 해당 글 수정
	void modify(BoardVO board) throws SQLException;

	// 해당 글 삭제
	void remove(int bno) throws SQLException;

}
