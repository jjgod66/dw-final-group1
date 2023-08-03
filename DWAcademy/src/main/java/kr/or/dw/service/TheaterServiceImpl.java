package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.TheaterDAO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.NoticeVO;
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
	public List<List<List<Map<String,Object>>>> getAllScreenList(String thr_name, Date date) throws SQLException {
		List<List<List<Map<String, Object>>>> allScreenList = new ArrayList<>();
		List<String> movieList = null;
		List<String> houseList = null;
		
		Map<String, Object> param = new HashMap<>();
		param.put("thr_name", thr_name);
		param.put("date", date);
		
		List<Map<String, Object>> houseScreenList = null;
		movieList = theaterDAO.selectDayMovieList(param);
		
		for(String movie_cd : movieList) {
			
			Map<String, Object> param2 = new HashMap<>();
			param2.put("movie_cd", movie_cd);
			param2.put("date", date);
			param2.put("thr_name", thr_name);
			houseList = theaterDAO.selectDayHouseList(param2);
			
			List<List<Map<String, Object>>> houseMovieList = new ArrayList<>();
			for(String house_no : houseList) {
				
				Map<String, Object> param3 = new HashMap<>();
				param3.put("movie_cd", movie_cd);
				param3.put("date", date);
				param3.put("thr_name", thr_name);
				param3.put("house_no", house_no);
				
				
				houseScreenList = theaterDAO.selectHouseScreenList(param3);
				houseMovieList.add(houseScreenList);
			}
			
			
			allScreenList.add(houseMovieList);
			
			
		}
		System.out.println("asl" + allScreenList);
		
		return allScreenList;
	}

	@Override
	public List<Map<String, Object>> getThrNotice() throws SQLException {
		List<Map<String, Object>> noticeAllList = null;
		noticeAllList = theaterDAO.selectThrNotice();
		
		List<Map<String, Object>> noticeList = new ArrayList<>();
		int cnt = 5;
		if(noticeAllList.size() < 5) {
			cnt = noticeAllList.size();
		}
		if(cnt > 0) {
			for(int i = 0; i < cnt; i++) {
				noticeList.add(noticeAllList.get(i));
			}
		}
		
		return noticeList;
	}

	@Override
	public List<NoticeVO> getThisThrNotice(String thr_name) throws SQLException {
		List<NoticeVO> noticeAllList = null;
		
		noticeAllList = theaterDAO.selectThisThrNotice(thr_name);
		
		List<NoticeVO> noticeList = new ArrayList<>();
		
		int cnt = 5;
		if(noticeAllList.size() < 5) {
			cnt = noticeAllList.size();
		}
		if(cnt > 0) {
			for(int i = 0; i < cnt; i++) {
				noticeList.add(noticeAllList.get(i));
			}
		}
		
		return noticeList;
	}

	@Override
	public List<EventVO> getThrEvent() throws SQLException {
		List<EventVO> allEventList = null;
		
		allEventList = theaterDAO.selectThrEvent();
		List<EventVO> eventList = new ArrayList<>();
		
		int cnt = 4;
		if(allEventList.size() < 4) {
			cnt = allEventList.size();
		}
		if(cnt > 0) {
			for(int i = 0; i < cnt; i++) {
				eventList.add(allEventList.get(i));
			}
		}
		
		
		return eventList;
	}

	@Override
	public List<EventVO> getThisThrEvent4(String thr_name) throws SQLException {
		List<EventVO> eventList = null;
		
		eventList = theaterDAO.selectThisThrEvent4(thr_name);
		
		return eventList;
	}

	@Override
	public List<TheaterVO> getAllTheaterList() throws SQLException {
		return theaterDAO.getAllTheaterList();
	}

	@Override
	public List<TheaterVO> searchTheaterName(String selectLocData) throws SQLException {
		return theaterDAO.searchTheaterName(selectLocData);
	}

	
}
