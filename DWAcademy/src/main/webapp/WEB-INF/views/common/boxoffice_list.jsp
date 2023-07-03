<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
        Node dailyBoxOffice = dailyBoxOfficeList.item(i);
        if (dailyBoxOffice.getNodeType() == Node.ELEMENT_NODE) {
            Element element = (Element) dailyBoxOffice;
            String rank = element.getElementsByTagName("rank").item(0).getTextContent();
            String rankInten = element.getElementsByTagName("rankInten").item(0).getTextContent();
            String movieCd = element.getElementsByTagName("movieCd").item(0).getTextContent();
            String title = element.getElementsByTagName("movieNm").item(0).getTextContent();
            String openDt = element.getElementsByTagName("openDt").item(0).getTextContent();
            String salesAmt = element.getElementsByTagName("salesAmt").item(0).getTextContent();
            String audiCnt = element.getElementsByTagName("audiCnt").item(0).getTextContent();
            String audiAcc = element.getElementsByTagName("audiAcc").item(0).getTextContent();

        // 영화 상세 정보 가져오기
        String movieInfoXmlUrl = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=f5eef3421c602c6cb7ea224104795888&movieCd=" + movieCd;
        URL movieInfoUrl = new URL(movieInfoXmlUrl);
        InputStream movieInfoInputStream = movieInfoUrl.openStream();

        // 영화 상세 정보 파싱
        Document movieInfoDoc = dBuilder.parse(movieInfoInputStream);
        movieInfoDoc.getDocumentElement().normalize();
        String watchGradeNm = movieInfoDoc.getElementsByTagName("audits").item(0).getTextContent();
        String showTm = movieInfoDoc.getElementsByTagName("showTm").item(0).getTextContent();


        String GradeName = ""; // GradeName 변수 선언
        
        if (watchGradeNm.equals("전체관람가")) {
            GradeName = "<i class=\"movieIcon etc ageAll\">All</i>";
        } else if (watchGradeNm.equals("12세이상관람가")) {
            GradeName = "<i class=\"movieIcon etc age12\">12</i>";
        } else if (watchGradeNm.equals("15세이상관람가")) {
            GradeName = "<i class=\"movieIcon etc age15\">15</i>";
        } else if (watchGradeNm.equals("청소년관람불가")) {
            GradeName = "<i class=\"movieIcon etc age18\">18</i>";
        }

        // 비율 계산
        int Cnt = Integer.parseInt(audiCnt);
        int Acc = Integer.parseInt(audiAcc);
        float audAll = (Cnt * Acc) / 100.0f;

        // 영화 포스터 정보 가져오기
        String targetUrl = "https://file.cineq.co.kr/i.aspx?movieid=" + movieCd + "&size=210"; // 추출할 사이트의 URL
        String targetText = "PNG"; // 확인할 특정 문자

        String posterImage = ""; // posterImage 변수 선언

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
                posterImage = "background: url('https://file.cineq.co.kr/i.aspx?movieid=" + movieCd + "&size=210') no-repeat center /cover";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
%>