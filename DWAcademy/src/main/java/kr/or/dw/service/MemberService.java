package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public interface MemberService {

	// 회원의 정보를 가져온다.
	Map<String, Object> selectMemberById(String id) throws SQLException;

	// 회원가입
	void join(MemberVO memVO) throws SQLException;

	// 회원 코드 가져오기
	Map<String, Object> selectMemberCode(SnsVO sns) throws SQLException;

	// 회원인지 체크하기(번호)
	Map<String, Object> CheckMember(String mem_phone) throws SQLException;

	// 회원인지 체크하기(이메일)
	Map<String, Object> CheckMemberEmail(String email) throws SQLException;

	// 개인정보 수집 동의 업데이트
	void additionUpdate(Map<String, Object> member) throws SQLException;
	
	// 회원 등급 업데이트
	void updateMemgrade() throws SQLException;

	//회원 휴면 전환
	void sleepMem() throws SQLException;

	//회원 정지 전환
	void unbanMember() throws SQLException;

	// 회원 구매 내역
	Map<String, Object> selectBuyInfo(SearchCriteria cri, String mem_cd) throws SQLException;

	// 회원 구매 내역 월 단위 조회
	Map<String, Object> searchBuyInfo(String mem_cd, SearchCriteria cri) throws SQLException;

	// 휴면 계정 해제
	void accountRecovery(String phone) throws SQLException;

	// 회원 구매 내역 3개 가져오기
	List<Map<String, Object>> select3BuyInfo(String mem_cd) throws SQLException;

	// 모든 장르 가져오기
	List<GenreVO> selectAllGenreList() throws SQLException;

	// 회원 선호장르 선택
	void memLikeThr(List<String> thrNames, String mem_cd) throws SQLException;
	
}
