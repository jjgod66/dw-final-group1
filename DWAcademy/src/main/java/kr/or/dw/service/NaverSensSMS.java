package kr.or.dw.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
 
/** 
        API key:
         
        Access Key:
         
 
        Secret Key:
         
 
        {
          "type": "SMS",
          "countryCode": "82",
          "from": "070",
          "subject": "sms-test2",
          "contentType": "COMM",
          "content": "SENS",
          "messages": [
            {
              "subject": "test",
              "content": "test",
              "to": "01011"
            }
          ]
           
        }
     
*/
     
@Component
public class NaverSensSMS {
     
    private static Logger logger = LoggerFactory.getLogger(NaverSensSMS.class); 
     
    private static final String FROM = "";    
    private static final String accessKey = "WqdXxvMzagCv0IRNrpzG";                                     // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
    private static final  String secretKey = "mRXTjs3NsH0oBSUaArQi1jfB0Di2b5UwT1abGjUp";                // 2차 인증을 위해 서비스마다 할당되는 service secret
    private static final  String serviceId = "ncp:sms:kr:311528781043:dwacademy";                        // 프로젝트에 할당된 SMS 서비스 ID 
     
    @SuppressWarnings("unchecked")
    public void sendMessage(List<String> phoneList, String phone , String contentMessge ) {
         
        logger.debug("SMS 전송 시작");
        logger.debug("contentMessge :" +contentMessge);
        for(String phon : phoneList) {
            logger.debug("phoneList :" +phon);  
        }
         
         
         
        String hostNameUrl = "https://sens.apigw.ntruss.com";           // 호스트 URL
        String requestUrl= "/sms/v2/services/";                         // 요청 URL
        String requestUrlType = "/messages";                            // 요청 URL
                                             
        String method = "POST";                                         // 요청 method
        String timestamp = Long.toString(System.currentTimeMillis());   // current timestamp (epoch)
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;
         
         
        // JSON 을 활용한 body data 생성      
        JSONObject bodyJson = new JSONObject();     
        JSONArray  toArr = new JSONArray();
    
        bodyJson.put("type", "SMS");                // 메시지 Type (sms | lms)
        bodyJson.put("contentType","COMM");         // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
        bodyJson.put("countryCode","82");       // 국가 전화번호
        bodyJson.put("from",FROM);              // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.        
        bodyJson.put("subject","dwAcademy");             // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
        bodyJson.put("content",contentMessge);              // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
        bodyJson.put("messages", toArr);        
                
         
        if(phone==null) {
            for(int i=0; i<phoneList.size(); i++) {    
                JSONObject toJson = new JSONObject();
                toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
                toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
                toJson.put("to",phoneList.get(i).toString());       // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
                toArr.add(toJson);              
                //System.out.print(phoneList.get(i).toString() + " , ");
            }
             
        }else{
            //개별 전송
            JSONObject toJson = new JSONObject();
            toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
            toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
            toJson.put("to", phone);        // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
            toArr.add(toJson);
        }
         
        String body = bodyJson.toJSONString();
        logger.debug(body);
         
        try {
 
            URL url = new URL(apiUrl);
 
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
             
            wr.write(body.getBytes());
            wr.flush();
            wr.close();
 
            int responseCode = con.getResponseCode();
            BufferedReader br;
            logger.debug("responseCode" +" " + responseCode);
             
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
 
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
             
            logger.debug("전송 성공");
            logger.debug(response.toString());
 
        } catch (Exception e) {
            e.printStackTrace();
        }
         
         
    }
     
     
    public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
        String space = " ";                    // one space
        String newLine = "\n";                 // new line
        String message = new StringBuilder()
            .append(method)
            .append(space)
            .append(url)
            .append(newLine)
            .append(timestamp)
            .append(newLine)
            .append(accessKey)
            .toString();
 
        SecretKeySpec signingKey;
        String encodeBase64String;
        try {
             
            signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
        } catch (UnsupportedEncodingException e) {
            encodeBase64String = e.toString();
        }
         
      return encodeBase64String;
    }
     
     
     
    /* 테스트 할경우  */
    private static void main(String[] args) {
        NaverSensSMS naverSensSMS=new NaverSensSMS();
        List<String> phoneList=new ArrayList<String>();
         
        String contentMessge="안녕하세요.담당자님!\r\n" +        
        "감사합니다.";
             
         
 
        for(int i=0;i< 1; i++) {
            //phoneList.add("00000"+i);
            phoneList.add("01011");
        }
         
        //** 문자 전송
        int phoneSize=phoneList.size();
        int n=phoneSize/1000;
        int start=0;
        logger.debug("phoneList 사이즈  : " +phoneList.size());
        logger.debug("n :" +n);
         
        if(phoneSize<=1000) {        
             //1. 1000 건 이하
            logger.debug("\n\n\n\n\n 1. 1000 건 이하" );
            naverSensSMS.sendMessage(phoneList,null,contentMessge);         
        }else{
             
            for(int i=1; i<=n; i++) {
                logger.debug("\n\ni : "+i);             
                logger.debug("시작 :" +start);
                 
                List<String> phoneListSub=new ArrayList<String>();
                for(int j=start; j<i*1000; j++) {
                    phoneListSub.add(phoneList.get(j));
                }
                                 
                naverSensSMS.sendMessage(phoneListSub,null,contentMessge);              
                start+=1000;
            }           
 
            if(phoneSize!=(n*1000)) {               
                //2000, 3000, 4000, 5000, ..... 으로 떨어지는  번호가 아닐 경우 나머지 폰번호
                logger.debug("\n\n\n********* ");
                logger.debug("나머지 폰");
                List<String> phoneListSub2=new ArrayList<String>();
                for(int i=n*1000; i<phoneSize; i++) {                    
                    phoneListSub2.add(phoneList.get(i));
                }
                 
                naverSensSMS.sendMessage(phoneListSub2,null,contentMessge);                 
            }               
        }       
         
    }
     
     
}