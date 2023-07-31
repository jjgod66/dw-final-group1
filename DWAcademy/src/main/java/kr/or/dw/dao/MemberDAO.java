package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.ProductVO;
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

	//지난달 회원들의 영화 예매횟수 가져오는 메서드
	List<Map<String, Object>> selectMemMonthResCnt() throws SQLException;

	//회원 등급 vip로 업데이트
	void updateMemGradeVIP(String mem_cd) throws SQLException;

	//회원 등급 normal로 업데이트
	void updateMemGradeNormal(String mem_cd) throws SQLException;

	//1년동안 로그인 안한 회원들 코드 가져오는 메서드
	String[] selectNotLoginYearMem() throws SQLException;

	//회원 휴면계정으로 업데이트
	void updateMemSleep(String mem) throws SQLException;

	//회원 정지계정 해제 전환 
	void updateMemUnban() throws SQLException;

	// 회원 구매 내역
	List<ProductVO> selectBuyInfo(String mem_cd) throws SQLException;

	// 회원 구매 내역 월 단위 조회
	List<Map<String, Object>> searchBuyInfo(String mem_cd, String searchVal) throws SQLException;

}
