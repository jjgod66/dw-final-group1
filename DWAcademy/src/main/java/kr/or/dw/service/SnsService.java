package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public interface SnsService {

	// 카카오 로그인 회원 간편로그인 테이블에서 이메일 체크
	SnsVO kakaoSelectByMemberCode(String email) throws SQLException;

	void kakaoInsert(HashMap<String, Object> userInfo) throws SQLException;

	// 간편로그인 카카오 정보 가져오기
	Map<String, Object> selectKakaoInfo(String mem_cd) throws SQLException;

	// 간편로그인 네이버 정보 가져오기
	Map<String, Object> selectNaverInfo(String mem_cd) throws SQLException;
	
	// 카카오 연동해제
	void kakaounlink(String mem_cd) throws SQLException;

	// 네이버 로그인 회원 간편로그인 테이블에서 이메일 체크
	SnsVO naverSelectByMemberCode(String email) throws SQLException;

	// 네이버 연동시 DB 저장
	void naverInsert(HashMap<String, Object> naverUserInfo) throws SQLException;

	// 네이버 연동해제
	void naverUnlink(String mem_cd) throws SQLException;

	// 카카오 연동 이메일 체크 
	SnsVO kakaoEmailCheck(String mem_email) throws SQLException;

	// 네이버 연동 이메일 체크
	SnsVO naverEmailCheck(String sns_email) throws SQLException;


}
