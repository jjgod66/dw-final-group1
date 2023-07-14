package kr.or.dw.service;

import java.sql.SQLException;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public interface MemberService {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id) throws SQLException;

	// 회원가입
	void join(MemberVO memVO) throws SQLException;

	MemberVO selectMemberCode(SnsVO sns) throws SQLException;	

	
}
