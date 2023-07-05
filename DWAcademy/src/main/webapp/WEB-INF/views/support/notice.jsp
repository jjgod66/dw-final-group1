<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<div class="sub_visual">
    <h3>공지사항</h3>
    <h6>support notice</h6>
</div>
<div class="notice-wrapper">
    <div class="container">
        <div class="board-header">
            <div class="board-nav">
                <ul>
                    <li><a href="#" class="active">전체</a></li>
                    <li><a href="#">DW시네마 공지</a></li>
                    <li><a href="#">지점공지</a></li>
                </ul>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
        </div>
        <div class="board-body">
            <article class="card">
                <a href="<%=request.getContextPath()%>/support/notice_view.do" class="">
                <div class="card__thumb"><svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">공지사항 배너</text></svg></div>
                <div class="card__info">
                    <div class="card__category">
                        <span  style="color: #333;">DW시네마</span>
                    </div>
                    <div class="card__title">
                        <p>게시물 제목</p>
                    </div>
                    <div class="card__content">게시물 내용</div>
                    <div class="card__date">2023.07.03</div>
                </div>
                </a>
            </article>
            <article class="card">
                <a href="<%=request.getContextPath()%>/support/notice_view.do" class="">
                <div class="card__thumb"><svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">공지사항 배너</text></svg></div>
                <div class="card__info">
                    <div class="card__category">
                        <span  style="color: #333;">지점공지</span>
                    </div>
                    <div class="card__title">
                        <p>게시물 제목</p>
                    </div>
                    <div class="card__content">게시물 내용</div>
                    <div class="card__date">2023.07.03</div>
                </div>
                </a>
            </article>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>