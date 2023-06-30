<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.add(java.util.Calendar.DATE, -1); // 어제로 설정
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd");
    String formattedDate = sdf.format(cal.getTime());

    // 영화 순위 정보 XML 가져오기
    String xmlUrl = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + formattedDate;
    URL url = new URL(xmlUrl);
    InputStream is = url.openStream();

    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
    Document doc = dBuilder.parse(is);
    doc.getDocumentElement().normalize();

    NodeList dailyBoxOfficeList = doc.getElementsByTagName("dailyBoxOffice");
%>