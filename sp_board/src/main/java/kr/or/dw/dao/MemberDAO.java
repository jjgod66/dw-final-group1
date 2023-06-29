package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	// 회원정보 조회
	MemberVO selectMemberById(String id) throws SQLException;

	// 회원 목록 조회
	List<MemberVO> selectAllMemberList() throws SQLException;

	// 회원 등록
	void insertMember(MemberVO member) throws SQLException;

	// 회원 정보 수정
	void updateMember(MemberVO member) throws SQLException;
	
	//회원 삭제
	void deleteMember(String id) throws SQLException;
	
	// 회원 정지
	void disabledMember(String id) throws SQLException;

	// 회원 정지 해제
	void enabledMember(String id) throws SQLException;

	// 해당하는 회원목록 조회
	List<MemberVO> selectSearchMemberList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 회원 수 조회
	int selectSearchMemberListCount(SearchCriteria cri);

}
