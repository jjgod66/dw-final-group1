package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.PointDAO;
import kr.or.dw.vo.PointVO;

public class PointServiceImpl implements PointService{

	@Autowired
	private PointDAO pointDAO;

	@Override
	public void insertMoviePoint() throws SQLException{
		List<Map<String, Object>> pointInList = null;
		pointInList = pointDAO.selectpointInList();
		System.out.println(pointInList);
		
		for(Map<String, Object> pointIn : pointInList) {
			if(((String)pointIn.get("MEM_GRADE")).equals("N")) {
				pointDAO.insertMoviePoint(pointIn);
			}else {
				pointDAO.insertMoviePointVIP(pointIn);
			}
		}
	}

	@Override
	public Map<String, Object> getMemPointList(String mem_cd, SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> param = new HashMap<>();
		param.put("mem_cd", mem_cd);
		param.put("searchType", cri.getSearchType());
		param.put("searchType2", cri.getSearchType2());
		
		List<Map<String, Object>> pointList = null;
		pointList = pointDAO.selectMemPointList(param);
		int totalCount = pointDAO.selectMemPointCount(param);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("pointList", pointList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public String giftCardReg(String mem_product_cd, String mem_cd) throws SQLException {
		String result = "N";
		
		int cnt = 0;
		cnt = pointDAO.selectMemProCdExist(mem_product_cd);
		String gb_use = null;
		
		if(cnt > 0) {
			gb_use = pointDAO.selectMemProCdGbUse(mem_product_cd);
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("mem_cd", mem_cd);
		param.put("mem_product_cd", mem_product_cd);
		int point = 0;
		if("N".equals(gb_use)) {
			point = pointDAO.selectPointByMemProCd(mem_product_cd);
			param.put("point",point);
			pointDAO.insertMemGiftCard(param);
			pointDAO.updateMemProGbUse(mem_product_cd);
			result = "S";
		}else if("Y".equals(gb_use)){
			result = "Y";
		}
		
		return result;
	}

	@Override
	public int getMemTotalPoint(String mem_cd) throws SQLException {
		int point = 0;
		List<PointVO> pointList = null;
		pointList = pointDAO.selectMemPoint(mem_cd);
		
		for(PointVO pointVo : pointList) {
			if(pointVo.getPoint_cd().substring(0, 1).equals("A")) {
				point += pointVo.getPoint();
			}else {
				point -= pointVo.getPoint();
			}
		}
		return point;
	}

	@Override
	public List<Map<String, Object>> get5PointList(String mem_cd) throws SQLException {
		return pointDAO.get5PointList(mem_cd);
	}
}
