<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담톡</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<style>
.header.scrolled {
	background: #edf3f9;
}

.header {
	width: 100%;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 100;
}

.txtNode.system {
	margin-left: 54px;
}

.txtNode {
	position: relative;
	margin: 0 0 10px;
}

.txtNode.system .img {
	position: absolute;
	left: 0;
	top: 0;
	float: left;
	width: 40px;
	height: 40px;
	margin-left: -45px;
	text-indent: -9999px;
}

.txtNode.system .txt {
	float: left;
	max-width: 70%;
	border-radius: 2px 18px 18px 18px;
}

.txtNode.system .txt {
	background: #EDEDED;
	color: #333;
}

.txtNode .txt, .txtNode .txt2 {
	position: relative;
	clear: both;
	margin-top: 5px;
	padding: 11px 15px 12px 15px;
	line-height: 1.4;
	word-break: normal;
	word-wrap: break-word;
}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, dl, dt, dd, ol, ul, li, fieldset,
	form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td,
	article, aside, canvas, details, figcaption, figure, footer, header,
	hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	background: transparent;
	font-size: 100%;
	vertical-align: baseline;
	outline: 0;
	-webkit-text-size-adjust: none;
	-ms-text-size-adjust: none;
}

.txtNode.system .time.space {
	padding-left: 12px;
}

.txtNode.system .time {
	padding-left: 0;
}

.txtNode .time-right {
	display: inline-block;
	position: absolute;
	bottom: 10px;
	right: -52px;
	font-size: 11px;
}

.txtNode .time {
	clear: both;
	padding-top: 3px;
	font-size: 11px;
}

.txtNode .time, .txtNode .time-right, .txtNode .time-left {
	color: #999;
}

.top {
	display: table;
	width: 100%;
	height: 50px;
	padding: 0 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.top .title {
	display: table-cell;
	position: relative;
	padding-left: 8px;
}

.top .btn {
	display: table-cell;
	width: 28px;
	vertical-align: middle;
	padding-left: 8px;
	cursor: pointer;
}

.hide {
	display: none !important;
}

.top .btn_txt {
	display: table-cell;
	width: 72px;
	vertical-align: middle;
	padding-left: 8px;
	cursor: pointer;
}

.top .btn_txt span {
	display: inline-block;
	width: 72px;
	line-height: 1;
	padding: 7px 0 9px;
	text-align: center;
	font-weight: bold;
	border-radius: 5px;
}

.top .btn_txt span {
	background: #fff;
	color: #4aa8d8;
	border: 1px solid #4aa8d8;
}

.header.scrolled {
	-webkit-box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 2px 0
		rgba(0, 0, 0, 0.06), 0 1px 10px 0 rgba(0, 0, 0, 0.08);
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 2px 0
		rgba(0, 0, 0, 0.06), 0 1px 10px 0 rgba(0, 0, 0, 0.08);
	transition: padding .3s, box-shadow 1s ease;
}

.header:after {
	display: block;
	content: '';
	clear: both;
}

.top .title p {
	display: inline-block;
	position: absolute;
	top: 12px;
	margin-right: auto;
	margin-left: auto;
	width: 100%;
	font-size: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	box-sizing: border-box;
}

body {
	font-family: 'Malgun Gothic', 'Dotum', sans-serif;
	font-size: 14px;
	letter-spacing: -0.8px;
	line-height: 1.2;
	color: #111;
	word-break: break-all;
	word-wrap: break-word;
}

#contents {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
	overflow-y: auto;
}

.chatBox {
	position: relative;
	padding-top: 60px;
	padding-bottom: 56px;
}

.txtNode.user {
	margin-right: 10px;
}

.txtNode {
	position: relative;
	margin: 0 0 10px;
}

.txtNode.user .txt {
	float: right;
	max-width: 72%;
	border-radius: 18px 2px 18px 18px;
}

.txtNode.user .txt {
	background: #4aa8d8;
	color: #FCFCFC;
}

