package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SupportService;
import kr.or.dw.vo.FaqVO;

@Controller
@RequestMapping("/support")
public class SupportController {
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private SupportService supportService;

//	여기부터시작 
	
	@RequestMapping("/main")
	public String supportMain() {
		return "/support/main"; 
	}
	
	@RequestMapping("/notice")
	public String supportNotice() {
		String url = "/support/notice";
		return url;
	}
	
	@RequestMapping("/noticeDetail")
	public String supportNoticeDetail() {
		String url = "/support/noticeDetail";
		return url;
	}
	@RequestMapping("/faq")
	public ModelAndView supportFaq(ModelAndView mnv, SearchCriteria cri) throws SQLException{
		String url = "/support/faq";
		Map<String, Object> dateMap = null;
		
		dateMap = supportService.getFaQList(cri);
		
		mnv.addAllObjects(dateMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/inquiry")
	public String supportin() {
		String url = "/support/inquiry";
		return url;
	}
	@RequestMapping("/inquiry_nonMember")
	public String supportinNon() {
		String url = "/support/inquiry_nonMember";
		return url;
	}
	@RequestMapping("/inquiry_nonMember_list")
	public String supportinNonList() {
		String url = "/support/inquiry_nonMember_list";
		return url;
	}
	@RequestMapping("/inquiry_nonMember_list_login_result")
	public String supportinNonListResult() {
		String url = "/support/inquiry_nonMember_list_login_result";
		return url;
	}
	@RequestMapping("/agreeUse")
	public String supportAgreeUse() {
		String url = "/support/agreeUse";
		return url;
	}
	@RequestMapping("/agreeWhere")
	public String supportAgreeW() {
		String url = "/support/agreeWhere";
		return url;
	}
	@RequestMapping("/agreePrivacy")
	public String supportAgreeP() {
		String url = "/support/agreePrivacy";
		return url;
	}
	@RequestMapping("/agreeScreen")
	public String supportAgreeS() {
		String url = "/support/agreeScreen";
		return url;
	}
}
