package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ReplyVO;

public interface ReplyService {
	
	// 댓글 등록
	void registReply(ReplyVO reply) throws SQLException;

	// 댓글리스트 불러오기
	Map<String, Object> selectReplyList(int bno, SearchCriteria cri) throws SQLException;

	// 댓글 수정
	void modifyReply(ReplyVO reply) throws SQLException;

	// 댓글 삭제
	void removeReply(int rno) throws SQLException;
}
