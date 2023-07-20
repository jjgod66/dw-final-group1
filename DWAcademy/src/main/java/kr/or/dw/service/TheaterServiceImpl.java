package kr.or.dw.service;

import java.sql.SQLException;

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

	
}
