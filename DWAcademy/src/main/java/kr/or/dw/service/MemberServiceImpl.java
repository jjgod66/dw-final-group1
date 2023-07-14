package kr.or.dw.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.MemberDAO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		return memberDAO.selectMemberById(id);
	}

	@Override
	public void join(MemberVO memVO) throws SQLException {
		memberDAO.insert(memVO);
	}

	@Override
	public MemberVO selectMemberCode(SnsVO sns) throws SQLException {
		return memberDAO.selectMemberCode(sns);
	}

}
