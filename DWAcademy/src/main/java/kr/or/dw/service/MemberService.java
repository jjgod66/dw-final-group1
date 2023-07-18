package kr.or.dw.service;

import java.sql.SQLException;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public interface MemberService {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id) throws SQLException;

	// 회원가입
	void join(MemberVO memVO) throws SQLException;

	// 회원 코드 가져오기
	MemberVO selectMemberCode(SnsVO sns) throws SQLException;

	// 회원인지 체크하기
	MemberVO CheckMember(String mem_phone) throws SQLException;	

	
}
