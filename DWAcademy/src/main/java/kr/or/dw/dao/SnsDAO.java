package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Mapper
public interface SnsDAO {

	// 회원 간편로그인 테이블에서 이메일 체크
	SnsVO selectByMemberCode(String email)throws SQLException;

	// 간편로그인 연동
	void insert(HashMap<String, Object> userInfo) throws SQLException;

	// 간편로그인 정보 가지고오기
	SnsVO selectSnsInfo(MemberVO member) throws SQLException;

	// 간편로그인 연동해제
	void delete(MemberVO user) throws SQLException;

	
	
}
