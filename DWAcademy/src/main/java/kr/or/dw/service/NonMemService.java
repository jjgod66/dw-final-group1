package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
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

}
