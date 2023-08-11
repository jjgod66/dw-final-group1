package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRange;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.IndexMovieCommand;
import kr.or.dw.service.EventService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.NonMemService;
import kr.or.dw.service.StoreService;
import kr.or.dw.service.SupportService;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.QnaAttachVO;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	
	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;
	
	@Resource(name ="memberPicUploadPath")
	private String memberPicUploadPath;
	
	@Resource(name ="attachUploadPath")
	private String attachUploadPath;
	
	@Resource(name="photoTicketUploadPath")
	private String photoTicketUploadPath;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private SupportService supportService;
	
	@Autowired
	private NonMemService nonMemService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SysAdminService sysAdminService;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "/security/accessDenied";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/common/loginSuccess")
	public ModelAndView loginSuccess(ModelAndView mnv, HttpSession session) {
		String url = "";
		
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		System.out.println(loginUser);
		String AUTH = (String) loginUser.get("AUTH");
		System.out.println(AUTH);
		
		if(AUTH.equals("S")) {
			System.out.println("1");
			url = "redirect:/sysAdmin/main.do";
		}else if(AUTH.equals("T")) {
			System.out.println("2");
			url = "redirect:/thrAdmin/main.do";
		}else {
			url = "redirect:/main";
		}
		System.out.println(url);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView index(ModelAndView mnv, HttpSession session, String login) throws SQLException {
		String url = "/main";
		
		System.out.println(login);
		List<Map<String, Object>> movieListMap = null;
		movieListMap = movieService.getIndexBoxOfficeMovie10();
		
		List<IndexMovieCommand> movieList = new ArrayList<>();
		
		for(Map<String, Object> movieMap : movieListMap) {
			IndexMovieCommand imc = new IndexMovieCommand(movieMap);
			movieList.add(imc);
			
		}
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		mnv.addObject("url", naverAuthUrl);
		
		
		List<EventVO> eventList = null;
		eventList = eventService.getEvent4();
		
		List<EventVO> eventList2 = null;
		eventList2 = eventService.getEvent2();
		
		List<NoticeVO> noticeList = null;
		noticeList = supportService.getNotice2();
		
		List<ProductVO> productFood = null;
		productFood = storeService.getproductFood();
		
		List<FaqVO> faqList = null;
		faqList = supportService.getFaQ5();
		
		mnv.addObject("faqList", faqList);
		mnv.addObject("loginNeed", login);
		mnv.addObject("productFood", productFood);
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("eventList", eventList);
		mnv.addObject("eventList2", eventList2);
		mnv.addObject("movieList", movieList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/common/LoginTimeOut")
	public void loginTimeOut(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(req.getParameter("test"));
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/getPicture")
	public ResponseEntity<byte[]> getPicture(String name, String item_cd, String type) throws IOException  {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = "";
		if (type != "" && type != null) {
			if (type.equals("moviePoster")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "mainPoster";
			} else if (type.equals("movieImg")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "pictures";
			} else if (type.equals("productImg")) {
				imgPath = this.storePicUploadPath + File.separator + item_cd;
			} else if (type.equals("eventThumb")) {
				imgPath = this.eventPicUploadPath + File.separator + item_cd + File.separator + "thumb";
			} else if (type.equals("eventImg")) {
				imgPath = this.eventPicUploadPath + File.separator + item_cd + File.separator + "img";
			} else if (type.equals("memberPic")) {
				imgPath = this.memberPicUploadPath + File.separator + item_cd;
			} else if (type.equals("back")) {
				imgPath = this.photoTicketUploadPath + File.separator + "back";
			} else if (type.equals("front")) {
				imgPath = this.photoTicketUploadPath + File.separator + "front";
			}
		}
		
		try {
			in = new FileInputStream(new File(imgPath, name));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	 @RequestMapping(value = "/common/getVideo")
     public ResponseEntity<ResourceRegion> getVideo(@RequestHeader HttpHeaders headers, String movie_cd, String movie_pre_path) throws IOException {
        logger.info("VideoController.getVideo");
        UrlResource video = new UrlResource("file:"+ this.moviePicUploadPath + File.separator + movie_cd + File.separator + "videos" + File.separator + movie_pre_path);
        ResourceRegion resourceRegion;

        final long chunkSize = 1000000L;
        long contentLength = video.contentLength();

        Optional<HttpRange> optional = headers.getRange().stream().findFirst();
        HttpRange httpRange;
        if (optional.isPresent()) {
            httpRange = optional.get();
            long start = httpRange.getRangeStart(contentLength);
            long end = httpRange.getRangeEnd(contentLength);
            long rangeLength = Long.min(chunkSize, end - start + 1);
            resourceRegion = new ResourceRegion(video, start, rangeLength);
        } else {
            long rangeLength = Long.min(chunkSize, contentLength);
            resourceRegion = new ResourceRegion(video, 0, rangeLength);
        }

        return ResponseEntity.status(HttpStatus.PARTIAL_CONTENT)
                .contentType(MediaTypeFactory.getMediaType(video).orElse(MediaType.APPLICATION_OCTET_STREAM))
                .body(resourceRegion);
    }
	 
	@RequestMapping("/common/uploadTempImg")
	public ResponseEntity<String> uploadTempImg(MultipartFile file, HttpServletRequest req) {
		ResponseEntity<String> result = null;
		
		int fileSize = 5 * 1024 * 1024;
		
		if (file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.", HttpStatus.BAD_REQUEST);
		}
		
		String savePath = eventPicUploadPath + File.separator + "temp";
		String fileName = UUID.randomUUID().toString().replace("-", "")+"$$"+file.getOriginalFilename();
		
		File saveFile = new File(savePath, fileName);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(req.getContextPath() + "/sysAdmin/getTempImg.do?fileName=" + fileName, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	 
	@RequestMapping("/common/getTempImg")
	public ResponseEntity<byte[]> getTempImg(String fileName, HttpServletRequest req) throws IOException {
		ResponseEntity<byte[]> entity = null;
		
		// 저장경로
		String savePath = eventPicUploadPath + File.separator + "temp";
		File sendFile = new File(savePath, fileName);
		
		InputStream in = null;
		
		try {
			in = new FileInputStream(sendFile);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
		
	@RequestMapping("/common/deleteTempImg")
	public ResponseEntity<String> deleteTempImg(@RequestBody Map<String, String> data) {
		ResponseEntity<String> result = null;
		String savePath = eventPicUploadPath + File.separator + "temp";
		File target = new File(savePath, data.get("fileName"));
		
		if (!target.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		} else {
			try {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return result;
	}
	 
	
	@RequestMapping("common/login")
	public String loginFrom() {
		String url = "/common/login";

		return url;
	}
	
	@RequestMapping("/common/userIdFind")
	public String userIdFind() {
		String url = "/common/userIdFind";
		return url;
	}
	
	@RequestMapping("/common/userIdFindAjax")
	public ResponseEntity<String> idFindAjax(String mem_name, String mem_phone, String mem_bir){
		ResponseEntity<String> entity = null;
		
		Map<String, String> member = new HashMap<String, String>();
		member.put("mem_name", mem_name);
		member.put("mem_phone", mem_phone);
		member.put("mem_bir", mem_bir);
		
		String mem_id = null;
		try {
			mem_id = nonMemService.getFindMemId(member);
			if(mem_id == null || "".equals(mem_id)) {
				mem_id = "N";
			}
			entity = new ResponseEntity<String>(mem_id, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}
	@RequestMapping("/common/userPwdFindAjax")
	public ResponseEntity<String> userPwdFindAjax(MemberVO member){
		ResponseEntity<String> entity = null;
		
		String mem_cd = null;
		try {
			mem_cd = nonMemService.getFindMemCd(member);
			if(mem_cd == null || "".equals(mem_cd)) {
				mem_cd = "N";
			}
			entity = new ResponseEntity<String>(mem_cd, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/common/pwdChangePage")
	public ModelAndView pwdChangePage(String mem_id, ModelAndView mnv) {
		String url = "/common/pwdChange";
		
		mnv.addObject("mem_id", mem_id);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/changePwd")
	public void changePwd(String change_mem_id, String change_mem_pwd, HttpServletResponse res, HttpServletRequest req) throws Exception {
		
		MemberVO member = new MemberVO();
		member.setMem_id(change_mem_id);
		member.setMem_pwd(change_mem_pwd);
		
		nonMemService.updateMemPwd(member);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('비밀번호가 변경되었습니다.');");
		out.println("location.href='" + req.getContextPath() + "main.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/common/getFile")
	public ResponseEntity<byte[]> getFile(int ano) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		 
		QnaAttachVO attach = sysAdminService.selectQnaAttachByAno(ano);
		
		String fileUploadPath = this.attachUploadPath;
		String fileName = attach.getAttach_path();
		
		try {
			in = new FileInputStream(fileUploadPath + File.separator + fileName);
			fileName = fileName.substring(fileName.lastIndexOf("$$") + 2);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
}
