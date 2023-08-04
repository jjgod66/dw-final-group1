package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Date;
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
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaVO;
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

	@Override
	public void modifyHouse(HouseVO house) throws SQLException {
		thrAdminDAO.updateHouse(house);
	}

	@Override
	public Map<String, Object> selectNoticeList(SearchCriteria cri) throws SQLException {
		List<NoticeVO> noticeList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		noticeList = thrAdminDAO.selectNoticeList(cri, rowBounds);
		
		int totalCount = thrAdminDAO.selectSearchNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void registNotice(NoticeVO notice) throws SQLException {
		Map<String, Object> thr = thrAdminDAO.selectThrByAdmin_cd(notice.getAdmin_cd());
		String thr_name = (String) thr.get("THR_NAME");
		notice.setNotice_thr(thr_name);
		thrAdminDAO.insertNotice(notice);
	}

	@Override
	public Map<String, Object> selectQnaList(SearchCriteria cri) throws SQLException {
		List<QnaVO> qnaList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		qnaList = thrAdminDAO.selectQnaList(cri, rowBounds);
		
		int totalCount = thrAdminDAO.selectSearchQnaListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("qnaList", qnaList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void registAns(AnswerVO ans) throws SQLException {
		thrAdminDAO.insertAns(ans);
	}

	@Override
	public Map<String, Object> selectEventList(SearchCriteria cri) throws SQLException {
		List<EventVO> eventList = null;
		eventList = thrAdminDAO.selectEventList(cri);
		
		int totalCount = thrAdminDAO.selectSearchEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> selectEventListforPast(SearchCriteria cri) throws SQLException {
		List<EventVO> eventList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		eventList = thrAdminDAO.selectEventListforPast(cri, rowBounds);
		
		int totalCount = thrAdminDAO.selectEventListforPastCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<Map<String, Object>> selectMovieListforMovieMain(Date date) throws SQLException {
		return thrAdminDAO.selectMovieListforMovieMain(date);
	}

	@Override
	public List<Map<String, Object>> selectScreenListforMovieMain(Map data) throws SQLException {
		return thrAdminDAO.selectScreenListforMovieMain(data);
	}

	@Override
	public int checkScreenTimeClash(Map<String, Object> data) throws SQLException {
		return thrAdminDAO.checkScreenTimeClash(data);
	}

	@Override
	public void addNewScreen(ScreenVO screen) throws SQLException {
		thrAdminDAO.insertScreen(screen);
	}

	@Override
	public Map<String, Object> selectScreenByScreen_cd(String screen_cd) throws SQLException {
		return thrAdminDAO.selectScreenByScreen_cd(screen_cd);
	}

	@Override
	public void modifyScreen(ScreenVO screen) throws SQLException {
		thrAdminDAO.updateScreen(screen);
		
	}

	@Override
	public void deleteScreen(ScreenVO screen) throws SQLException {
		thrAdminDAO.deleteScreen(screen);
	}

	@Override
	public List<NoticeVO> selectNoticeForMain(String admin_cd) throws SQLException {
		return thrAdminDAO.selectNoticeForMain(admin_cd);
	}

	@Override
	public List<QnaVO> selectQnaForMain(String admin_cd) throws SQLException {
		return thrAdminDAO.selectQnaForMain(admin_cd);
	}

	@Override
	public List<EventVO> selectEventForMain(String admin_cd) throws SQLException {
		return thrAdminDAO.selectEventForMain(admin_cd);
	}

}
