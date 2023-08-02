<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<style>
#contents {
    width: 100%;
    margin: 0;
    padding: 60px 0 0 0;
}
.inner-wrap {
    width: 900px;
    margin: 0 auto;
}
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
.board-view {
    word-break: break-all;
}
.board-view .tit-area {
    display: table;
    width: 100%;
    padding: 15px 0;
}
.board-view .tit-area .tit {
    display: table-cell;
    margin: 0;
    padding: 0;
    font-size: 1.1429em;
    color: #444;
    font-weight: 400;
}
.board-view .info {
    padding-bottom: 20px;
    font-size: .9333em;
}
.board-view .info p:first-child {
    margin-left: 0;
    padding-left: 0;
}

.board-view .info p {
    position: relative;
    display: inline-block;
    vertical-align: top;
    margin: 0 0 0 8px;
    padding: 0 0 0 11px;
}
.board-view .info p span, .board-view .info p strong {
    display: inline-block;
    vertical-align: top;
    color: #666;
}
.board-view .cont {
    overflow: hidden;
    width: 100%;
    padding: 20px 0;
    border-top: 1px solid #eaeaea;
}


.pt40 {
    padding-top: 40px!important;
}

.btn-group .button {
    margin: 0 3px;
}

.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
a.button {
    text-decoration: none;
}
a:link {
    color: #444;
    text-decoration: none;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #4aa8d8;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #4aa8d8;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}

.btn-group {
    padding: 20px 0 30px 0;
    margin: 0;
    text-align: center;
}
.btn-group:after {
    clear: both;
}

.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}
.btn-group, .btn-group-vertical {
    position: relative;
    display: inline-flex;
    vertical-align: middle;
}
</style>



<div class="sub_visual">
    <h3>당첨자 발표 </h3>
    <h6>Winner</h6>
</div>
<div id="contents" class="">

	<!-- inner-wrap -->
	<div class="inner-wrap">

		<h2 class="tit">당첨자발표</h2>

		<div class="table-wrap">
			<div class="board-view">
				<div class="tit-area">
					<p class="tit">${event.event_title }</p>
				</div>

				<div class="info">
					<p>
						<span class="txt">
							<fmt:formatDate value="${event.startdate}" pattern="yyyy-MM-dd"/> ~ 
							<fmt:formatDate value="${event.enddate}" pattern="yyyy-MM-dd"/>
						</span>
					</p>
				</div>


				<div class="cont">
					${event.winner_content }
