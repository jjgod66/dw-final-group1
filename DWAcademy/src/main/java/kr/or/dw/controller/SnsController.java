package kr.or.dw.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
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
	private static String access_token;

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
			
			System.out.println(oauthToken);
			
			
			System.out.println("email : " + email);
			
			SnsVO sns = snsService.naverSelectByMemberCode(email);
			System.out.println(sns);
			Map<String, Object> memberChk = memberService.CheckMemberEmail(email);
			System.out.println(memberChk);
			MemberVO sns_email = new MemberVO();
			
			sns_email.setMem_email(email);
			System.out.println(sns_email);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			if(memberChk.get("EMAIL") == null) {
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
				Map<String, Object> member = memberService.selectMemberCode(sns);
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
			access_token = oauthToken.getAccessToken();
			String refresh_token = oauthToken.getRefreshToken();
			System.out.println(oauthToken);
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
			out.println("location.href='/member/PrivacyInfo';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//로그아웃
		@RequestMapping(value = "/naver/unConnect", method = { RequestMethod.GET, RequestMethod.POST })
		public String naverUnConnect(HttpSession session, HttpServletResponse res)throws IOException, SQLException {
				System.out.println("여기는 unLink");
				
				MemberVO member = (MemberVO) session.getAttribute("loginUser");
				SnsVO snsToken = snsService.selectNaverInfo(member);
				System.out.println(snsToken.getAccess_token());
				
				
				URL url = new URL("https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=xECJaEapJzaHHIpgDcjz&client_secret=ep7rTSf5so&service_provider=NAVER&access_token=" + snsToken.getAccess_token());
				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				System.out.println(url);
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
		        
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);

				System.out.println("getContentType():" + conn.getContentType()); // 응답 콘텐츠 유형 구하기
		        System.out.println("getResponseCode():"    + conn.getResponseCode()); // 응답 코드 구하기
		        System.out.println("getResponseMessage():" + conn.getResponseMessage());
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				
		        res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				
				out.println("<script>");
				out.println("alert('연동이 해제되었습니다.')");
				out.println("location.href='/member/PrivacyInfo';");
				out.println("</script>");
				out.close();
				
				MemberVO user = (MemberVO) session.getAttribute("loginUser");
				
				snsService.naverUnlink(user);
				
				
				return null;
			}
	
	@RequestMapping("/kakao/unConnect")
	public String kakaoUnConnect(HttpSession session, HttpServletResponse res) throws Exception {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		
	    try {
	    	MemberVO member = (MemberVO) session.getAttribute("loginUser");
	    	SnsVO kakao = snsService.selectKakaoInfo(member);
	    	
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + kakao.getAccess_token());
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();

		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		
		snsService.kakaounlink(user);
		
		out.println("<script>");
		out.println("alert('연동이 해제되었습니다.')");
		out.println("location.href='/member/PrivacyInfo';");
		out.println("</script>");
		out.close();
		
		return null;
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
			Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
			
			System.out.println("#########" + code);
			Map<String, String> tokenMap = new HashMap<>();
			tokenMap = ka.getAccessToken(code);
			String access_Token = tokenMap.get("access_Token");
			String refresh_Token = tokenMap.get("refresh_Token");
			HashMap<String, Object> userInfo = ka.getUserInfo(access_Token);
			
			System.out.println(tokenMap);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("sns_name"));
			System.out.println("###email#### : " + userInfo.get("sns_email"));
			
			userInfo.put("access_Token", access_Token);
			userInfo.put("refresh_Token", refresh_Token);
			userInfo.put("mem_cd", member.get("CD"));
			
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
			return null;
		}
		
		@RequestMapping("/common/kakaoLogin")
		public ResponseEntity<Map<String, Object>>kakaoLogin(String email, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws SQLException {
			ResponseEntity<Map<String, Object>> entity = null;
			
			SnsVO sns = snsService.kakaoSelectByMemberCode(email);
			Map<String, Object> memberChk = memberService.CheckMemberEmail(email);
			System.out.println("email : " + email);
			System.out.println("sns : " + sns);
			System.out.println("memberChk : " + memberChk.get("MEM_EMAIL"));
			Map<String, Object> sns_email = new HashMap<>();
			
			sns_email.put("SNS_EMAIL", email);
			
			System.out.println(sns_email);
			
			
			if(memberChk.get("EMAIL") == null) {
				sns_email.put("GB","non_member");
				System.out.println('1');
				try {
					entity = new ResponseEntity<Map<String, Object>>(sns_email, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}else if(sns == null) {
				sns_email.put("GB","noConnect");
				System.out.println('2');
				
				try {
					entity = new ResponseEntity<Map<String, Object>>(sns_email, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				
			}else if(memberChk != null && sns != null){
				System.out.println('3');
				sns_email.put("GB", "member");
				Map<String, Object> member = memberService.selectMemberCode(sns);
				System.out.println(member);
				
				session.setAttribute("loginUser", member);
				
				try {
					entity = new ResponseEntity<Map<String, Object>>(member, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
			return entity;
		}
	
}
