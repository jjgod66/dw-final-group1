package kr.or.dw.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;

@Mapper
public interface MemberDAO {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id);

	// 회원가입
	void insert(MemberVO memVO);

}
