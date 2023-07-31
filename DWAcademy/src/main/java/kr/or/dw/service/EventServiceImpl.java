package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.EventDAO;
import kr.or.dw.vo.EventVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> getMovieEvent4() throws SQLException {
		List<EventVO> movieEventList = null;
		movieEventList = eventDAO.selectMoiveEvent4();
		
		return movieEventList;
	}

	@Override
	public List<EventVO> getTheaterEvent4() throws SQLException {
		List<EventVO> theaterEventList = null;
		theaterEventList = eventDAO.selectTheaterEvent4();
		
		return theaterEventList;
	}

	@Override
	public List<EventVO> getStageEvent4() throws SQLException {
		List<EventVO> stageEventList = null;
		stageEventList = eventDAO.selectStageEvent4();
		
		return stageEventList;
	}

	@Override
	public EventVO getEventDetail(int event_no) throws SQLException {
		EventVO event = null;
		event = eventDAO.selectEventDetail(event_no);
		
		return event;
	}

	@Override
	public Map<String, Object> getMovieEventList(SearchCriteria cri) throws SQLException {
		List<EventVO> eventList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		eventList = eventDAO.selectMovieEventList(cri, rowBounds);
		
		int totalCount = eventDAO.selectMovieEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("totalCount", totalCount);
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getTheaterEventList(SearchCriteria cri) throws SQLException {
		List<EventVO> eventList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		eventList = eventDAO.selectTheaterEventList(cri, rowBounds);
		
		int totalCount = eventDAO.selectTheaterEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("totalCount", totalCount);
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getStageEventList(SearchCriteria cri) throws SQLException {
		List<EventVO> eventList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		eventList = eventDAO.selectStageEventList(cri, rowBounds);
		
		int totalCount = eventDAO.selectStageEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("totalCount", totalCount);
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getPastEventList(SearchCriteria cri) throws SQLException {

		List<EventVO> eventList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		eventList = eventDAO.selectPastEventList(cri, rowBounds);
		
		int totalCount = eventDAO.selectPastEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("totalCount", totalCount);
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public EventVO getEventWinner(int event_no) throws SQLException {
		EventVO event = null;
		event = eventDAO.selectEventWinner(event_no);
		
		return event;
	}

	@Override
	public List<EventVO> getEvent4() throws SQLException {
		List<EventVO> eventList = null;
		eventList = eventDAO.selectEvent4();
		
		return eventList;
	}

}
