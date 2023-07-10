package kr.or.dw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv) throws SQLException {
		String url = "sysAdmin/placeRegistAdmin";
		
		List<String> locList = sysAdminService.selectLocList();
		
		mnv.addObject("locList", locList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/theaterRegist")
	public void theaterRegist(TheaterVO thr) {
		System.out.println(thr);
	}
	@GetMapping("/movieAdmin")
	public String movieAdmin() {
		String url = "/sysAdmin/movieAdmin";
		return url;
	}
	@GetMapping("/customerAdmin")
	public String customerAdmin() {
		String url = "/sysAdmin/customerAdmin";
		return url;
	}
	@GetMapping("/eventAdmin")
	public String eventAdmin() {
		String url = "/sysAdmin/eventAdmin";
		return url;
	}
	@GetMapping("/storeAdmin")
	public String storeAdmin() {
		String url = "/sysAdmin/storeAdmin";
		return url;
	}
	@GetMapping("/eventAdminPast")
	public String eventAdminPast() {
		String url="/sysAdmin/eventAdminPast";
		return url;
	}
	@GetMapping("/eventAdminWinner")
	public String eventAdminWinner() {
		String url="/sysAdmin/eventAdminWinner";
		return url;
	}
	@GetMapping("/eventRegist")
	public String eventRegist() {
		String url="/sysAdmin/eventRegist";
		return url;
	}
	
}
