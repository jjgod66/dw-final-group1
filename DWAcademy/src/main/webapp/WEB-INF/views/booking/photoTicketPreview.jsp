<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포토티켓 미리보기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
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
#contents {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
	overflow-y: auto;
}
* {
    -webkit-print-color-adjust: exact !important;   /* Chrome, Safari, Edge */
    color-adjust: exact !important;                 /*Firefox*/
}
</style>
</head>
<body>
<div class="header scrolled" id="header">
	<div class="top moving-grad-top" id="headerTalk">
		<h1 class="title">
			<p>포토티켓 미리보기</p>
		</h1>
		<div class="btn_txt close">
			<span class="ico" id="printBtn">프린트</span>
		</div>
	</div>
</div>
<div id="contents">
	<div class="" style="margin: 40px 0; padding: 60px 170px 0 170px;">
		<div style="float: left; display: inline;">
			<div class="card" style="width: 275px; height: 425px; float: left; background-repeat: no-repeat; background-size: cover;  background-image: url('<%=request.getContextPath() %>/common/getPicture.do?name=${photoTicket.front_path }&type=front');" >
			
			</div>
<!-- 			<div style="text-align: center;">앞면</div> -->
		</div>
		<div style="float: right; display: inline;">
			<div class="card" style="width: 275px; height: 425px; float: right; padding: 10px; background-repeat: no-repeat; background-size: cover;  background-image: url('<%=request.getContextPath() %>/common/getPicture.do?name=${photoTicket.back_path }&type=back');" id="back" >
				<div class="card-body">
				
				</div>
			</div>
<!-- 			<div style="text-align: center;">뒷면</div> -->
		</div>
	</div>
</div>
<script>
let pt_cd = '${photoTicket.pt_cd}';
$(function(){
	function printPageArea(areaID){
		var printContent = document.getElementById(areaID).innerHTML;
	    var originalContent = document.body.innerHTML;
	    document.body.innerHTML = printContent;
	    window.print();
	    document.body.innerHTML = originalContent;
	}
	
	$('#header').on('click', '#printBtn', function(){
		printPageArea('contents');
		$.ajax({
			url : '<%=request.getContextPath()%>/photoTicket/print.do',
			data : {'pt_cd' : pt_cd},
			method : 'post',
			success : function(res){
				console.log(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
})


</script>
</body>
</html>