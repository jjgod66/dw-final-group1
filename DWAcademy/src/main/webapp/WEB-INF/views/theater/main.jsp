<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/theater_main.css">
<div class="sub_visual">
    <h3>전체극장</h3>
    <h6>whole theater</h6>
</div>
<div class="theater-wrapper">
	<div class="container">
		<div class="tit-util">
			<h3 class="tit">전체 극장</h3>
		</div>
		<div class="tab-list fixed">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a href="<%=request.getContextPath()%>/theater/seoul.do">서울</a></li>
				<li class="nav-item"><a href="<%=request.getContextPath()%>/theater/deajeon.do">대전</a></li>
			</ul>
		</div>
		<div class="tit-util">
			<h3 class="tit">극장 이벤트</h3>
			<div class="float-end">
				<a href="/event/theater.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="event-box">
			<ul>
				<li>
					<a href="#" class="eventBtn" data-no="13527" data-netfunnel="N" title="[금정AK플라자] 오픈 1주년 기념 이벤트 상세보기">
						<img src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/g6ES1X2JGijlo9NgmzGMzBWtKDw8rhFX.jpg" alt="[금정AK플라자] 오픈 1주년 기념 이벤트" onerror="noImg(this)">
					</a>
				</li>
				<li>
					<a href="#" class="eventBtn" data-no="13631" data-netfunnel="N" title="[구미강동] 영화보면 팝콘R, 탄산R 증정 상세보기">
						<img src="https://img.megabox.co.kr/SharedImg/event/2023/07/06/VZIGZ1xuKgZoGCamTm7kymDM5ZMjnevK.jpg" alt="[구미강동] 영화보면 팝콘R, 탄산R 증정" onerror="noImg(this)">
					</a>
				</li>
			</ul>
		</div>
		<div class="tit-util">
			<h3 class="tit">극장 공지사항</h3>
			<div class="float-end">
				<a href="/support/notice.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="notice-list">
            <ul class="list">
                <li class="dep1">
                    <div class="leftInfo"><span class="sort">지점공지</span></div>
                    <div class="titInfo">
                        <p class="tit"><a href="#"> asd</a><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new"></p>
                    </div>
                    <div class="etc">
                        <ul class="clearFix">
                            <li class="date">
                                <span class="ico"><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_time.png" alt="time"></span>
                                <span>41분 전</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="leftInfo"><span class="sort">지점공지</span></div>
                    <div class="titInfo">
                        <p class="tit"><a href="#"> asd</a><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new"></p>
                    </div>
                    <div class="etc">
                        <ul class="clearFix">
                            <li class="date">
                                <span class="ico"><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_time.png" alt="time"></span>
                                <span>41분 전</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="leftInfo"><span class="sort">지점공지</span></div>
                    <div class="titInfo">
                        <p class="tit"><a href="#"> asd</a><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new"></p>
                    </div>
                    <div class="etc">
                        <ul class="clearFix">
                            <li class="date">
                                <span class="ico"><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_time.png" alt="time"></span>
                                <span>41분 전</span>
                            </li>
                        </ul>
                    </div>
                </li>
			</ul>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>