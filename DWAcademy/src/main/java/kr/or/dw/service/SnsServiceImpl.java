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
	public SnsVO kakaoSelectByMemberCode(String email) throws SQLException {
		return snsDAO.kakaoSelectByMemberCode(email);
	}

	@Override
	public void kakaoInsert(HashMap<String, Object> userInfo) throws SQLException {
		snsDAO.kakaoInsert(userInfo);
	}

	@Override
	public SnsVO selectKakaoInfo(MemberVO member) throws SQLException {
		return snsDAO.selectKakaoInfo(member);
	}

	@Override
	public SnsVO selectNaverInfo(MemberVO member) throws SQLException {
		return snsDAO.selectNaverInfo(member);
	}

	@Override
	public void kakaounlink(MemberVO user) throws SQLException {
		snsDAO.kakaoDelete(user);
	}

	@Override
	public SnsVO naverSelectByMemberCode(String email) throws SQLException {
		return snsDAO.naverSelectByMemberCode(email);
	}

	@Override
	public void naverInsert(HashMap<String, Object> naverUserInfo) throws SQLException {
		snsDAO.naverInsert(naverUserInfo);
	}

	@Override
	public void naverUnlink(MemberVO user) throws SQLException {
		snsDAO.neverDelete(user);
	}


}