.txtNode .txt, .txtNode .txt2 {
	position: relative;
	clear: both;
	margin-top: 5px;
	padding: 11px 15px 12px 15px;
	line-height: 1.4;
	word-break: normal;
	word-wrap: break-word;
}

.txtNode.user .time.space {
	padding-right: 12px;
}

.txtNode.user .time {
	text-align: right;
	padding-right: 0;
}

.txtNode .time-left {
	display: inline-block;
	position: absolute;
	bottom: 10px;
	left: -52px;
	font-size: 11px;
}

.txtNode .time {
	clear: both;
	padding-top: 3px;
	font-size: 11px;
}

.txtNode .time, .txtNode .time-right, .txtNode .time-left {
	color: #999;
}

.txtNode:after {
	display: block;
	content: '';
	clear: both;
}

.txtNode.system {
	margin-left: 54px;
}

.txtNode {
	position: relative;
	margin: 0 0 10px;
}

.txtNode.system .img {
	position: absolute;
	left: 0;
	top: 0;
	float: left;
	width: 40px;
	height: 40px;
	margin-left: -45px;
	text-indent: -9999px;
}

.txtNode.system .txt {
	float: left;
	max-width: 70%;
	border-radius: 2px 18px 18px 18px;
}

.txtNode.system .txt {
	background: #EDEDED;
	color: #333;
}

.txtNode .txt, .txtNode .txt2 {
	position: relative;
	clear: both;
	margin-top: 5px;
	padding: 11px 15px 12px 15px;
	line-height: 1.4;
	word-break: normal;
	word-wrap: break-word;
}

.List {
	position: relative;
	clear: both;
	padding: 0 0 10px 54px;
}

