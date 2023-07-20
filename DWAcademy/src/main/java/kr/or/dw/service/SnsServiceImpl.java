package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.SnsDAO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public class SnsServiceImpl implements SnsService{

	@Autowired
	private SnsDAO snsDAO;
	
	@Override
	public SnsVO selectByMemberCode(String email) throws SQLException {
		return snsDAO.selectByMemberCode(email);
	}

	@Override
	public void insertSocal(HashMap<String, Object> userInfo) throws SQLException {
		snsDAO.insert(userInfo);
	}

	@Override
	public SnsVO selectSnsInfo(MemberVO member) throws SQLException {
		return snsDAO.selectSnsInfo(member);
	}

	@Override
	public void unlink(MemberVO user) throws SQLException {
		snsDAO.delete(user);
	}

}