<!-- 					<strong>안녕하세요.&nbsp;</strong><strong>메가박스입니다.</strong><br> <br> -->
<!-- 					<strong>&lt;극장판 피노키오 위대한 모험(더빙)&gt; 회원시사 이벤트에 참여해 주신 여러분께 -->
<!-- 						진심으로 감사 드립니다.</strong><br> <strong>아래 명단을 확인하신 후,&nbsp;당첨된 -->
<!-- 						고객님께서는 당일 본인 확인 후 티켓을 수령해주시기 바랍니다.</strong><br> <br> <strong>*&nbsp;상영일시: -->
<!-- 						2023년 7월 8일(토) 14시00분<br> *&nbsp;수령장소<em>: 고양스타필드, -->
<!-- 							하남스타필드, 안성스타필드</em> -->
<!-- 					</strong><br> <strong>*&nbsp;</strong><strong>수령방법:&nbsp;시사회 -->
<!-- 						당일 현장 티켓 배부처에서 신분 확인 후 티켓 수령(1인&nbsp;2매,&nbsp;신분증 지참 필수)</strong><br> -->
<!-- 					<strong>-&nbsp;개인정보(신분증)로 본인 확인 후 배부 진행하며, 티켓 수령인과 당첨자 정보가 -->
<!-- 						불일치할 경우엔 티켓 수령이 불가합니다.</strong><br> <br> <strong>*&nbsp;시사회 -->
<!-- 						당일 13시부터 당첨 지점에서 티켓 수령이 가능합니다.<br> *&nbsp;응모하신 극장에서만 관람이 -->
<!-- 						가능하오니 장소 확인을 부탁드립니다. (당첨 극장 변경 불가) -->
<!-- 					</strong><br> <strong>*&nbsp;</strong><strong>당첨된 티켓은 양도 -->
<!-- 						불가능하며,&nbsp;개인정보(신분증)로 본인 확인 후 배부합니다.</strong><br> <strong>*&nbsp;좌석 -->
<!-- 						선택은 불가한 점 양해 부탁드립니다.<br> *&nbsp;선착순 배포로 시사회 티켓이 소진되어 수령하지 못하는 -->
<!-- 						경우에 한해, 당첨자 기준 1인 2매의 해당 영화 전용 관람권이 지급됩니다. -->
<!-- 					</strong><br> &nbsp; -->
<!-- 					<table cellspacing="0" -->
<!-- 						style="border-collapse: collapse; width: 417px"> -->
<!-- 						<colgroup> -->
<!-- 							<col style="width: 74pt" width="99"> -->
<!-- 							<col style="width: 99pt" width="132"> -->
<!-- 							<col style="width: 140pt" width="186"> -->
<!-- 						</colgroup> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<td class="xl67" -->
<!-- 									style="background-color: #f8cbad; border-bottom: 1px solid black; border-left: 1px solid black; border-right: 1px solid black; border-top: 1px solid black; height: 18px; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap; width: 99px"><span -->
<!-- 									style="font-size: 13px"><strong style="font-weight: 700"><span -->
<!-- 											style="color: black"><span style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>ID</span></span></span></span></strong></span></td> -->
<!-- 								<td class="xl67" -->
<!-- 									style="background-color: #f8cbad; border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: 1px solid black; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap; width: 132px"><span -->
<!-- 									style="font-size: 13px"><strong style="font-weight: 700"><span -->
<!-- 											style="color: black"><span style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>이름</span></span></span></span></strong></span></td> -->
<!-- 								<td class="xl67" -->
<!-- 									style="background-color: #f8cbad; border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: 1px solid black; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap; width: 186px"><span -->
<!-- 									style="font-size: 13px"><strong style="font-weight: 700"><span -->
<!-- 											style="color: black"><span style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>당첨극장</span></span></span></span></strong></span></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td class="xl65" -->
<!-- 									style="border-bottom: 1px solid black; border-left: 1px solid black; border-right: 1px solid black; border-top: none; height: 18px; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>ka**ji53</span></span></span></span></span></span></td> -->
<!-- 								<td class="xl65" -->
<!-- 									style="border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: none; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>강*서</span></span></span></span></span></span></td> -->
<!-- 								<td class="xl66" -->
<!-- 									style="border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: none; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: bottom; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>고양스타필드</span></span></span></span></span></span></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td class="xl65" -->
<!-- 									style="border-bottom: 1px solid black; border-left: 1px solid black; border-right: 1px solid black; border-top: none; height: 18px; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>li**24</span></span></span></span></span></span></td> -->
<!-- 								<td class="xl65" -->
<!-- 									style="border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: none; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: middle; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>강*진</span></span></span></span></span></span></td> -->
<!-- 								<td class="xl66" -->
<!-- 									style="border-bottom: 1px solid black; border-left: none; border-right: 1px solid black; border-top: none; padding-left: 1px; padding-right: 1px; padding-top: 1px; text-align: center; vertical-align: bottom; white-space: nowrap"><span -->
<!-- 									style="font-size: 13px"><span style="color: black"><span -->
<!-- 											style="font-weight: 400"><span -->
<!-- 												style="font-style: normal"><span -->
<!-- 													style="text-decoration: none"><span>고양스타필드</span></span></span></span></span></span></td> -->
<!-- 							</tr> -->
							
<!-- 						</tbody> -->
<!-- 					</table> -->

				</div>
			</div>
		</div>

		<div class="btn-group  pt40">
			<a href="<%=request.getContextPath() %>/event/eventPast.do" onclick="hisBack()" class="button large winnerlist"
				title="목록 페이지로 이동">목록</a>
		</div>


	</div>
	<!--// inner-wrap -->
</div>

<%@ include file="../include/footer.jsp"%>