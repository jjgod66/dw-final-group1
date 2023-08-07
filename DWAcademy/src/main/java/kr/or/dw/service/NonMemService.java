package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.Non_MemberVO;

public interface NonMemService {

	/**
	 * 입력한 정보에 해당하는 비회원이 있는지 확인하는 메서드
	 * @param non_mem
	 * @return
	 * @throws SQLException
	 */
	String getNonMemExist(Non_MemberVO non_mem) throws SQLException;

	/**
	 * 비회원 예매내역
	 * @param non_mem
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getNonMemResList(Non_MemberVO non_mem, SearchCriteria cri) throws SQLException;

	/**
	 * 회원 아이디 찾기
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	String getFindMemId(Map<String, String> member) throws SQLException;

	/**
	 * 비밀번호 찾기에서 입력한 정보에 해당하는 멤버코드 가져오는 메서드
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	String getFindMemCd(MemberVO member) throws SQLException;

	/**
	 * 비밀번호 변경
	 * @param member
	 * @throws SQLException
	 */
	void updateMemPwd(MemberVO member) throws SQLException;

}
