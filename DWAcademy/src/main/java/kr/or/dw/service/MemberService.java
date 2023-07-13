package kr.or.dw.service;

import kr.or.dw.vo.MemberVO;

public interface MemberService {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id);

	// 회원가입
	void join(MemberVO memVO);

	// 카카오 로그인을 위한 검증
	MemberVO selectMemberByName(String email);

	
}
