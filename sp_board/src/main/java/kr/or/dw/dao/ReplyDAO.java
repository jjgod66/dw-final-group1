package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.vo.ReplyVO;

@Mapper
public interface ReplyDAO {

	// 댓글 등록
	void insertReply(ReplyVO reply) throws SQLException;

	// 댓글리스트 불러오기
	List<ReplyVO> selectPageReplyList(int bno, RowBounds rowBounds) throws SQLException;

	// 해당 댓글 수 불러오기
	int countReply(int bno);
	
	// 댓글 수정
	void updateReply(ReplyVO reply);

	// 댓글 삭제
	void deleteReply(int rno);

}
