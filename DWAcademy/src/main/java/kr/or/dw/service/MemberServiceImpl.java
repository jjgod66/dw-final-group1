package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.MemberDAO;
import kr.or.dw.dao.MovieDAO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SnsVO;

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public Map<String, String> selectMemberById(String id) throws SQLException {
		return memberDAO.selectMemberById(id);
	}

	@Override
	public void join(MemberVO memVO) throws SQLException {
		memberDAO.insert(memVO);
	}

	@Override
	public Map<String, Object> selectMemberCode(SnsVO sns) throws SQLException {
		return memberDAO.selectMemberCode(sns);
	}

	@Override
	public MemberVO CheckMember(String mem_phone) throws SQLException {
		return memberDAO.CheckMember(mem_phone);
	}

	@Override
	public Map<String, Object> CheckMemberEmail(String email) throws SQLException {
		return memberDAO.CheckMemberEmail(email);
	}

	@Override
	public void additionUpdate(Map<String, Object> dataMap) throws SQLException {
		memberDAO.additionUpdate(dataMap);
	}

	@Override
	public void updateMemgrade() throws SQLException {
		List<Map<String, Object>> memList = null;
		memList = memberDAO.selectMemMonthResCnt();
		
		
		for(Map<String, Object> mem : memList) {
			String mem_cd = (String)mem.get("MEM_CD");
			if(Integer.parseInt(String.valueOf(mem.get("RESCNT"))) >= 10) {
				
				memberDAO.updateMemGradeVIP(mem_cd);
			}else {
				memberDAO.updateMemGradeNormal(mem_cd);
				
			}
		}
		
	}

	@Override
	public void sleepMem() throws SQLException {
		String[] memList = null;
		memList = memberDAO.selectNotLoginYearMem();
		
		for(String mem : memList) {
			memberDAO.updateMemSleep(mem);
		}
	}

	@Override
	public void unbanMember() throws SQLException {
		memberDAO.updateMemUnban();
	}

	@Override
	public Map<String, Object> selectBuyInfo(SearchCriteria cri, String mem_cd) throws SQLException {
		
		List<ProductVO> BuyInfoList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		BuyInfoList = memberDAO.selectBuyInfoList(cri, rowBounds, mem_cd);
		int totalCount = memberDAO.selectBuyInfoListCnt(cri, mem_cd);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("totalCount", totalCount);
		dataMap.put("BuyInfoList", BuyInfoList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}

	@Override
	public Map<String, Object> searchBuyInfo(String mem_cd, SearchCriteria cri) throws SQLException {
		
		List<Map<String, Object>> buyInfoList = null;
		List<Map<String, Object>> movieInfoList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		buyInfoList = memberDAO.searchBuyInfo(cri, rowBounds, mem_cd);
		int buyTotalCount = memberDAO.searchBuyInfoListCnt(cri, mem_cd);
		
		movieInfoList = movieDAO.searchMovieInfoList(cri, rowBounds, mem_cd);
		int movieTotalCount = movieDAO.SearchMovieInfoListCnt(cri, mem_cd);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(movieTotalCount);
		
		PageMaker pageMaker2 = new PageMaker();
		pageMaker2.setCri(cri);
		pageMaker2.setTotalCount(buyTotalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("movieTotalCount", movieTotalCount);
		dataMap.put("movieInfoList", movieInfoList);
		
		dataMap.put("pageMaker", pageMaker);
		
		dataMap.put("buyTotalCount", buyTotalCount);
		dataMap.put("buyInfoList", buyInfoList);

		dataMap.put("pageMaker2", pageMaker2);
		
		dataMap.put("gb", "on");
		dataMap.put("cri", cri);
		
		return dataMap;
	}

}
