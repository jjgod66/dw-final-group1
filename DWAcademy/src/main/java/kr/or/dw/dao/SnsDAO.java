package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Mapper
public interface SnsDAO {

	// 카카오 로그인 회원 간편로그인 테이블에서 이메일 체크
	SnsVO kakaoSelectByMemberCode(String email)throws SQLException;

	// 간편로그인 연동
	void kakaoInsert(HashMap<String, Object> userInfo) throws SQLException;

	// 간편로그인 카카오 정보 가져오기
	Map<String, Object> selectKakaoInfo(String mem_cd) throws SQLException;

	// 간편로그인 네이버 정보 가져오기
	Map<String, Object> selectNaverInfo(String mem_cd) throws SQLException;

	// 간편로그인 연동해제
	void kakaoDelete(String mem_cd) throws SQLException;

	// 네이버 로그인 회원 간편로그인 테이블에서 이메일 체크
	SnsVO naverSelectByMemberCode(String email) throws SQLException;

	// 네이버 연동시 DB 저장
	void naverInsert(HashMap<String, Object> naverUserInfo) throws SQLException;

	// 네이버 연동해제
	void neverDelete(String mem_cd) throws SQLException;

	// 카카오 연동 이메일 체크
	SnsVO kakaoEmailCheck(String mem_email) throws SQLException;

	// 네이버 연동 이메일 체크
	SnsVO naverEmailCheck(String sns_email) throws SQLException;


	
	
}
