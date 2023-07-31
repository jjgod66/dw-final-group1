package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.EventService;
import kr.or.dw.vo.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("/main")
	public ModelAndView eventMain(ModelAndView mnv) throws SQLException {
		String url = "/event/main";
		List<EventVO> movieEventList = null;
		List<EventVO> theaterEventList = null;
		List<EventVO> stageEventList = null;
		
		movieEventList = eventService.getMovieEvent4();
		theaterEventList = eventService.getTheaterEvent4();
		stageEventList = eventService.getStageEvent4();
		
		mnv.addObject("movieEventList", movieEventList);
		mnv.addObject("theaterEventList", theaterEventList);
		mnv.addObject("stageEventList", stageEventList);
		mnv.setViewName(url);
		return mnv;
	} 
	@GetMapping("/eventDetail")
	public ModelAndView eventDetail(ModelAndView mnv, int event_no, HttpServletRequest req) throws SQLException {
		String url = "/event/eventDetail";
		
		EventVO event = null;
		event = eventService.getEventDetail(event_no);
		
		String referer = (String)req.getHeader("REFERER");
		
		String p = "N";
		
		if(referer.equals("http://localhost/event/eventPast.do")) {
			p = "Y";
		}
		mnv.addObject("p", p);
		mnv.addObject("event", event);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/eventPast")
	public ModelAndView eventPast(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/event/eventPast";
		
		Map<String, Object> dataMap = null;
		dataMap = eventService.getPastEventList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/prizeWinner")
	public String prizeWinner() {
		String url = "/event/prizeWinner";
		return url;
	}
	
	@RequestMapping("/winnerResult")
	public ModelAndView winnerResult(ModelAndView mnv, int event_no) throws SQLException{
		String url = "/event/prizeWinnerResult";
		
		EventVO event = null;
		event = eventService.getEventWinner(event_no);
		
		mnv.addObject("event", event);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/movie")
	public ModelAndView movieEvent(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/event/movie";
		cri.setPerPageNum("12");
		Map<String, Object> dataMap = null;
		dataMap = eventService.getMovieEventList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/theater")
	public ModelAndView theaterEvent(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/event/theater";
		cri.setPerPageNum("12");
		Map<String, Object> dataMap = null;
		dataMap = eventService.getTheaterEventList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/stage")
	public ModelAndView stageEvent(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/event/stage";
		cri.setPerPageNum("12");
		Map<String, Object> dataMap = null;
		dataMap = eventService.getStageEventList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
}
