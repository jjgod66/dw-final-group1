package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.TheaterDAO;
import kr.or.dw.vo.TheaterVO;

public class TheaterServiceImpl implements TheaterService{

	@Autowired
	TheaterDAO theaterDAO;
	
	@Override
	public String[] getThrListByLoc(String loc) throws SQLException {
		String[] thrList = null;
		
		thrList = theaterDAO.selectThrByLoc(loc);
		return thrList;
	}

	@Override
	public TheaterVO getTheaterInfo(String thr_name) throws SQLException {
		TheaterVO theater = null;
		theater = theaterDAO.selectTheaterInfo(thr_name);
		
		return theater;
	}

	@Override
	public String clickLikeThr(String thr_name, String mem_cd) throws SQLException {
		String result = "";
		int likeThrCount = theaterDAO.selectLikeThrCount(mem_cd);

		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_cd", mem_cd);
		param.put("thr_name", thr_name);
		
		if(likeThrCount >= 5) {
			result = "over";
		}else {
			int thisThrCount = theaterDAO.selectThisThrLikeYN(param);
			if(thisThrCount > 0) {
				result = "cancel";
				theaterDAO.deleteLikeThr(param);
			}else {
				result = "like";
				theaterDAO.insertLikeThr(param);
			}
		}
		
		
		return result;
	}

	@Override
	public int likeThrYN(String thr_name, String mem_cd) throws SQLException {
		int cnt = 0;
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_cd", mem_cd);
		param.put("thr_name", thr_name);
		
		cnt = theaterDAO.selectThisThrLikeYN(param);
		
		return cnt;
	}

	@Override
	public List<List<List<Map<String, Object>>>> getAllScreenList(String thr_name, Date date) throws SQLException {
		List<List<List<Map<String, Object>>>> allScreenList = null;
		List<List<Map<String, Object>>> movieList = null;
		List<Map<String, Object>> houseList = null;
		
		
		return null;
	}

	
}
