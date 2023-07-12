package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ThrAdminService;

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

	@GetMapping("/movieAdminMain")
	public String movieAdmin() {
		
		String url = "/thrAdmin/movieAdminMain";
		
		return url;
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
