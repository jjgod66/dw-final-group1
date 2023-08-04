package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.NonMemDAO;
import kr.or.dw.vo.Non_MemberVO;

public class NonMemServiceImpl implements NonMemService{

	@Autowired
	private NonMemDAO nonMemDAO;

	@Override
	public String getNonMemExist(Non_MemberVO non_mem) throws SQLException {
		String result = "N";
		int cnt = 0;
		cnt = nonMemDAO.selectNonMemExist(non_mem);
		if(cnt > 0) {
			result = "Y";
		}
		
		return result;
	}

	@Override
	public Map<String, Object> getNonMemResList(Non_MemberVO non_mem, SearchCriteria cri) throws SQLException {
		List<Map<String, Object>> resList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> param = new HashMap<>();
		param.put("non_mem_name", non_mem.getNon_mem_name());
		param.put("non_mem_phone", non_mem.getNon_mem_phone());
		param.put("non_mem_bir", non_mem.getNon_mem_bir());
		param.put("non_mem_pwd", non_mem.getNon_mem_pwd());
		if(cri.getSearchType() == null) {
			cri.setSearchType("curr");
		}
		param.put("searchType", cri.getSearchType());
		System.out.println("st" + cri.getSearchType());
		resList = nonMemDAO.selectNonMemResList(param, rowBounds);
		
		int totalCount = nonMemDAO.selectNonMemResCount(param);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("resList", resList);
		dataMap.put("totalCount", totalCount);
		
		
		return dataMap;
	}
}
