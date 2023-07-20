package kr.or.dw.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {

		public Map<String, String> getAccessToken (String authorize_code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id=bf62309a02d7160678300f689ce8d447&redirect_uri=http://localhost/kakao/callback&code=" + authorize_code;
			Map<String, String> token = new HashMap<String, String>();
	
		try {
			URL url = new URL(reqURL);
	        
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	        
			// Buffer는 대용량의 String을 사용할 때 용이함. 짧으면 오히려 느림.
//			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//			StringBuilder sb = new StringBuilder();
//			sb.append("grant_type=authorization_code");
//	        
//			sb.append("&client_id=bf62309a02d7160678300f689ce8d447"); //본인이 발급받은 key
//			sb.append("&redirect_uri=http://localhost/kakao/callback"); // 본인이 설정한 주소
//	        
//			sb.append("&code=" + authorize_code);
//			bw.write(sb.toString());
//			bw.flush(); 
	        
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
	        System.out.println(conn.getInputStream().toString());
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	        
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
	        
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
	        
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	        
			
			token.put("access_Token", access_Token);
			token.put("refresh_Token", refresh_Token);
			
			
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
	        
//			br.close();
//			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return token;
	}
	
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("sns_name", nickname);
			userInfo.put("sns_email", email);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	
}
