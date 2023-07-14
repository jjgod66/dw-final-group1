package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;

import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public interface SnsService {

	SnsVO selectByMemberCode(String email) throws SQLException;

	void insertSocal(HashMap<String, Object> userInfo) throws SQLException;

	SnsVO selectSnsInfo(MemberVO member) throws SQLException;

}
