package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.AttachVO;

@Mapper
public interface AttachDAO {
	
	// 첨부파일 등록
	void insertAttach(AttachVO attach) throws SQLException;

	// 해당 자료실 게시물의 첨부파일 리스트 조회
	List<AttachVO> selectAttachByPno(int pno) throws SQLException;

	// 해당하는 첨부파일 불러오기
	AttachVO selectAttachByAno(int ano) throws SQLException;
}
