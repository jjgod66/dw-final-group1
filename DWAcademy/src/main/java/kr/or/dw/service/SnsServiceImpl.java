package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
	public Map<String, Object> selectKakaoInfo(String mem_cd) throws SQLException {
		return snsDAO.selectKakaoInfo(mem_cd);
	}

	@Override
	public Map<String, Object> selectNaverInfo(String mem_cd) throws SQLException {
		return snsDAO.selectNaverInfo(mem_cd);
	}

	@Override
	public void kakaounlink(String sns_email) throws SQLException {
		snsDAO.kakaoDelete(sns_email);
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
	public void naverUnlink(String sns_email) throws SQLException {
		snsDAO.neverDelete(sns_email);
	}

	@Override
	public SnsVO kakaoEmailCheck(String mem_email) throws SQLException {
		return snsDAO.kakaoEmailCheck(mem_email);
	}

	@Override
	public SnsVO naverEmailCheck(String sns_email) throws SQLException {
		return snsDAO.naverEmailCheck(sns_email);
	}


}
