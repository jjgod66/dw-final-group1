package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.ThrAdminDAO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;

@Service
public class ThrAdminServiceImpl implements ThrAdminService {
	
	@Autowired
	private ThrAdminDAO thrAdminDAO;
//무비정보불러오
	@Override
	public List<MovieVO> getAllScreens() throws SQLException {
		// TODO Auto-generated method stub
		List<MovieVO> allScreenList = null;
		allScreenList = thrAdminDAO.selectAllScreens();
		return allScreenList;
	}
//상영영화불러오
	@Override
	public List<ScreenVO> getallStart() throws SQLException {
		// TODO Auto-generated method stub
		List<ScreenVO> allStart = null;
		allStart = thrAdminDAO.selectAllStart();
		return allStart;
	}
	@Override
	public List<Map<String, Object>> getAllRe() throws SQLException {
		// TODO Auto-generated method stub
		List<Map<String, Object>> allRe = null;
		allRe = thrAdminDAO.selectAllRe();
		return allRe;
	}
	@Override
	public ClickMovieInfoVO getMovieInfoByScreenCd(String screenCd) throws SQLException {
		// TODO Auto-generated method stub
		ClickMovieInfoVO movieInfo = null;
		movieInfo = thrAdminDAO.selectAllRe1(screenCd);
		return movieInfo;
	}

}
