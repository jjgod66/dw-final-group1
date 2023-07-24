package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

	// 회원 코드 가져오기
	MemberVO selectMemberCode(SnsVO sns) throws SQLException;

	// 회원 체크하기 (번호)
	MemberVO CheckMember(String mem_phone) throws SQLException;

	// 회원 체크하기 (이메일)
	MemberVO CheckMemberEmail(String email) throws SQLException;

	// 개인정보 수집 동의 업데이트
	void additionUpdate(Map<String, Object> dataMap)throws SQLException;

}
