package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SysAdminService;

@Controller
@RequestMapping("/sysAdmin")
public class SysAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@RequestMapping("/index")
	public ModelAndView sysAdminIndex(ModelAndView mnv) {
		String url = "/sysAdmin/index";
		
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/theaterList")
	public ModelAndView placeAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/theaterList";
		
		Map<String, Object> dataMap = sysAdminService.selectTheaterList(cri);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/adminCinemaMain")
	public String adminCinemaMain() {
		String url = "/sysAdmin/adminCinemaMain";
		return url;
	}
	@GetMapping("/placeRegistAdmin")
	public String placeRegistAdmin() {
		String url = "/sysAdmin/placeRegistAdmin";
		return url;
	}
}
