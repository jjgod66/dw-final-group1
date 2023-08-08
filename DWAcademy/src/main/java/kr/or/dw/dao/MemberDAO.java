package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SnsVO;

@Mapper
public interface MemberDAO {

	// 회원의 정보를 가져온다.
	Map<String, Object> selectMemberById(String id) throws SQLException;

	// 회원가입
	void insert(MemberVO memVO) throws SQLException;

	// 회원의 마지막 로그인 날짜
	void updateLastLoginDt(String id) throws SQLException;

	// 회원 코드 가져오기
	Map<String, Object> selectMemberCode(SnsVO sns) throws SQLException;

	// 회원 체크하기 (번호)
	Map<String, Object> CheckMember(String mem_phone) throws SQLException;

	// 회원 체크하기 (이메일)
	Map<String, Object> CheckMemberEmail(String email) throws SQLException;

	// 개인정보 수집 동의 업데이트
	void additionUpdate(Map<String, Object> member)throws SQLException;

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

	// 회원 휴면계정 해제
	void updateMemUnSleep(String phone) throws SQLException;

	//회원 정지계정 해제 전환 
	void updateMemUnban() throws SQLException;

	// 회원 구매 내역
	List<ProductVO> selectBuyInfoList(SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;

	// 회원 구매 내역 월 단위 조회
	List<Map<String, Object>> searchBuyInfo(@Param("cri")SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;

	// 회원 구매 내역 총 카운트
	int selectBuyInfoListCnt(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	// 회원 구매 내역 검색한 총 카운트
	int searchBuyInfoListCnt(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	// 회원 구매 내역 3개 가져오기
	List<Map<String, Object>> select3BuyInfo(String mem_cd) throws SQLException;

	// 모든 장르 가져오기
	List<GenreVO> selectAllGenreList() throws SQLException;

	// 회원 선호 극장 삭제
	void deleteMemLikeThr(String mem_cd) throws SQLException;

	// 회원 선호 극장 등록
	void updateMemLikeThr(Map<String, Object> data) throws SQLException;

	// 회원의 모든 정보 가져오는 메서드
	Map<String, Object> selectAllMemberInfo(String id) throws SQLException;

	// 회원 선호 장르 등록
	void updateMemLikeGenre(Map<String, Object> data) throws SQLException;

	// 회원 선호 장르 삭제
	void deleteMemLikeGenre(String mem_cd) throws SQLException;

	// 회원 선호장르 가져오기
	List<Map<String, Object>> selectMemLikeGenre(String mem_cd) throws SQLException;

	// 회원 탈퇴
	void resginMember(String mem_cd) throws SQLException;

	// 회원 개인정보 업데이트
	void memberInfoUpdate(MemberVO memVO)throws SQLException;


}
