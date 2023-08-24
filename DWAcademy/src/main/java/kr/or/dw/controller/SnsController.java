package kr.or.dw.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.dw.service.KakaoConnectService;
import kr.or.dw.service.KakaoLoginService;
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
	private KakaoConnectService kca;

	@Autowired
	private KakaoLoginService kla;
	
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
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException, ParseException, Exception {
			
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
				out.println("location.href='" + req.getContextPath() + "';");
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
		public String naverConnect(@RequestParam String code, @RequestParam String state, HttpServletRequest req, HttpSession session, HttpServletResponse res) throws ParseException, Exception {
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO2.getAccessToken(session, code, state);
	        Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
			String mem_cd = (String) member.get("CD");
			
			
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
			HashMap<String, Object> naverUserInfo = new HashMap<>();
			
			naverUserInfo.put("mem_cd", mem_cd);
			naverUserInfo.put("access_token", access_token);
			naverUserInfo.put("refresh_token", refresh_token);
			naverUserInfo.put("sns_email", sns_email);
			
			
			SnsVO snsCheck = snsService.naverEmailCheck(sns_email);
			
			if(snsCheck == null) {
				snsService.naverInsert(naverUserInfo);
			}else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				
				out.println("<script>");
				out.println("alert('이미 연동된 계정이 존재합니다!')");
				out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
				out.println("</script>");
				out.close();
			}
			
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			out.println("<script>");
			out.println("alert('연동되었습니다.')");
			out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//로그아웃
		@RequestMapping(value = "/naver/unConnect", method = { RequestMethod.GET, RequestMethod.POST })
		public String naverUnConnect(HttpSession session, HttpServletResponse res, HttpServletRequest req)throws IOException, SQLException {
				System.out.println("여기는 unLink");
				
				Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
				String mem_cd = (String) member.get("CD");
				Map<String, Object> snsToken = snsService.selectNaverInfo(mem_cd);
				System.out.println(snsToken);
				
				
				URL url = new URL("https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=xECJaEapJzaHHIpgDcjz&client_secret=ep7rTSf5so&service_provider=NAVER&access_token=" + snsToken.get("ACCESS_TOKEN"));
				
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
				
				Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
				System.out.println("user: " + user);
				System.out.println("emao:" + mem_cd);
				
				snsService.naverUnlink(mem_cd);

				out.println("<script>");
				out.println("alert('연동이 해제되었습니다.')");
				out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
				out.println("</script>");
				out.close();
				
				
				
				return null;
			}
	
	@RequestMapping("/kakao/unConnect")
	public String kakaoUnConnect(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws Exception {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		Map<String, Object> kakao = snsService.selectKakaoInfo(mem_cd);

		String accessToken = (String) kakao.get("ACCESS_TOKEN");
		
	    try {
	    	System.out.println("1"+kakao);
	    	System.out.println("accessToken"+ accessToken);
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
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

		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		snsService.kakaounlink(mem_cd);
		
		out.println("<script>");
		out.println("alert('연동이 해제되었습니다.')");
		out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
		out.println("</script>");
		out.close();
		
		return null;
	}
	
	// 카카오 소셜로그인
		
		@RequestMapping(value="/kakao/callback", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView callback(ModelAndView mnv, @RequestParam String code, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
			String url = "/member/PrivacyInfo";
			Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
			
			Map<String, String> tokenMap = new HashMap<>();
			tokenMap = kca.getAccessToken(code);
			String access_Token = tokenMap.get("access_Token");
			String refresh_Token = tokenMap.get("refresh_Token");
			HashMap<String, Object> userInfo = kca.getUserInfo(access_Token);
			
			userInfo.put("access_Token", access_Token);
			userInfo.put("refresh_Token", refresh_Token);
			userInfo.put("mem_cd", member.get("CD"));
			
			String mem_email = (String) userInfo.get("sns_email");
			
			SnsVO snsCheck = snsService.kakaoEmailCheck(mem_email);
			
			if(snsCheck == null) {
				snsService.kakaoInsert(userInfo);
			}else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				
				out.println("<script>");
				out.println("alert('이미 연동된 계정이 존재합니다!')");
				out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
				out.println("</script>");
				out.close();
			}
			
			
//			req.setAttribute("userInfo", userInfo);

			mnv.addObject("userInfo", userInfo);
			mnv.setViewName(url);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			out.println("<script>");
			out.println("alert('연동되었습니다.')");
			out.println("location.href='" + req.getContextPath() + "/member/PrivacyInfo';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		@RequestMapping("/common/kakaoLogin")
		public ModelAndView kakaoLogin(ModelAndView mnv, @RequestParam String code, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws SQLException, IOException {

			Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
			
			System.out.println("#" + code);
			
			Map<String, String> tokenMap = new HashMap<>();
			tokenMap = kla.getAccessToken(code);
			String access_Token = tokenMap.get("access_Token");
			String refresh_Token = tokenMap.get("refresh_Token");
			HashMap<String, Object> userInfo = kla.getUserInfo(access_Token);
			
			userInfo.put("access_Token", access_Token);
			userInfo.put("refresh_Token", refresh_Token);
			
			String email = (String) userInfo.get("sns_email");
			
			SnsVO sns = snsService.kakaoSelectByMemberCode(email);
			Map<String, Object> memberChk = memberService.CheckMemberEmail(email);
			Map<String, Object> sns_email = new HashMap<>();
			
			sns_email.put("SNS_EMAIL", email);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			
			if(memberChk == null) {
				sns_email.put("GB","non_member");
				String url = "redirect:/main.do?sns_email=" + sns_email.get("GB") + "&mem_email=" + email + "";
				mnv.setViewName(url);
				
				return mnv;
			}else if(sns == null) {
				sns_email.put("GB","noConnect");
				
				 String clientId = "bf62309a02d7160678300f689ce8d447";
			        String tokenToRevoke = access_Token; // 해당 토큰을 삭제하려는 토큰 값

			        try {
			            URL url = new URL("https://kapi.kakao.com/v1/user/unlink");
			            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			            connection.setRequestMethod("POST");
			            connection.setRequestProperty("Authorization", "Bearer " + tokenToRevoke);
			            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			            connection.setDoOutput(true);

			            String parameters = "client_id=" + clientId;

			            try (OutputStream os = connection.getOutputStream()) {
			                byte[] input = parameters.getBytes("utf-8");
			                os.write(input, 0, input.length);
			            }

			            int responseCode = connection.getResponseCode();
			            
			            if (responseCode == HttpURLConnection.HTTP_OK) {
			                // 권한 해제 성공
			                System.out.println("Consent revoked successfully.");
			            } else {
			                // 권한 해제 실패
			                System.out.println("Consent revocation failed. Response Code: " + responseCode);
			            }
			        } catch (IOException e) {
			            e.printStackTrace();
			        }
		        session.invalidate();
		        
				out.println("<script>");
				out.println("alert('연동된 계정이 없습니다! 소셜로그인은 [마이페이지 > 개인정보수정] 에서 연동 후 사용해주세요.')");
				out.println("location.replace('" + req.getContextPath() + "/main.do')");
				out.println("</script>");
				out.close();
				
			}else if(memberChk != null && sns != null){
				sns_email.put("GB", "member");
				Map<String, Object> mem_cd = memberService.selectMemberCode(sns);
				
				session.setAttribute("loginUser", mem_cd);
				
				out.println("<script>");
				out.println("location.href='" + req.getContextPath() + "/main';");
				out.println("</script>");
				out.close();
			}
			
			return null;
		}
}
