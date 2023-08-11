package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SupportService;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaAttachVO;
import kr.or.dw.vo.QnaVO;

@Controller
@RequestMapping("/support")
public class SupportController {
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private SupportService supportService;

//	여기부터시작 
	
	@RequestMapping("/main")
	public ModelAndView supportMain(ModelAndView mnv) throws SQLException {
		String url = "/support/main"; 
		
		List<FaqVO> faqList = null;
		faqList = supportService.getFaQ5();
		
		List<NoticeVO> noticeList = null;
		noticeList = supportService.getNotice5();
		
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("faqList", faqList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/notice")
	public ModelAndView supportNotice(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/support/notice";
		
		Map<String, Object> dataMap = null;
		dataMap = supportService.getNoticeList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
//	@RequestMapping("/noticeDetail")
//	public String supportNoticeDetail() {
//		String url = "/support/noticeDetail";
//		return url;
//	}
	
	@RequestMapping("/noticeMini_Detail")
	public ModelAndView supportNoticeDetail(ModelAndView mnv, int notice_no) throws SQLException {
		String url = "/support/noticeMini_Detail";
		
		NoticeVO notice = null;
		notice = supportService.getNoticeDetail(notice_no);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/faq")
	public ModelAndView supportFaq(ModelAndView mnv, SearchCriteria cri, String faq_no) throws SQLException{
		String url = "/support/faq";
		Map<String, Object> dateMap = null;
		if(cri.getSearchType() == null) {
			cri.setSearchType("전체");
		}
		dateMap = supportService.getFaQList(cri);
		
		System.out.println(faq_no);
		int a = 0;
		if(faq_no != null) {
			a = Integer.parseInt(faq_no);
		}
		
		mnv.addObject("faq_no", a);
		mnv.addAllObjects(dateMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/inquiry")
	public ModelAndView supportin(ModelAndView mnv, HttpSession session) {
		String url = "/support/inquiry";
		
		String mem_cd = "";
		String mem_name = "";
		String mem_email = "";
		String mem_phone = "";

		if(session.getAttribute("loginUser") != null) {
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			System.out.println(member);
			mem_cd = (String) member.get("CD");
			mem_name = (String) member.get("NAME");
			mem_email = (String) member.get("EMAIL");
			mem_phone = (String) member.get("PHONE");
		}
		System.out.println(mem_email);
		System.out.println(mem_phone);
		System.out.println(mem_cd);
		
		mnv.addObject("mem_cd", mem_cd);
		mnv.addObject("mem_name", mem_name);
		mnv.addObject("mem_email", mem_email);
		mnv.addObject("mem_phone", mem_phone);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/inquiry_nonMember")
	public String supportinNon() {
		String url = "/support/inquiry_nonMember";
		return url;
	}
	
	@RequestMapping("/nonMemInqChk")
	public ResponseEntity<String> nonMemInqChk(QnaVO qna){
		ResponseEntity<String> entity = null;
		
		String result = null;
		try {
			result = supportService.nonMemInqYN(qna);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/inquiry_nonMember_list")
	public ModelAndView supportinNonList(ModelAndView mnv, QnaVO qna, String keyword) throws SQLException {
		String url = "/support/inquiry_nonMember_list";
		
		List<QnaVO> qnaList = null;
		qnaList = supportService.getNonMemQnaList(qna, keyword);
		
		mnv.addObject("keyword", keyword);
		mnv.addObject("qnaList", qnaList);
		mnv.addObject("qnaMem", qna);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/inquiry_nonMember_board")
	public ModelAndView supportinNonListResult(ModelAndView mnv, int que_no) throws SQLException {
		String url = "/support/inquiry_nonMember_list_login_result";
		
		QnaVO qna = null;
		AnswerVO answer = null;
		qna = supportService.getQnaByQueNo(que_no);
		answer = supportService.getAnswerByQueNo(que_no);
		QnaAttachVO attach = null;
		attach = supportService.getQnaAttachByQnaNo(que_no);
		String attach_name = null;
		if(attach != null) {
			attach_name = attach.getAttach_path().split("\\$\\$")[1];
		}
		
		mnv.addObject("answer", answer);
		mnv.addObject("qna", qna);
		mnv.addObject("attach", attach);
		mnv.addObject("attach_name", attach_name);
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/qnaDel")
	public ResponseEntity<String> qnaDel(int que_no){
		ResponseEntity<String> entity = null;
		
		try {
			supportService.deleteQna(que_no);
			entity = new ResponseEntity<String>("S", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/queType")
	public ResponseEntity<List<String>> queType(String que_sel){
		ResponseEntity<List<String>> entity = null;
		
		List<String> typeList = null;
		try {
			typeList = supportService.getQueType(que_sel);
			entity = new ResponseEntity<List<String>>(typeList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/locThrList")
	public ResponseEntity<List<String>> locThrList(String thr_loc){
		ResponseEntity<List<String>> entity = null;
		
		List<String> thrList = null;
		
		try {
			thrList = supportService.getThrList(thr_loc);
			entity = new ResponseEntity<List<String>>(thrList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/qnaReg")
	public String qnaRegist(QnaVO qna, HttpServletResponse res) throws Exception {
		String url = "redirect:/support/inquiryRegSuccess.do";
		QnaAttachVO attach = new QnaAttachVO();
		System.out.println(qna.getAttachment());
		System.out.println(qna.getAttachment().getOriginalFilename());
		if(qna.getAttachment().getOriginalFilename() != null && !"".equals(qna.getAttachment().getOriginalFilename())) {
			System.out.println("con1");
			attach = saveFile(qna.getAttachment());
		}
		System.out.println("con2");
		
		supportService.registQna(qna, attach);
		
		return url;
	}
	
	@RequestMapping("/inquiryRegSuccess")
	public void inquiryRegSuccess(HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('문의가 등록되었습니다.')");
		out.println("location.href='inquiry.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}

	private QnaAttachVO saveFile(MultipartFile attachment) throws Exception{
		System.out.println("save1");
		String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + attachment.getOriginalFilename();
		System.out.println("save2");
		File target = new File("C:/DWAcademyFiles/qna/", fileName);
		System.out.println("save3");
		if(!target.exists()) {
			target.mkdirs();
		}
		System.out.println("save4");
		attachment.transferTo(target);
		
		System.out.println("save5");
		QnaAttachVO attach = new QnaAttachVO();
		attach.setAttach_path(fileName);
		attach.setAttach_type(fileName.split("\\.")[1]);
		System.out.println("save6");
	
		return attach;
	}
	
	@RequestMapping("/consult")
	public String consult() {
		String url = "/support/consult";
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
	@RequestMapping("/membership")
	public String memberShip() {
		String url = "/support/membership";
		return url;
	}
}
