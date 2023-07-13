package kr.or.dw.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;

@Mapper
public interface MemberDAO {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id);

	// 회원가입
	void insert(MemberVO memVO);

	// 회원의 마지막 로그인 날짜
	void updateLastLoginDt(String id);

	// 카카오 로그인을 위한 검증
	MemberVO selectMemberByName(String email);

}
