package kr.or.dw.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {


	/*
	 * 맴버 뷰어 컨트롤러 
	 */
	private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
	@GetMapping("/member/login")
	public String loginForm(HttpServletResponse res) throws Exception {
		String url = "/member/login";
		
		return url;
	}
	@GetMapping("/member/join")
	public String memberJoin() {
		String url = "/member/join";
		return url;
	}

	@GetMapping("/member/membership")
	public String memberShip() {
		String url = "/member/membership";
		return url;
	}
	
	/*
	 * 영화 뷰어 컨트롤러 
	 */
	@GetMapping("/movie/review")
	public String movieReview() {
		String url = "/movie/review";
		return url;
	}
	@GetMapping("/movie/viewer")
	public String movieViewer() {
		String url = "/movie/viewer";
		return url;
	}

	/*
	 * 예매 뷰어 컨트롤러 
	 */
	@GetMapping("/booking/cinema")
	public String bookingCinema() {
		String url = "/booking/cinema";
		return url;
	}
	@GetMapping("/booking/movie")
	public String bookingMovie() {
		String url = "/booking/movie";
		return url;
	}
	@GetMapping("/booking/payment")
	public String bookingPayment() {
		String url = "/booking/payment";
		return url;
	}

	
	/*
	 * 스토어 뷰어 컨트롤러 
	 */
	@GetMapping("/store/index")
	public String storeIndex() {
		String url = "/store/index";
		return url;
	}

	@GetMapping("/store/detail")
	public String storeDetail() {
		String url = "/store/detail";
		return url;
	}
	
	/*
	 * 고객센터 뷰어 컨트롤러 
	 */
	@GetMapping("/support/notice")
	public String supportNotice() {
		String url = "/support/notice";
		return url;
	}
	@GetMapping("/support/faq")
	public String supportFaq() {
		String url = "/support/faq";
		return url;
	}

}
