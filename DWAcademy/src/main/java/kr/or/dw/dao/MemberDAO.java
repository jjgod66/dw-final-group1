package kr.or.dw.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Mapper
public interface MemberDAO {

	// 회원의 정보를 가져온다.
	MemberVO selectMemberById(String id) throws SQLException;

	// 회원가입
	void insert(MemberVO memVO) throws SQLException;

	// 회원의 마지막 로그인 날짜
	void updateLastLoginDt(String id) throws SQLException;

	MemberVO selectMemberCode(SnsVO sns) throws SQLException;

}
