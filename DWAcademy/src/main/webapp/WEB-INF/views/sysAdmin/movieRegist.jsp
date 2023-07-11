<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sysAdminHeader.jsp" %>
    
    
<style>
.breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
        font-size: 12px;
}
#content {
	margin-left: 150px;
	margin-right:150px;
	padding-bottom: 100px;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.s_wrap {
    margin: 30px 25px;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
h1, h2, h3, h4, h5, h6 {
    font-size: 1em;
    font-weight: 600;
}
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
.tbl_frm01 {
    border-top: 1px solid #888;
}
.tbl_frm01 table {
    width: 100%;
}
.w180 {
    width: 180px !important;
}
.tbl_frm01 th {
    font-weight: 600;
}
.tbl_frm01 th, .tbl_frm01 td {
    padding: 8px 14px;
    height: 23px;
    border-bottom: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
table th {
    background-color: #f8f8f8;
    white-space: nowrap;
    text-overflow: ellipsis;
    line-height: 1.3em;
}

.tbl_frm01 td label {
    margin-right: 7px;
}
.banner_or_img {
    margin: 5px 0 0;
}
.frm_info {
    display: block;
    padding-top: 5px;
    line-height: 1.4em;
}
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
body, div, table, th, td, pre, blockquote {
    font-size: 12px;
}
.tbl_frm02 table {
    width: 100%;
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
table th {
    background-color: #f8f8f8;
    white-space: nowrap;
    text-overflow: ellipsis;
    line-height: 1.3em;
}
.required, textarea.required {
    background: url(/img/wrest.gif) top right no-repeat;
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
</style>  
    
<div id="wrapper">
	<div id="content">
		 <div class="breadcrumb">
			<span>HOME</span>&nbsp  &gt 영화관리 &gt 영화등록  
		 </div>
		 
		 <!-- ########영화관리 ############ -->
		 
<div class="s_wrap">
	<h1>영화관리</h1>
	
<form name="flogo" method="post" action="./design/logo_update.php" enctype="MULTIPART/FORM-DATA">
<input type="hidden" name="token" value="">



<!-- ########기본정보 입력  ############ -->

<section id="anc_sitfrm_ini">
<h2>기본정보</h2>
<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	<tr>
			<th scope="row" style="text-align: center;">포스터</th>
			<td>
				<input type="file" name="" id="sns_logo">
				<input type="checkbox" name="sns_logo_del" value="1" id="sns_logo_del">
				<label for="sns_logo_del">삭제</label>
					<div class="banner_or_img">
						<img src="http://demofran.com/data/banner/PC6g1NMhDVSjEVxesJjMAkWQDTmpsr.jpg">
					</div>
				<span class="frm_info fc_125"> 440.667사이즈    </span>		
			</td>
		</tr>
	<tr>
		<th scope="row">제목</th>
		<td>
			<input type="text" name="" value="" id="mb_id" required="" itemname="제목" class="required frm_input" style="background-position: right top; background-repeat: no-repeat;">
		</td>
	</tr>
	<tr>
		<th scope="row">감독</th>
		<td>
			<input type="text" name="" value="" required="" itemname="감독" class="required frm_input" style="background-position: right top; background-repeat: no-repeat;">
					</td>
	</tr>
	<tr>
		<th scope="row">영화소개</th>
		<td><input type="text" name="" value="" required="" itemname="영화소개" class="required frm_input" size="80" style="background-position: right top; background-repeat: no-repeat;"></td>
	</tr>
	
	<tr>
		<th scope="row">러닝타임</th>
		<td>
			<input type="text" name="" value="" class="frm_input wfull"> 분
	</tr>
	<tr>
		<th scope="row">장르</th>
		<td>
			<select name="">
				<option value="">선택  </option>
				<option value="">판타지 </option>
				<option value="">코미디 </option>
				<option value="">스릴러 </option>
				<option value="">공포,호러  </option>
				<option value="">가족 </option>
				<option value="">SF </option>
				<option value="">액션  </option>
				<option value="">전쟁  </option>
				<option value="">로맨스  </option>
				<option value="">드라마 </option>
				<option value="">미스터리 </option>
				<option value="">무협 </option>
				<option value="">성인물  </option>
				<option value="">애니메이션 </option>
				<option value="">범죄 </option>
				<option value="">서부극  </option>
				<option value="">사극  </option>
				<option value="">다큐멘터리  </option>
				<option value="">어드벤처 </option>
				<option value="">기타   </option>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">관람등급 </th>
		<td>
			<select name="">
				<option value="">선택  </option>
				<option value="">전체이용가  </option>
				<option value="">15세이용가 </option>
				<option value="">19세이용가  </option>
				<option value="">12세이용가 </option>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">상영종료일 </th>
		<td><input type="text" name="" value="" class="frm_input"></td>
	</tr>
	<tr>
		<th scope="row">출연진 </th>
		<td><input type="text" name="" value="" required="" itemname="출연진" class="required frm_input" size="80" style="background-position: right top; background-repeat: no-repeat;"></td>
	</tr>
	
	
	<tr>
		<th scope="row">상영타입 </th>
		<td class="td_label">
			<label><input type="radio" name="isopen" value="1" checked="checked"> 더빙 </label>
			<label><input type="radio" name="isopen" value="2"> 자막 </label>
			<label><input type="radio" name="isopen" value="3"> 2D</label>
			<label><input type="radio" name="isopen" value="4"> 3D </label>
		</td>
	</tr>
	<tr>
		<th scope="row">관련사진 </th>
		<td> 
			<input type="file" name="" id="sns_logo">
		</td>
	</tr>
	<tr>
		<th scope="row">예고편 </th>
		<td> 
			<input type="file" name="" id="sns_logo">
		</td>
	</tr>
	</tbody>
	</table>
</div>
</section>


<div class="btn_confirm">
	<input type="submit" value="저장" class="btn_large" accesskey="s">
</div>
</form>

<script>
function user_chage(mb_id){
	location.href = tb_admin_url+'/design.php?code=logo&mb_id='+mb_id;
}
</script></div>		 
		 
		 
		 
		 <!-- #################### -->
	</div>
</div>
    
    
<%@ include file="sysAdminFooter.jsp"%>