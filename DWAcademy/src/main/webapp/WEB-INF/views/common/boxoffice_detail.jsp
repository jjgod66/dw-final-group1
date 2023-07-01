<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%
    String movieCd = request.getParameter("movieCd");

    String YoutubeTrailer = "";

    if (movieCd.equals("20226411"))
        YoutubeTrailer = "UTPEPu2Je9g";

    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

    // 영화 상세 정보 가져오기
    String movieInfoXmlUrl = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=f5eef3421c602c6cb7ea224104795888&movieCd=" + movieCd;
    URL movieInfoUrl = new URL(movieInfoXmlUrl);
    InputStream movieInfoInputStream = movieInfoUrl.openStream();

    // 영화 상세 정보 파싱
    Document movieInfoDoc = dBuilder.parse(movieInfoInputStream);
    movieInfoDoc.getDocumentElement().normalize();

    // 영화 상세 정보 가져오기
    String movieNm = movieInfoDoc.getElementsByTagName("movieNm").item(0).getTextContent();
    String movieNmEn = movieInfoDoc.getElementsByTagName("movieNmEn").item(0).getTextContent();
    String openDt = movieInfoDoc.getElementsByTagName("openDt").item(0).getTextContent();
    String genreNm = movieInfoDoc.getElementsByTagName("genreNm").item(0).getTextContent();
    String nations = movieInfoDoc.getElementsByTagName("nations").item(0).getTextContent();
    String watchGradeNm = movieInfoDoc.getElementsByTagName("audits").item(0).getTextContent();
    String showTm = movieInfoDoc.getElementsByTagName("showTm").item(0).getTextContent();

    // 감독 정보 가져오기
    NodeList directorsList = movieInfoDoc.getElementsByTagName("director");
    String peopleNmdirectors = "";

    for (int i = 0; i < directorsList.getLength(); i++) {
        Node directorNode = directorsList.item(i);
        NodeList directorChildren = directorNode.getChildNodes();
        for (int j = 0; j < directorChildren.getLength(); j++) {
            Node childNode = directorChildren.item(j);
            if (childNode.getNodeName().equals("peopleNm")) {
                String peopleNm = childNode.getTextContent();
                peopleNmdirectors = peopleNm;
            }
        }
    }

    // 배우 정보 가져오기
    NodeList actorsList = movieInfoDoc.getElementsByTagName("actor");
    StringBuilder peopleNmActors = new StringBuilder();
    int limit = Math.min(actorsList.getLength(), 7); // 최대 7개까지 출력
    
    for (int i = 0; i < limit; i++) {
        Node actorNode = actorsList.item(i);
        NodeList actorChildren = actorNode.getChildNodes();
        for (int j = 0; j < actorChildren.getLength(); j++) {
            Node childNode = actorChildren.item(j);
            if (childNode.getNodeName().equals("peopleNm")) {
                String peopleNm = childNode.getTextContent();
                peopleNmActors.append(peopleNm).append(", ");
            }
        }
    }
    
    // 마지막 쉼표와 공백 제거
    if (peopleNmActors.length() > 0) {
        peopleNmActors.setLength(peopleNmActors.length() - 2);
    }

    // 영화 포스터 정보 가져오기
    String targetUrl = "https://file.cineq.co.kr/i.aspx?movieid=" + movieCd + "&size=210"; // 추출할 사이트의 URL
    String targetText = "PNG"; // 확인할 특정 문자

    String posterImage = ""; // posterImage 변수 선언
    String ImgposterImage = ""; // posterImage 변수 선언

    try {
        java.net.URL siteUrl = new java.net.URL(targetUrl);
        java.net.URLConnection connection = siteUrl.openConnection();

        java.io.BufferedReader reader = new java.io.BufferedReader(
                new java.io.InputStreamReader(connection.getInputStream(), "UTF-8"));

        String line;
        StringBuilder content = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            content.append(line);
        }

        reader.close();

        String websiteContent = content.toString();

        boolean containsSpecificText = websiteContent.contains(targetText);

        if (!containsSpecificText) {
            posterImage = "https://file.cineq.co.kr/i.aspx?movieid=" + movieCd;
            ImgposterImage = "<img src=\"https://file.cineq.co.kr/i.aspx?movieid=" + movieCd + "&size=210\">";
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>