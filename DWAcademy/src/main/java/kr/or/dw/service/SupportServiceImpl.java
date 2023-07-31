package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.SupportDAO;
import kr.or.dw.vo.FaqVO;

public class SupportServiceImpl implements SupportService{

	@Autowired
	private SupportDAO supportDAO;

	@Override
	public Map<String, Object> getFaQList(SearchCriteria cri) throws SQLException {
		
		List<FaqVO> faqList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		faqList = supportDAO.selectFaQList(cri, rowBounds);
		
		int totalCount = supportDAO.selectFaQListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("totalCount", totalCount);
		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
}
