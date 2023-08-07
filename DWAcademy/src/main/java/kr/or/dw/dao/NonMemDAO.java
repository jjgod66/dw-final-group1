package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.Non_MemberVO;

@Mapper
public interface NonMemDAO {

	/**
	 * 입력한 정보에 해당하는 비회원이 있는지 확인하는 메서드
	 * @param non_mem
	 * @return
	 * @throws SQLException
	 */
	int selectNonMemExist(Non_MemberVO non_mem) throws SQLException;

	/**
	 * 비회원 예매 목록
	 * @param param
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectNonMemResList(Map<String, Object> param, RowBounds rowBounds) throws SQLException;

	/**
	 * 비회원 예매 갯수
	 * @param param
	 * @param cri 
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectNonMemResCount(Map<String, Object> param) throws SQLException;

	/**
	 * 회원 아이디 찾기
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	String selectFindMemId(Map<String, String> member) throws SQLException;

	/**
	 * 비밀번호 찾기에서 입력한 정보에 해당하는 멤버코드 가져오는 메서드
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	String selectFindMemCd(MemberVO member) throws SQLException;

	/**
	 * 비밀번호 변경
	 * @param member
	 * @throws SQLException
	 */
	void updateMemPwd(MemberVO member) throws SQLException;

}
