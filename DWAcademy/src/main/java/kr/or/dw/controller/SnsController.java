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
import kr.or.dw.service.NaverLoginBO2;
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
	/* NaverLoginBO */
	private NaverLoginBO2 naverLoginBO2;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO2 naverLoginBO2) {
		this.naverLoginBO2 = naverLoginBO2;
	}
	
		//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse res) throws IOException, ParseException, Exception {
			
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
			String email = (String)response_obj.get("email");
			System.out.println("email : " + email);
			
			SnsVO sns = snsService.naverSelectByMemberCode(email);
			System.out.println(sns);
			MemberVO memberChk = memberService.CheckMemberEmail(email);
			System.out.println(memberChk);
			MemberVO sns_email = new MemberVO();
			
			sns_email.setMem_email(email);
			System.out.println(sns_email);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			if(memberChk.getMem_email() == null) {
				sns_email.setGb("non_member");
				System.out.println('1');
				
				out.println("<script>");
				out.println("$('#authentication-modal').modal('show');");
				out.println("$('input[name=mem_email]').val(" + sns_email.getMem_email() + ");");
				out.println("</script>");
				out.close();
				
			}else if(sns == null) {
				sns_email.setGb("noConnect");
				System.out.println('2');
				
				out.println("<script>");
				out.println("alert('연동된 계정이 없습니다! 소셜로그인은 [마이페이지 > 개인정보수정] 에서 연동 후 사용해주세요.')");
				out.println("location.href='/';");
				out.println("</script>");
				out.close();
				
			}else if(memberChk != null && sns != null){
				System.out.println('3');
				sns_email.setGb("member");
				MemberVO member = memberService.selectMemberCode(sns);
				System.out.println(member);
				
				session.setAttribute("loginUser", member);

				return "redirect:main.do";
			}
			
			
			//4.파싱 닉네임 세션으로 저장
//			session.setAttribute("sessionId",nickname); //세션 생성
			
//			model.addAttribute("result", apiResult);
		    return null;
		}
		
		@RequestMapping(value = "/naver/connect", method = {RequestMethod.GET, RequestMethod.POST})
		public String naverConnect(@RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse res) throws ParseException, Exception {
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO2.getAccessToken(session, code, state);
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			String mem_cd = member.getMem_cd();
			
			
	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO2.getUserProfile(oauthToken);  //String형식의 json데이터
			
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
			String sns_email = (String)response_obj.get("email");
			String access_token = oauthToken.getAccessToken();
			String refresh_token = oauthToken.getRefreshToken();
			System.out.println("email : " + sns_email);
			System.out.println("response_obj : " + response_obj);
			System.out.println("refresh : " + refresh_token);
			System.out.println("aceess : " + access_token);
			HashMap<String, Object> naverUserInfo = new HashMap<>();
			
			naverUserInfo.put("mem_cd", mem_cd);
			naverUserInfo.put("access_token", access_token);
			naverUserInfo.put("refresh_token", refresh_token);
			naverUserInfo.put("sns_email", sns_email);
			
			
			snsService.naverInsert(naverUserInfo);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			out.println("<script>");
			out.println("alert('연동되었습니다.')");
			out.println("</script>");
			out.close();
			return "redirect:/member/PrivacyInfo.do";
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
			
			userInfo.put("access_Token", access_Token);
			userInfo.put("refresh_Token", refresh_Token);
			userInfo.put("mem_cd", member.getMem_cd());
			
			System.out.println(userInfo);
			
			snsService.kakaoInsert(userInfo);
			
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
			
			SnsVO sns = snsService.kakaoSelectByMemberCode(email);
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
