<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<style>
 #contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
.event-detail {
    position: relative;
    margin: 0 0 40px 0;
    padding: 0 0 30px 0;
}
.event-detail h2.tit {
    width: 900px;
    margin: 0 auto;
    padding: 0;
}
.event-detail .event-detail-date span {
    display: block;
    float: left;
}
.event-detail .event-detail-date em {
    display: block;
    float: left;
}
.event-detail .event-detail-date {
    overflow: hidden;
    width: 900px;
    margin: 0 auto 30px auto;
    padding: 15px 0 25px 0;
    line-height: 1.1;
    border-bottom: 1px solid #555;
}
 .event-detail .event-html img {
    display: block;
    max-width: 100%;
    margin: 0 auto;
} 
img {
    overflow-clip-margin: content-box;
    overflow: clip;
}
element.style {
    height: 6800px;
    width: 900px;
}

/* .container1 {
    width: 100%;
    min-width: 1100px;
    min-height: 100%;
    margin: -57px 0 -200px 0;
    padding: 116px 0 300px 0;
} */

.btnList{
    min-width: 100px;
    height: 36px;
    line-height: 34px;
    margin: 0 6px 0 0;
    padding: 0 10px;
    font-size: .9333em;
    color: black;
    text-decoration: none;
    text-align: center;
    border: 1px solid gray;
    border-radius: 4px;
    background-color: #fff;
}
</style>

<div class="container1">
<div id="contents" class="">
	<div class="event-detail">
		<h2 class="tit">${event.event_title }</h2>
		<p class="event-detail-date">
			<span></span> <em><fmt:formatDate value="${event.startdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate}" pattern="yyyy-MM-dd"/></em>
		</p>
		<div class="event-html row">
			<table border="0" cellpadding="0" cellspacing="0"
				style="margin:0 auto;" class="col-8">
				<tbody>
					<tr>
						<td>
							<img alt="" border="0" 
							src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_pic_path}&item_cd=${event.event_no}&type=eventImg"
							style="justify-content: center; width: 1100px" usemap="#Map">
						</td>
					</tr>
				</tbody>
			</table>
<!-- 			<map name="Map"> -->
<!-- 				<area alt="1" coords="87,3472,298,3530" -->
<!-- 					href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23048200" -->
<!-- 					shape="rect" target="_blank"> -->
<!-- 				<area alt="2" coords="87,4319,298,4378" -->
<!-- 					href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23048300" -->
<!-- 					shape="rect" target="_blank"> -->
<!-- 				<area alt="3" coords="87,5211,298,5271" -->
<!-- 					href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23048400" -->
<!-- 					shape="rect" target="_blank"> -->
<!-- 				<area alt="4" coords="87,6100,298,6160" -->
<!-- 					href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23048500" -->
<!-- 					shape="rect" target="_blank"> -->
<!-- 			</map> -->
		</div>
	</div>
	<div style="width: 100%; text-align: center; margin-bottom: 30px;">
		<button class="btnList">목록</button>
	</div>
</div>
</div>




<script>
let div = '${event.event_div}';
let eventListDiv = '';
if(div == '영화'){
	eventListDiv = 'movie';
}else if(div == '극장'){
	eventListDiv = 'theater';
}else{
	eventListDiv = 'stage';
}
$(function(){
	$('.btnList').on('click', function(){
		if('${p}' == 'Y'){
			location.href="<%=request.getContextPath()%>/event/eventPast.do";
		}else{
			location.href="<%=request.getContextPath()%>/event/" + eventListDiv + ".do";
			
		}
	})
})

</script>
<%@ include file="../include/footer.jsp"%>