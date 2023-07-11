package kr.or.dw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dw.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("/main")
	public String eventMain() {
		String url = "/event/main";
		return url;
	} 
	@GetMapping("/eventDetail")
	public String eventDetail() {
		String url = "/event/eventDetail";
		return url;
	}
	@GetMapping("/eventPast")
	public String eventPast() {
		String url = "/event/eventPast";
		return url;
	}
	@GetMapping("/prizeWinner")
	public String prizeWinner() {
		String url = "/event/prizeWinner";
		return url;
	}
	@GetMapping("/prizeWinnerResult")
	public String prizeWinnerResult() {
		String url = "/event/prizeWinnerResult";
		return url;
	}
	
}
