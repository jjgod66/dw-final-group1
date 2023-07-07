package kr.or.dw.service;

import kr.or.dw.vo.MemberVO;

public interface MemberService {

	MemberVO selectMemberById(String id);
	
}
