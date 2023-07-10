package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.SysAdminDAO;
import kr.or.dw.vo.TheaterVO;

public class SysAdminServiceImpl implements SysAdminService {

	@Autowired
	private SysAdminDAO sysAdminDAO;
	
	@Override
	public Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException {
		
		List<TheaterVO> theaterList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		theaterList = sysAdminDAO.selectSearchTheaterList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchTheaterListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("theaterList", theaterList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<String> selectLocList() throws SQLException {
		List<String> locList = null;
		
		locList = sysAdminDAO.selectLocList();
		
		return locList;
	}

}
