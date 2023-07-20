package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.dw.service.KakaoService;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.SnsService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Controller
public class SnsController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private SnsService snsService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KakaoService ka;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
		@RequestMapping(value = "/naver_id_login", method = { RequestMethod.GET, RequestMethod.POST })
		public String login(Model model, HttpSession session) {
			
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			
			//네이버 
			model.addAttribute("url", naverAuthUrl);
	 
			return "main";
		}
	 
		//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
			
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	 
	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
			
			/** apiResult json 구조
			{"resultcode":"00",
			 "message":"success",
			 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String nickname = (String)response_obj.get("nickname");
	 
			System.out.println(nickname);
			
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId",nickname); //세션 생성
			
			model.addAttribute("result", apiResult);
		     
			return "main";
		}
		
		//로그아웃
		@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
		public String logout(HttpSession session)throws IOException {
				System.out.println("여기는 logout");
				session.invalidate();
	 
		        
				return "redirect:index.jsp";
			}
	
	@RequestMapping("/sns/unlink")
	public String unlink(HttpSession session) throws SQLException {
		String url = "/member/PrivacyInfo";
		
		
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		
		snsService.unlink(user);
		
		return url;
	}
	
	// 카카오 소셜로그인
		@RequestMapping(value="/kakaoCode", method=RequestMethod.GET)
		public String kakaoCode(@RequestParam(value = "code", required = false) String code) throws Exception {
			
			
			System.out.println("#########" + code);
			
			Map<String, String> access_Token = ka.getAccessToken(code);
			System.out.println("###access_Token#### : " + access_Token);
			return "/member/PrivacyInfo";
			/*
			 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
			 * 없는 페이지를 넣어도 무방합니다.
			 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
			 */
	    	}
		
		@RequestMapping(value="/kakao/callback", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView callback(ModelAndView mnv, @RequestParam String code, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
			String url = "/member/PrivacyInfo";
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			SnsVO sns = snsService.selectSnsInfo(member);

			System.out.println(member.getMem_cd());
			
			System.out.println("#########" + code);
			Map<String, String> tokenMap = new HashMap<>();
			tokenMap = ka.getAccessToken(code);
			String access_Token = tokenMap.get("access_Token");
			String refresh_Token = tokenMap.get("refresh_Token");
			HashMap<String, Object> userInfo = ka.getUserInfo(access_Token);
			
			
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("sns_name"));
			System.out.println("###email#### : " + userInfo.get("sns_email"));
			
			if(sns != null) {
				userInfo.put("sns_cd", sns.getMem_cd());
			}
			userInfo.put("access_Token", access_Token);
			userInfo.put("refresh_Token", refresh_Token);
			userInfo.put("mem_cd", member.getMem_cd());
			if(sns != null) {
				userInfo.put("linkDate", sns.getLinkdate());
			}
			
			System.out.println(userInfo);
			
			snsService.insertSocal(userInfo);
			
//			req.setAttribute("userInfo", userInfo);

			mnv.addObject("userInfo", userInfo);
			mnv.setViewName(url);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			out.println("<script>");
			out.println("alert('연동되었습니다.')");
			out.println("location.href='/member/PrivacyInfo';");
			out.println("</script>");
			out.close();
			return mnv;
		}
		
		@RequestMapping("/common/kakaoLogin")
		public ResponseEntity<MemberVO>kakaoLogin(String email, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws SQLException {
			ResponseEntity<MemberVO> entity = null;
			
			SnsVO sns = snsService.selectByMemberCode(email);
			MemberVO memberChk = memberService.CheckMemberEmail(email);
			System.out.println("email : " + email);
			System.out.println("sns : " + sns);
			System.out.println("memberChk : " + memberChk.getMem_email());
			MemberVO sns_email = new MemberVO();
			
			sns_email.setMem_email(email);
			
			System.out.println(sns_email);
			
			
			if(memberChk.getMem_email() == null) {
				sns_email.setGb("non_member");
				System.out.println('1');
				try {
					entity = new ResponseEntity<MemberVO>(sns_email, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}else if(sns == null) {
				sns_email.setGb("noConnect");
				System.out.println('2');
				
				try {
					entity = new ResponseEntity<MemberVO>(sns_email, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				
			}else if(memberChk != null && sns != null){
				System.out.println('3');
				sns_email.setGb("member");
				MemberVO member = memberService.selectMemberCode(sns);
				System.out.println(member);
				
				session.setAttribute("loginUser", member);
				
				try {
					entity = new ResponseEntity<MemberVO>(member, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
			return entity;
		}
	
}
