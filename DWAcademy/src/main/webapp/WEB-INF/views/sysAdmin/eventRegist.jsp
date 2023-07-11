<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sysAdminHeader.jsp" %>

<style>

#content h2 {
    margin: 30px 0 0;
    position: relative;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -1px;
    line-height: 1em;
    padding: 0 0 10px 10px;
}
#content h2:before {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 16px;
    background: #1a4e99;
    content: '';
}
.anchor {
    margin: 0 0 10px 0;
    height: 29px;
    background: url(/admin/img/tab_menu.gif) repeat-x 0 100%;
}
.anchor li {
    float: left;
    margin-right: -2px;
    line-height: 24px;
}
.anchor li, .anchor li a {
    background: url(/admin/img/bg_tab2_off.gif) no-repeat;
}
.anchor li {
    margin: 0;
    padding: 0;
    list-style: none;
}
.anchor li a {
    display: inline-block;
    padding: 2px 16px 2px;
    background-position: 100% 0;
    font-weight: 600;
    color: #666;
    text-decoration: none !important;
}
.anchor li, .anchor li a {
    background: url(/admin/img/bg_tab2_off.gif) no-repeat;
}
.anchor:after {
    display: block;
    visibility: hidden;
    clear: both;
    content: "";
}
.tbl_frm02 table {
    width: 70%;
}
.w180 {
    width: 180px !important;
}
.tbl_frm02 th {
    font-weight: 600;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 8px 14px;
    height: 22px;
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 8px 14px;
    height: 22px;
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
.fc_197 {
    color: #197fe0 !important;
}
.fc_red {
    color: #ec0e03 !important;
}
.frm_input, input[type=file] {
    height: 23px;
}
.frm_input {
    padding: 0 4px 1px 4px;
    font-size: 12px;
    font-weight: normal;
    border: 1px solid #ddd;
    background-color: #fff;
    border-radius: 0;
    -webkit-border-radius: 0;
}
.tbl_frm02 th {
    font-weight: 600;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 8px 14px;
    height: 22px;
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 8px 14px;
    height: 22px;
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
.sound_only {
    display: inline-block !important;
    position: absolute;
    top: 0;
    left: 0;
    margin: 0 !important;
    padding: 0 !important;
    font-size: 0;
    line-height: 0;
    border: 0 !important;
    overflow: hidden !important;
}

/* -------버튼---------------- */
.btn_confirm {
    margin-top: 20px;
    text-align: center;
}
.btn_confirm a, .btn_confirm input, .btn_confirm button {
    margin: 0 1.5px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_large {
    padding: 10px 21px;
    font-size: 15px;
    line-height: 1.222;
    font-weight: 600;
}


#c h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
#c h2 {
    margin: 30px 0 0;
    position: relative;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -1px;
    line-height: 1em;
    padding: 0 0 10px 10px;
}
#c h2:before {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 16px;
    background: #1a4e99;
    content: '';
}
#content {
	margin-left: 150px;
	margin-right:150px;
	padding-bottom: 100px;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}
</style>


 <style>
 .breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
}
.breadcrumb span {
    font-weight: 400;
}

 </style>
 <div class="breadcrumb">
	<span>HOME</span>&nbsp  &gt 이벤트관리 &gt 이벤트등록 
</div>
 


<div id="content">
<section id="anc_sitfrm_img">
<br>
<div id="c">
<h2>이벤트 등록 </h2>
</div>
<br><br>
<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
		
		<tr class="item_img_fld">
		<th scope="row">이미지 <span class="fc_197"></span></th>
		<td>
			<div class="item_file_fld">
				<input type="file" name="simg6">
							</div>
			<div class="item_url_fld" style="display: none;">
				<input type="text" name="simg6" value="" class="frm_input" size="80" placeholder="http://">
			</div>
		</td>
	</tr>
		<tr>
		<th scope="row">상세설명</th>
		<td>
			<textarea class="textarea" name="content" id="content1" rows="20" 
							placeholder="1000자 내외로 작성하세요." style="display: block; width:100%"></textarea>
		</td>
	</tr>
	
	</tbody>
	</table>
</div>
</section>

<div class="btn_confirm">
    <input type="submit" value="저장" class="btn_large" accesskey="s"></div>
<br>
</div>
</div>
<%@ include file="/WEB-INF/views/include/summernote.jsp" %>
<%@ include file="sysAdminFooter.jsp"%>