.btntype.type1 {
	display: inline-block;
	width: 253px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.List .btntype {
	border-radius: 15px;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
}

.btntype.type1 {
	border: 1px solid #4aa8d8;
}

.List .btntype {
	background: #fff;
	border: 1px solid #b9d6ef;
}

ul, ol {
	list-style-type: none;
}

.List .btntype li:first-child {
	border-top: 0;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	-moz-border-top-left-radius: 15px;
	-moz-border-top-right-radius: 15px;
	-webkit-border-top-left-radius: 15px;
	-webkit-border-top-right-radius: 15px;
}

.List .btntype li {
	position: relative;
	text-align: left;
}

.List .btntype li {
	background: #fff;
	border-top: 1px solid #4aa8d8;
}

.sel {
	cursor: pointer;
}

.List .btntype li:last-child {
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
}

.List .btntype li .btn {
	display: block;
	padding: 15px;
	line-height: 1.3;
	cursor: pointer;
}

.List .btntype li .btn {
	color: #4aa8d8;
}

.btngroup {
	float: left;
	clear: both;
	margin-top: 10px;
}

.btngroup .back, .List .keyword .swiper-slide span.back, .inBody.keyword .swiper-slide span.back
	{
	border-color: #ccc;
	color: #666;
}

.btngroup .btn {
	cursor: pointer;
	display: block;
	float: left;
	margin-right: 5px;
	margin-bottom: 5px;
	padding: 7px 15px 8px;
	line-height: 1.3;
	background: #fff;
	border-radius: 50px;
}

.btngroup .btn {
	border: 1px solid #b9d6ef;
	color: #4b81b7;
}

.btngroup .btn .txtBtn {
	display: inline-block;
}

.btngroup:after {
	display: block;
	content: '';
	clear: both;
}

.txtNode.system .img img {
	display: block;
	max-width: 100%;
}

.btntype.type1 .card p {
	text-align: left;
	line-height: 1.6;
	word-break: normal;
	word-wrap: break-word;
	color: #000;
}

.List .btntype li:first-child {
	border-top: 0;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	-moz-border-top-left-radius: 15px;
	-moz-border-top-right-radius: 15px;
	-webkit-border-top-left-radius: 15px;
	-webkit-border-top-right-radius: 15px;
}

.btntype.type1 .card {
	position: relative;
	margin: 14px 15px 15px;
}

.List .btntype li.link {
	padding-right: 15px;
}

.List .btntype li:last-child {
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
}

.List .btntype li.link:after {
	display: block;
	content: '';
	position: absolute;
	right: 15px;
	top: 13px;
	width: 24px;
	height: 24px;
	background-size: 24px 24px;
	background-position: 5px 0;
}

.chatBox .line {
	position: relative;
	width: 100%;
	padding: 0 10px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.chatBox .line .end_txt {
	display: table;
	width: 100%;
	font-size: 13px;
	color: #999;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.chatBox .line .end_txt:before {
	display: table-cell;
	content: '';
	position: absolute;
	top: 24px;
	left: 10px;
	width: 25%;
	height: 1px;
	z-index: 1;
}

.chatBox .line .end_txt:before {
	background: #b9c3cc repeat-x;
}

.chatBox .line .end_txt {
	display: table;
	width: 100%;
	font-size: 13px;
	color: #999;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.chatBox .line .end_txt div {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.chatBox .line .end_txt:after {
	display: table-cell;
	content: '';
	position: absolute;
	top: 25px;
	left: 10px;
	width: 25%;
	height: 1px;
	z-index: 1;
}

.chatBox .line .end_txt:after {
	background: #e9f1f7 repeat-x;
}

.chatBox .line .end_txt div:before {
	display: table-cell;
	content: '';
	position: absolute;
	top: 24px;
	right: 10px;
	width: 25%;
	height: 1px;
	z-index: 1;
}

.chatBox .line .end_txt div:before {
	background: #b9c3cc repeat-x;
}

.chatBox .line .end_txt div span {
	display: inline-block;
	position: relative;
	z-index: 2;
	width: 45%;
	line-height: 1.5em;
	vertical-align: middle;
}

.chatBox .line .end_txt span {
	background: transparent;
}

.chatBox .line .end_txt div:after {
	display: table-cell;
	content: '';
	position: absolute;
	top: 25px;
	right: 10px;
	width: 25%;
	height: 1px;
	z-index: 1;
}

.chatBox .line .end_txt div:after {
	background: #e9f1f7 repeat-x;
}
.chatBox .btn_end.type2 {
    margin-bottom: 20px;
}
.chatBox .btn_end {
    text-align: center;
}
.chatBox .btn_end div {
    display: inline-block;
    margin: 0 3px;
}
.chatBox .btn_end .btn {
    display: inline-block;
    width: 131px;
    height: 42px;
    line-height: 40px;
    border-radius: 50px;
    font-weight: bold;
    text-align: center;
}
.chatBox .btn_end .btn {
    background: #fff;
    border: 1px solid #4aa8d8;
    color: #4aa8d8;
}

.chatBox .btn_end .btn {
    display: inline-block;
    width: 131px;
    height: 42px;
    line-height: 40px;
    border-radius: 50px;
    font-weight: bold;
    text-align: center;
}
.chatBox .btn_end .btn {
    background: #fff;
    border: 1px solid #4aa8d8;
    color: #4aa8d8;
}
.txtNode .txt .loading2 {
    margin: 4px auto;
    width: auto;
}
.loading2 {
    width: 44px;
    margin: 30px auto;
    position: relative;
}
.loading2 p {
    display: flex;
    vertical-align: middle;
    text-align: center;
}
.loading2 p .ico {
    display: inline-block;
    width: 44px;
    height: 14px;
    background: url(<%=request.getContextPath()%>/resources/img/loading.gif) center;
    background-size: 100%;
    text-indent: -9999px;
}
em, address, i {
    font-style: normal;
}
.List .btntype .disabled {
    background: #ededed;
    cursor: default;
    pointer-events: none;
}
</style>
</head>
<body>
	<div class="header scrolled" id="header">
		<div class="top moving-grad-top" id="headerTalk">
			<h1 class="title">
				<p>상담톡</p>
			</h1>
			<div class="btn_txt close">
				<span class="ico">상담종료</span>
			</div>
		</div>
	</div>
	<div id="contents">

		<!-- chatBox -->
		<div class="chatBox" id="chatBox">

		</div>
		<!-- //chatBox -->

	</div>
<%@ include file="consult_js.jsp" %>
</body>
</html>