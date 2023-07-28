package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.ThrAdminDAO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;

@Service
public class ThrAdminServiceImpl implements ThrAdminService {
	
	@Autowired
	private ThrAdminDAO thrAdminDAO;
	
//무비정보불러오
	
	@Override
    public List<MovieVO> getAllScreens(int pageNo, int pageSize) throws SQLException {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;
        Map<String, Integer> parameterMap = new HashMap<>();
        parameterMap.put("start", start);
        parameterMap.put("end", end);
        return thrAdminDAO.selectList(parameterMap);
    }
	
	@Override
	public List<MovieVO> getAllScreens1() throws SQLException {
		// TODO Auto-generated method stub
		List<MovieVO> allScreens1 = null;
		allScreens1 = thrAdminDAO.selectAllScreens1();
		return allScreens1;
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
	@Override
	public Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		List<Map<String, Object>> movieList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		movieList = thrAdminDAO.selectSearchMovieList(cri, rowBounds);
		
		for (Map<String, Object> movie : movieList) {
			String movie_cd = (String)movie.get("MOVIE_CD");
			double reserveRatio = thrAdminDAO.selectReservRatio(movie_cd);
			movie.put("reserveRatio", reserveRatio);
		}
		int totalCount = thrAdminDAO.selectSearchMovieListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("movieList", movieList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public int getTotalReCount() throws SQLException {
		// TODO Auto-generated method stub
		return thrAdminDAO.getTotalReCount();
	}

	@Override
	public List<MovieVO> getAllScreensPaged(int offset, int perPage) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getAllScreens(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Map<String, Object>> allMovieList = thrAdminDAO.getAllMovieList(cri, rowBounds);
		int totalCount = thrAdminDAO.getTotalReCount1(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("allMovieList", allMovieList);
		resultMap.put("pageMaker", pageMaker);
		return resultMap;
	}

	@Override
	public Map<String, Object> selectThrByAdmin_cd(String admin_cd) throws SQLException {
		
		return thrAdminDAO.selectThrByAdmin_cd(admin_cd);
	}

	@Override
	public void modifyThrInfo(TheaterVO thr) throws SQLException {
		thrAdminDAO.modifyThrInfo(thr);
	}

	@Override
	public List<Map<String, Object>> selectHouseListByAdmin_cd(String admin_cd) throws SQLException {
		return thrAdminDAO.selectHouseListByAdmin_cd(admin_cd);
	}

	@Override
	public void registHouse(HouseVO house) throws SQLException {
		thrAdminDAO.insertHouse(house);
	}

	@Override
	public HouseVO selectHouseByHouse_no(int house_no) throws SQLException {
		return thrAdminDAO.selectHouseByHouse_no(house_no);
	}


	

}
