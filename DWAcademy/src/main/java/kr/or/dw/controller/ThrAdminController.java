package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ThrAdminService;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;

@Controller
@RequestMapping("/thrAdmin")
public class ThrAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private ThrAdminService thrAdminService;
	
	@RequestMapping("/main")
	public ModelAndView thrAdminIndex(ModelAndView mnv) {
		
		String url = "/thrAdmin/main";
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/theaterAdminMain")
	public ModelAndView placeAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		
		String url = "/thrAdmin/theaterAdminMain";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv) throws SQLException {
		
		String url = "thrAdmin/theaterAdminRegist";
//		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
//		 
//		if (thr_name != null) {	// 수정일 때
//			TheaterVO thr = sysAdminService.selectTheaterByName(thr_name);
//			mnv.addObject("thr", thr);
//			subjectMap = addSubject("HOME", "지점 관리", "지점 수정");
//		} else {				// 등록일 때
//			subjectMap = addSubject("HOME", "지점 관리", "지점 등록");
//		}
//		
//		List<String> locList = sysAdminService.selectLocList();
//		
//		mnv.addAllObjects(subjectMap);
//		mnv.addObject("locList", locList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@GetMapping("/movieAdminMain")
	public ModelAndView movieAdmin(ModelAndView mnv, String movie_cd) throws SQLException {
		
		String url = "/thrAdmin/movieAdminMain";
		if(movie_cd == null) {
			movie_cd = "";
		}
		
		List<MovieVO> allScreenList = null;
		allScreenList = thrAdminService.getAllScreens();
		
		List<ScreenVO> allStart = null;
		allStart = thrAdminService.getallStart();
		
		List<Map<String, Object>> allRe = null;
		allRe = thrAdminService.getAllRe();
		List<JSONObject> newAllRe = new ArrayList<>();
		for( Map<String,Object> map : allRe){

		    JSONObject json = new JSONObject();

		    for( Map.Entry<String,Object> entry : map.entrySet() ){

		        String key = entry.getKey();
		        Object value = entry.getValue();
		        json.put(key, value);	
		    }	
		    newAllRe.add(json);
		}
		System.out.println(newAllRe);
		mnv.addObject("allRe", newAllRe);
		mnv.addObject("allStart",allStart);
		mnv.addObject("allScreenList", allScreenList);
		mnv.addObject("movie_cd", movie_cd);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@GetMapping("/supportAdminMain")
	public String customerAdmin() {
		
		String url = "/thrAdmin/supportAdminMain";
		
		return url;
	}
	
	@GetMapping("/eventAdminMain")
	public String eventAdmin() {
		
		String url = "/thrAdmin/eventAdminMain";
		
		return url;
	}
	
	@GetMapping("/eventAdminPast")
	public String eventAdminPast() {
		
		String url="/thrAdmin/eventAdminPast";
		
		return url;
	}
	
	@GetMapping("/eventAdminWinner")
	public String eventAdminWinner() {
		
		String url="/thrAdmin/eventAdminWinner";
		
		return url;
	}
	
	@GetMapping("/eventRegist")
	public String eventRegist() {
		
		String url="/thrAdmin/eventRegist";
		
		return url;
	}
	
	// admin_contentHeader에 넣을 정보들
	private Map<String, Object> addSubject(String subject, String item1, String item2) {
		Map<String, Object> subjectMap = new HashMap<String, Object>();
		subjectMap.put("subject", subject);
		subjectMap.put("item1", item1);
		subjectMap.put("item2", item2);
		return subjectMap;
	}
}
